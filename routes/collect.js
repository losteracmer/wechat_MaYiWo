const express = require('express');
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid');
const silly_time = require('silly-datetime');
const bodyParser = require('body-parser');

var router = express.Router();



//收藏
router.use('/collect', (Request, Response) => {
    let sessionkey = Request.query.sessionkey;
    let collect_type = Request.query.collect_type;
    let id = Request.query.id;

    getopenid(sessionkey, openid => {
        if (!openid) {
            Response.send({
                code: 403,
                msg: '登录过期'
            })
        } else {
            //检查
            let checkSql = `SELECT * FROM user_collect WHERE collect_id = ${id} AND collect_user = '${openid}'`
            mysql.query(checkSql).then(resset => {
                if (resset.length == 0) {
                    let sql = `INSERT INTO user_collect(collect_type,collect_id,collect_user,collect_time) 
                    VALUES(?,?,?,?);`
                    let par = [collect_type, id, openid, new Date()];
                    mysql.insert(sql, par).then(result => {
                        Response.send({
                            code: 200,
                            msg: '收藏成功'
                        })
                    }).catch(error => {
                        Response.send({
                            code: 503,
                            msg: '发生错误'
                        })
                    })
                } else {
                    let status = resset[0].collect_status ? 0 : 1;
                    let sql = `UPDATE user_collect SET collect_status = ? WHERE collect_user = ? AND collect_id = ?;`
                    let par = [status, openid, id];
                    mysql.update(sql, par).then(result => {
                        if (status == 0) {
                            Response.send({
                                status: status,
                                code: 200,
                                msg: '收藏成功'
                            })
                        } else {
                            Response.send({
                                status: status,
                                code: 200,
                                msg: '取消收藏成功'
                            })
                        }

                    }).catch(error => {
                        console.log(error)
                        Response.send({
                            code: 200,
                            msg: "收藏失败"
                        })
                    })
                }
            }).catch(error => {
                console.log(error)
                Response.send({
                    code: 200,
                    msg: "收藏失败"
                })
            })
        }
    })
})
module.exports = router;