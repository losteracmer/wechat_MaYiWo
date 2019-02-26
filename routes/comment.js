const express = require('express');
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid');
const silly_time = require('silly-datetime');
const bodyParser = require('body-parser');

var router = express.Router();

//获取评论
router.use('/list', (Request, Response) => {
    let sessionkey = Request.query.sessionkey;
    let comment_id = Request.query.comment_id;
    let comment_type = Request.query.comment_type;
    getopenid(sessionkey, openid => {
        if (!openid) {
            Response.send({
                code: 403,
                msg: '登录过期'
            })
        } else {
            let sql = `SELECT user_comment.id,nickName ,avatarUrl ,comment_time,comment_text,comment_like,user_comment.comment_id ,like_status 
            FROM user,user_comment LEFT JOIN (SELECT * FROM comment_like WHERE like_user = '${openid}') AS likes ON user_comment.id = likes.comment_id 
            WHERE comment_user = openid AND comment_type = '${comment_type}' AND user_comment.comment_id = ${comment_id} ORDER BY comment_like DESC,comment_time`;
            mysql.query(sql).then(resset => {
                console.log(resset)
                resset.map(item => {
                    if (item.like_status == 0)
                        item.like = true;
                    else item.like = false;
                })
                Response.send({
                    code: 200,
                    comments: resset
                })
            }).catch(error =>{
                console.error('出现错误:',error);
            })
        }
    })

})

//点赞接口
router.use('/like', (Request, Response) => {
    console.log(Request.query)
    let sessionkey = Request.query.sessionkey;
    let id = Request.query.id;
    getopenid(sessionkey, openid => {
        if (!openid) {
            Response.send({
                code: 403,
                msg: '登录过期'
            })
        } else {
            //检查是否赞过
            let checkSql = `SELECT * FROM comment_like WHERE comment_id = ${id} AND like_user = '${openid}'`
            mysql.query(checkSql).then(resset =>{
                if(resset.length == 0){
                    let now = new Date();
                    let sql = `INSERT INTO comment_like(comment_id,like_user,like_time,like_status) VALUES(?,?,?,?);`;
                    let par = [id,openid,now,0];
                    mysql.insert(sql,par).then(result =>{
                        console.log(result.affectedRows == 1);
                        Response.send({
                            code:200,
                            msg:'success!'
                        })
                    }).catch(err =>{
                        console.log('插入like err',err)
                    })
                } else {
                        let status = resset[0].like_status?0:1;
                        let sql = `UPDATE comment_like SET like_status = ? WHERE like_user = ? AND comment_id = ?;`
                        let par = [status,openid,id];
                        mysql.update(sql,par).then(result =>{
                            if(status == 0){
                                Response.send({
                                    status:status,
                                    code:200,
                                    msg:'点赞成功'
                                })
                            } else {
                                Response.send({
                                    status:status,
                                    code:200,
                                    msg:'取消点赞成功'
                                })
                            }

                        }).catch(error =>{
                            console.log(error)
                            Response.send({
                                code:200,
                                msg:"点赞失败"
                            })
                        })

                }
            }).catch(error =>{
                console.log(error)
                Response.send({
                    code:200,
                    msg:"点赞失败"
                })
            })




        }
    })
})


//评论
router.use('/comment', (Request, Response) => {
    let sessionkey = Request.query.sessionkey;
    let comment = Request.query.comment;
    let comment_type = Request.query.comment_type;
    let id = Request.query.id;

    getopenid(sessionkey,openid =>{
        if(!openid){
            Response.send({
                code:403,
                msg:'登录过期'
            })
        }else {
            let sql = `INSERT INTO user_comment(comment_type,comment_id,comment_user,comment_time,comment_text) 
            VALUES(?,?,?,?,?);`
            let par = [comment_type,id,openid,new Date(),comment];
            mysql.insert(sql,par).then(result =>{
                Response.send({
                    code:200,
                    msg:'评论成功'
                })
            }).catch(error =>{
                Response.send({
                    code:503,   
                    msg:'发生错误'
                })
            })
        }
    })
})
module.exports = router;