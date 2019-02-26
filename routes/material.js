const express = require('express');
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid');
const silly_time = require('silly-datetime');
const bodyParser = require('body-parser');

var router = express.Router();

router.use('/list',(Request,Response)=>{
    let sql = `SELECT * FROM material_kinds`;
    mysql.query(sql).then(resset =>{
        Response.send({
            code:200,
            list:resset
        })
    })
})
// 添加新material
router.use('/add',(Request,Response)=>{
    console.log(Request.query);
    let brief = Request.query.brief;
    let kinds = Request.query.kinds;
    let title = Request.query.title;
    let sessionkey = Request.query.sessionkey;
    let link = Request.query.link;
    let now = new Date();
    let sql = `INSERT INTO material(title,publish_time ,publish_user,brief,link,kinds) VALUES(?,?,?,?,?,?)`
    getopenid(sessionkey,openid =>{
        if(!openid){
            console.log('获取openid错误');
            return;
        }
        
        let par = [title,now,openid,brief,link,kinds];
        console.log('par:   ',par)
        mysql.insert(sql,par).then(result=>{
            console.log('插入成功',result)
            Response.send({
                code:200,
                msg:'插入成功'  
            })
        }).catch(error =>{
            console.error('插入失败',error);
        })
    })
})
router.use('/addkinds',(Request,Response)=>{
    let newkinds = Request.query.newkinds;

    let sql = `INSERT INTO material_kinds(kinds) VALUES(?)`;
    let par = [newkinds];
    mysql.insert(sql,par).then(result =>{
        Response.send({
            code:200,
            msg:'插入新分类成功'
        })
    }).catch(error =>{
        console.log('插入新分类失败: ',error);
    })
})
//删除分类

router.use('/deletekinds',(Request,Response)=>{
    let kinds = Request.query.kinds;

    let sql = `DELETE FROM material_kinds WHERE kinds = '${kinds}'`;
    let par = [kinds];
    mysql.query(sql).then(result =>{
        Response.send({
            code:200,
            msg:'删除分类成功'
        })
    }).catch(error =>{
        console.log('删除分类失败: ',error);
    })
})


router.use('/search',(Request,Response) =>{
    console.log('search: ',Request.query);
    let kinds = Request.query.kinds;
    let text = Request.query.text;
    let start = Request.query.start||0;
    let add = Request.query.add||10;
    let sql = '';
    if(kinds !="null"){
        sql = `SELECT nickName,gender,avatarUrl,id,title,publish_time,detail,brief, kinds,link,save_num ,show_publish FROM material LEFT JOIN \`user\` ON  openid=publish_user
         WHERE  show_status = 0 AND kinds = '${kinds}' LIMIT ${start} ,${add}`
    } else if(text != "null"){
        sql = `SELECT nickName,gender,avatarUrl,id,title,publish_time,detail,brief, kinds,link,save_num ,show_publish FROM material LEFT JOIN \`user\` ON  openid=publish_user
         WHERE  show_status = 0 AND ( brief LIKE '%${text}%' OR title LIKE '%${text}%') LIMIT ${start} ,${add}`
    }
    console.log('sql: ',sql);
    mysql.query(sql).then(resset =>{
        Response.send({
            code:200,
            materials:resset
        })
    }).catch(error =>{
        Response.send({
            code:503,
            msg:'数据库错误'
        })
        console.error('查询search错误: ',error);
    })
})

router.use('/delete',(Response,Request)=>{
    let sessionkey = Response.query.sessionkey;
    let id = Response.query.id;
    let sql = `UPDATE material SET show_status = 1 WHERE id = ?`
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
// 增加保存量
router.use('/save',(Response,Request)=>{
    console.log('save: ',Response.query);
    let sessionkey = Response.query.sessionkey;
    let id = Response.query.id;
    let sql = `UPDATE material SET save_num = save_num + 1 WHERE id = ?`
    let par = [id];
    mysql.update(sql,par).then(result =>{
        console.log('保存结果',result)
        Request.send({
            code:200,
            msg:'保存成功'  
        })
    }).catch(error=>{
        Request.send({
            code:503,
            msg:'保存时错误!'
        })
        console.log('删除错误: ',error)
    })
})

module.exports = router;