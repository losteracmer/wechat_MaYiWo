const express = require('express');
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid');
const silly_time = require('silly-datetime');
const bodyParser = require('body-parser');

var router = express.Router();
router.use(bodyParser.json())
//获取列表
router.use('/list',(Request,Response)=>{
    console.log('---get.query  ',Request.query);
    var sessionkey = Request.query.sessionkey;
    var location = Request.query.location;
    var job_kind = Request.query.job_kind;
    var sort = Request.query.sort;
    var start = Request.query.start || 0;
    var add = Request.query.add || 10;
    let sql = `SELECT * FROM job WHERE show_status = 0 `;
    if(location && location!='null'){
        sql = sql + `AND job_location = '${location}' `;
    }
    if(job_kind && job_kind!='null'){
        sql = sql + `AND job_kind = '${job_kind}' `;
    }
    if(sort && sort!='null'){
        if(sort == '发布日期')
        sql = sql + `ORDER by publish_time DESC `;
    }
    sql = sql + `LIMIT ${start},${add} `;
    mysql.query(sql).then(resset =>{
        console.log('SQL:  ',sql)
        console.log('获取到jobs信息:',resset);
        Response.send({
            code:200,
            jobs:resset
        })
    }).catch(error =>{
        console.log('获取lost发生错误',error)
        Response.send({
            code:503,
            msg:error.message
        })
    })
})
//获取分类
router.use('/kinds',(Request,Response)=>{
    let sql = `SELECT DISTINCT job_kind FROM job`;
    mysql.query(sql).then(resset =>{
        let sql2 = `SELECT DISTINCT job_location FROM job`
        mysql.query(sql2).then(resset2 =>{
            Response.send({
                code:200,
                location:resset2,
                job_kind:resset
            })
        }).catch(error=>{
            console.log(error);
            Response.send({
                code:503,
                msg:error.message
            })
        })
    }).catch(error =>{
        console.log(error);
        Response.send({
            code:503,
            msg:error.message
        })
    })
})
//获取详情
router.use('/detail',(Request, Response) => {
    console.log('get shop  Info:->',Request.query)
    let id = Request.query.id;
    let sessionkey = Request.query.sessionkey;
    let sql = `SELECT * FROM job WHERE job_id = ${id}`

    mysql.query(sql).then(res => {
        console.log('job info:', res)

        // 因为这里就只有一条数据，所以直接返回res[0]
        Response.send({
            code: 200,
            job: res[0]
        });
        //添加浏览次数
        let addsql = `UPDATE job SET browse_sum = browse_sum + 1 WHERE job_id = ${id} `
        mysql.query(addsql).then(result =>{
            console.log('add browse_sum affectedRows : ',result.affectedRows)
        }).catch(error =>{
            console.log('add browse_sum error : ',error)
        })
    }).catch(err => {
        console.log("err详情信息:", err)
        Response.send({
            code: 500,
            msg: err.message
        })
    })
})
//是否点赞收藏
router.use('/own',(Request, Response) => {
    
    let id = Request.query.id;
    let sessionkey = Request.query.sessionkey;

})

//同步个人简历信息
router.use('/tend',(Request, Response) => {
    console.log('query: ',Request.query);
    let sessionkey = Request.query.sessionkey;
    var userInfo = JSON.parse(Request.query.userInfo);
    let job_id = Request.query.job_id;
    console.log('简历信息：',userInfo);
    getopenid(sessionkey,openid =>{
        console.log('得到的openid is ',openid)
        if(! openid){
            Response.send({
                code:403,
                msg:'请重新登录'
            })
        } else {
            let sql = `UPDATE user SET faculty=?,mobile=?,qq=?,realname=?,school=?,specialty=?,wechat=? WHERE openid  = '${openid}'`
            let param = [userInfo.faculty,userInfo.mobile,userInfo.qq,userInfo.realname,userInfo.school,userInfo.specialty,userInfo.wechat];
            console.log('param:',param)
            mysql.update(sql,param).then(result=>{
                let sql2 = `INSERT INTO job_apply(job_id,apply_user,apply_time) VALUES(?,?,?);`
                let par2 = [job_id,openid,new Date()];

                mysql.insert(sql2,par2).then(result =>{
                    Response.send({
                        code:200,
                        msg:'申请成功，请等待回复哦'
                    })
                }).catch(error =>{
                    console.log('sync user Info fail:',error)
                    Response.send({
                        code:404,
                        msg:'数据库错误'
                    })
                })
            }).catch(error=>{
                console.log('sync user Info fail:',error)
                Response.send({
                    code:404,
                    msg:'数据库错误'
                })
            })
        }
    })

})
// 添加新job
router.use('/add',(Request,Response)=>{
    console.log(Request.query);
    console.log('body: ',Request.body)
    let job_address = Request.body.jobInfo.job_address;
    let job_brief = Request.body.jobInfo.job_brief;
    let job_indate = Request.body.jobInfo.job_indate;
    let job_kind = Request.body.jobInfo.job_kind;
    let job_location = Request.body.jobInfo.job_location;
    let job_mobile = Request.body.jobInfo.job_mobile;
    let job_time = Request.body.jobInfo.job_time;
    let job_wage = Request.body.jobInfo.job_wage;
    let job_wage_kind = Request.body.jobInfo.job_wage_kind;
    let title = Request.body.jobInfo.title;
    let now = new Date();
    
    let sql = `INSERT INTO job( publish_time,title,job_location,job_address,job_kind,job_time,job_wage,job_wage_kind,job_indate,job_brief,job_mobile) 
    VALUES(?,?,?,?,?,?,?,?,?,?,?);`
    let par = [now,title,job_location,job_address,job_kind,job_time,job_wage,job_wage_kind,job_indate,job_brief,job_mobile];

    console.log('par:   ',par)
    mysql.insert(sql,par).then(result=>{
        console.log('插入成功',result)
        Response.send({
            code:200,
            msg:'插入成功'  
        })
    }).catch(error =>{
        console.error('插入失败',error);
        Response.send({
            code:503,
            msg:error
        })
    })
        
})

router.use('/delete',(Request,Response)=>{
    let sessionkey = Request.query.sessionkey;
    let id = Request.query.id;
    let sql = `UPDATE job SET show_status = 1 WHERE job_id = ?`
    let par = [id];
    mysql.update(sql,par).then(result =>{
        console.log('删除结果',result)
        Response.send({
            code:200,
            msg:'删除成功'
        })
    }).catch(error=>{
        Response.send({
            code:503,
            msg:'删除时错误!'
        })
        console.log('删除错误: ',error)
    })
})


//获取申请人信息
router.use('/getapply',(Request,Response)=>{

    let start = Request.query.start||0;
    let add = Request.query.add||10;
    let sql = `SELECT apply_time,nickName,avatarUrl,
    apply_id,realname,mobile,wechat,school,qq,specialty,faculty ,
    title,job_location,job.job_id,job_address,job_kind,job_time,job_wage,job_wage_kind,job_indate,job_brief,job_mobile 
    FROM job_apply , \`user\`,job 
    WHERE \`user\`.openid = job_apply.apply_user 
    AND job.job_id = job_apply.job_id ORDER BY apply_time LIMIT ${start},${add}`;

    mysql.query(sql).then(resset =>{
        Response.send({
            code:200,
            jobapplys:resset
        })
    }).catch(error =>{
        console.error(error);
    })
})

module.exports = router;

