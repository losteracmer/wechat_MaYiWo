const express = require('express');
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid');
const silly_time = require('silly-datetime');
const bodyParser = require('body-parser');

var router = express.Router();
router.use(bodyParser.json())
//获取列表
router.use('/list',(Request,Response)=>{
    console.log('---getlosts.query  ',Request.query);
    var sessionkey = Request.query.sessionkey;
    var lostType = Request.query.lostType;
    var start = Request.query.start || 0;
    var add = Request.query.add || 10;
    var type = lostType =="寻找"?'lost':'find';
    let sql = `SELECT * FROM lostsandfinds WHERE lost_type = '${type}' AND show_status = 0 
    ORDER BY show_top , publish_time DESC LIMIT ${start},${add}`;
    mysql.query(sql).then(resset =>{

        resset.map((item)=>{
            item.images = JSON.parse(item.images).images;
            //item.publish_time = silly_time.format(item.publish_time);
        })
        Response.send({
            code:200,
            losts:resset
        })
    }).catch(error =>{
        console.log('获取lost发生错误',error)
    })
})

//获取详情
router.use('/detail',(Request, Response) => {
    console.log('get lost  Info:->',Request.query)
    let id = Request.query.id;
    let sessionkey = Request.query.sessionkey;
    let sql = `SELECT 
    id,lost_type,publish_time,address,title,detail,images,kinds,lostsandfinds.mobile,
    nickName,avatarUrl,gender from lostsandfinds ,\`user\` 
    WHERE lostsandfinds.publish_user = \`user\`.openid AND lostsandfinds.id = ${id}`

    mysql.query(sql).then(res => {
        console.log('从数据库losts  info:', res)

        // 因为这里就只有一条数据，所以直接返回res[0]
        Response.send({
            code: 200,
            detail: res[0]
        });
    }).catch(err => {
        console.log("losts详情信息:", err)
        Response.send({
            code: 500,
            msg: '程序员删库跑路去了'
        })
    })
})

router.use('/issue',(Request,Response)=>{
    console.log('发布issue:',Request.body);
    var images = Request.body.images_ok;
    var sessionkey = Request.body.sessionkey;
    var latitude = Request.body.latitude;
    var longitude = Request.body.longitude;
    var mobile = Request.body.mobile;
    var title = Request.body.title;
    var detail = Request.body.detail;
    var address = Request.body.address;
    //var nothing = Request.body.nothing;
    var kinds = Request.body.kinds;
    var lostType = Request.body.lostType;

    //变成字符串往数据库存
    var imagesJson = {images:images};
    var imagesJsonStr = JSON.stringify(imagesJson); 
    var nowtime = new Date();
    getopenid(sessionkey ,openid=>{
        if(openid == null){
            Response.send({
                code:403,
                msg:'登录过期'
            })
            
        }else{
            let sql = `INSERT INTO 
            lostsandfinds( publish_user ,lost_type ,publish_time ,address_longitude ,address_latitude,address ,title,detail,images,kinds,mobile) 
            VALUES(?,?,?,?,?,?,?,?,?,?,?)`;
            let par = [openid,lostType,nowtime,longitude,latitude,address,title,detail,imagesJsonStr,kinds,mobile]
            mysql.insert(sql,par).then(result =>{
                Response.send({
                    code:200,
                    msg:'success'
                })
            }).catch(err=>{
                console.log('插入发生了错误;',err);
            })
        }
    })
})

router.use('/delete',(Response,Request)=>{
    let sessionkey = Response.query.sessionkey;
    let id = Response.query.id;
    let sql = `UPDATE lostsandfinds SET show_status = 1 WHERE id = ?`
    let par = [id];
    mysql.update(sql,par).then(result =>{
        Request.send({
            code:200,
            msg:'删除成功'
        })
    }).catch(error=>{
        console.log('删除错误: ',error)
    })
})

module.exports = router;


// var arr = ['sha','shi'];
// console.log(arr.constructor == Array)

// var str = '2018-10-18 20:21:34';
// console.log(typeof Date.parse(str) ,new Date(Date.parse(str)))
// var str = '2018-10-18T12:21:34.000Z';
// console.log((new Date(str)).getTime());
// console.log((new Date()).getTime())

// if(0.021) console.log(true)