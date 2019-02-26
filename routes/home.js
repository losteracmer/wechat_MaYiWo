const express = require('express');
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid');
const silly_time = require('silly-datetime');
const bodyParser = require('body-parser');

var router = express.Router();

router.use('/swiper', (Request, Response) => {
    let sql = `SELECT * FROM home_swiper WHERE show_status = 0`;
    mysql.query(sql).then(resset => {

        console.log('获取到swiper信息:', resset);
        Response.send({
            code: 200,
            swipers: resset
        })
    }).catch(error => {
        console.log('获取swiper发生错误', error)
    })
})
router.use('/module', (Request, Response) => {
    let version = Request.query.version;
    let sql ;
    if(version == 1){
        sql =`SELECT * FROM home_modules WHERE show_status = 2 `;
    }else {
        sql = `SELECT * FROM home_modules WHERE show_status = 0 or show_status = 2`;
    }
    
    mysql.query(sql).then(resset => {

        console.log('获取到module信息:', resset);
        Response.send({
            code: 200,
            modules: resset
        })
    }).catch(error => {
        console.log('获取module发生错误', error)
    })
})
router.use('/updateswiper', (Request, Response) => {
    let sessionkey = Request.query.sessionkey;
    let swiperid = Request.query.swiperid;
    let authority = Request.query.authority;
    let text = Request.query.text;
    let url = Request.query.url;
    let pagetype = Request.query.pagetype;
    let id = Request.query.id || 0;
    let src = Request.query.src;

    let sql = `UPDATE home_swiper SET text = ? ,url = ? ,pagetype = ? , id = ?, src = ? WHERE swiperid = ?`;
    let par = [text, url, pagetype, id, src, swiperid];
    mysql.update(sql, par).then(result => {
        console.log('更新swiper 结果', result)
        Response.send({
            code: 200,
            msg: '更新成功成功'
        })

    }).catch(err => {
        console.log('更新异常:', err);
        Response.send({
            code: 503,
            msg: err.sqlMessage
        })
    })
})

router.use('/deleteswiper', (Request, Response) => {
    let sessionkey = Request.query.sessionkey;
    let swiperid = Request.query.swiperid;
    let authority = Request.query.authority;

    let sql = `UPDATE home_swiper SET show_status = ? WHERE swiperid = ?`;
    let par = [1, swiperid];
    mysql.update(sql, par).then(result => {
        console.log('删除结果', result)
        Response.send({
            code: 200,
            msg: '删除成功'
        })

    }).catch(err => {
        console.log('删除异常:', err);
    })
})

router.use('/addswiper', (Request, Response) => {
    let sessionkey = Request.query.sessionkey;
    let swiperid = Request.query.swiperid;
    let authority = Request.query.authority;
    var newswiper = {
        text: '新添加',
        url: 'void',
        pagetype: 'void',
        src: '/images/swiper.jpg',
        id: null
    };
    let sql = `INSERT INTO home_swiper(src) VALUES(?)`;
    let par =[''];
    mysql.insert(sql, par).then(result => {
        console.log('添加结果', result)
        Response.send({
            code: 200,
            msg: '添加成功'
        })

    }).catch(err => {
        console.log('添加异常:', err);
    })
})

module.exports = router;