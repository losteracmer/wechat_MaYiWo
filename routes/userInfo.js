const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid')

router.use('/set',(Request,Response)=>{
    console.log('同步用户信息请求：',Request.query)
    try {
        var sessionkey = Request.query.sessionkey;
        var userInfo = JSON.parse(Request.query.userInfo);
        
        //console.log(typeof userInfo,userInfo)
    } catch (error) {
        console.log('并没有传过来用户信息',error)
    }
    getopenid(sessionkey,openid =>{
        console.log('得到的openid is ',openid)
        if(! openid){
            Response.send({
                code:403,
                msg:'sessionkey错误，请重新登录'
            })
        } else {
            console.log('openid:',openid)
            let sql = `UPDATE user SET nickName=?,gender=?,avatarUrl=?,city=?,province=?,country=?,\`language\`=? WHERE openid  = '${openid}'`
            let param = [userInfo.nickName,userInfo.gender,userInfo.avatarUrl,userInfo.city,userInfo.province,userInfo.country,userInfo.language];
            console.log('param:',param)
            mysql.update(sql,param).then(result=>{
                console.log('同步用户信息成功:',result)
                Response.send({
                    code:200,
                    msg:'update success'
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

//获取用户个人信息
router.use('/get',(Request,Response)=>{
    console.log('同步用户信息请求：',Request.query)
    try {
        var sessionkey = Request.query.sessionkey;
    } catch (error) {
        console.log('并没有传过来用户信息',error);
    }
    getopenid(sessionkey,openid =>{
        console.log('得到的openid is ',openid)
        if(! openid){
            Response.send({
                code:403,
                msg:'请重新登录'
            })
        } else {
            console.log('openid:',openid)
            let sql = `SELECT realname,mobile,wechat,school,qq,specialty,faculty FROM \`user\` WHERE openid  = '${openid}'`
            
            mysql.query(sql).then(resset=>{
                if(resset.length == 0){
                    Response.send({
                        code:503,
                        msg:'没有找到您的信息'
                    })
                }else{
                    Response.send({
                        code:200,
                        userInfo:resset[0]
                    })
                }

            }).catch(error=>{
                console.log('sync user Info fail:',error)
                Response.send({
                    code:503,
                    msg:'数据库错误'
                })
            })
        }
    })
})

module.exports = router;
