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
    
    var shop_type = Request.query.shop_type;
    var start = Request.query.start || 0;
    var add = Request.query.add || 10;
    let sql = `SELECT passage_id,title,imgurl,publish_time ,browse_sum FROM passages WHERE show_status = 0
    ORDER BY show_top , publish_time DESC LIMIT ${start},${add}`;
    console.log('get passage sql: ',sql);
    mysql.query(sql).then(resset =>{

        console.log('获取到passage信息:',resset);
        Response.send({
            code:200,
            passages:resset
        })
    }).catch(error =>{
        console.log('获取passage发生错误',error)
    })
})

//获取详情
router.use('/detail',(Request, Response) => {
    console.log('get passage  Info:->',Request.query)
    let id = Request.query.id;
    let sessionkey = Request.query.sessionkey;
    let sql = `SELECT * FROM passages WHERE passage_id = ${id}`

    mysql.query(sql).then(res => {
        console.log('从数据库passages info:', res)

        // 因为这里就只有一条数据，所以直接返回res[0]
        Response.send({
            code: 200,
            passage: res[0]
        });
        let sql2 =`UPDATE passages SET browse_sum = browse_sum+1 WHERE passage_id = ${id}`
        mysql.query(sql2).then(result =>{console.log('更新borwse数目')})
    }).catch(err => {
        console.log("err详情信息:", err)
        Response.send({
            code: 500,
            msg: '程序员删库跑路去了'
        })
    })
})
//是否点赞收藏
router.use('/own',(Request, Response) => {
    
    let id = Request.query.id;
    let sessionkey = Request.query.sessionkey;

})
// 添加新material
router.use('/add',(Request,Response)=>{
    console.log(Request.query);
    console.log('body: ',Request.body)
    let title = Request.body.title;
    let imgurl = Request.body.imgurl;
    let sessionkey = Request.body.sessionkey;
    let editor_msg = Request.body.editor_msg;
    let now = new Date();
    //处理editor_msg 为json
    let detail_json = JSON.stringify({detail:editor_msg});
    let sql = `INSERT INTO passages(publish_time,publish_user,title,detail,imgurl) VALUES(?,?,?,?,?);`
    getopenid(sessionkey,openid =>{
        if(!openid){
            console.log('获取openid错误');
            Response.send({
                code:403,
                msg:'登录过期'
            })
            
        } else{
            let par = [now,openid,title,detail_json,imgurl];
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
                    msg:error.message
                })
            })
        }
    })
})

router.use('/delete',(Response,Request)=>{
    let sessionkey = Response.query.sessionkey;
    let id = Response.query.id;
    let sql = `UPDATE passages SET show_status = 1 WHERE passage_id = ?`
    let par = [id];
    mysql.update(sql,par).then(result =>{
        console.log('删除结果',result)
        Request.send({
            code:200,
            msg:'删除成功'
        })
    }).catch(error=>{
        Request.send({
            code:503,
            msg:'删除时错误!'
        })
        console.log('删除错误: ',error)
    })
})

module.exports = router;
