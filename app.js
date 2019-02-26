const mysql = require('./conmmon/mysql')
const express = require('express')

var app = express();

var path = require('path'); 
var fs = require('fs');

//使用nodejs自带的http、https模块  
var http = require('http');  
var https = require('https');  

//根据项目的路径导入生成的证书文件
  
var privateKey  = fs.readFileSync(path.join(__dirname, './nginx/supersst.com.key'), 'utf8');  
var certificate = fs.readFileSync(path.join(__dirname, './nginx/supersst.com-ca-bundle.crt'), 'utf8');  
var credentials = {key: privateKey, cert: certificate};  

var httpServer = http.createServer(app);
var httpsServer = https.createServer(credentials, app);  

//http.createServer()
//可以分别设置http、https的访问端口号  
var PORT = 80;  
var SSLPORT = 443;
  
//创建http服务器  
httpServer.listen(PORT, function() {  
    console.log('HTTP Server is running on: http://localhost:%s', PORT);  
});  
  
//创建https服务器  
httpsServer.listen(SSLPORT, function() {  
    console.log('HTTPS Server is running on: https://localhost:%s', SSLPORT);  
});  
  
//登录获取sessionkey
app.use('/login',require('./routes/login'));

//获取静态文件 视频
app.use( '/video', express.static( __dirname + '/video') );
//图像
app.use('/images',require('./routes/staticrouter'))

//登录获取sessionkey
app.use('/login',require('./routes/login'));

//更新用户Infor
app.use('/userInfo',require('./routes/userInfo'));


//管理登录接口
app.use('/admin',require('./routes/admin'));

//上传图片
app.use('/upload',require('./routes/upload'));


//失物招领
app.use('/lostsandfinds',require('./routes/lostsandfinds'));

//资料接口
app.use('/material',require('./routes/material'));

//商家
app.use('/shops',require('./routes/shops'));

//评论
app.use('/comment',require('./routes/comment'));

//评论
app.use('/collect',require('./routes/collect'));

//home
app.use('/home',require('./routes/home'));

//passage
app.use('/passage',require('./routes/passage'));

//job
app.use('/job',require('./routes/job'));

//feedback
app.use('/feedback',require('./routes/feedback.js'));
//当请求异常时
app.use((Request,Response)=>{
    console.log('异常的请求:','host:',Request.host,'hostname:',Request.hostname,'method::',Request.method,'path:',Request.path)
    Response.send({
        code:404,
        msg:'invalid request'
    })
})

