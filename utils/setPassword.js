const encode = require('./encode')
const createncrytedPasswd = require('./createncryptedPasswd')
const mysql = require('../conmmon/mysql')
function setPassword(accout,password){
    let encrytedpassword = createncrytedPasswd(password)
    let sql = `UPDATE admins SET password = ? where account = ?`;
    let par = [encrytedpassword,accout]
    mysql.update(sql ,par).then(result =>{
        console.log('update password success!',result)
    }).catch(error=>{
        console.log('update password fail!',error)
    })
}

//setPassword('lyh','lyh')

function createAdminAccount(account,password,callback){
    let encrytedpassword = createncrytedPasswd(password);
    let sql = `INSERT INTO admins(account,password) VALUES(?,?)`
    let par = [account,encrytedpassword];
    mysql.insert(sql,par).then(result=>{
        console.log('管理账号成功',result);
        if(callback) callback()
    }).catch(error=>{
        console.log('管理账号失败:',error);
    })
}

module.exports = {
    setPassword:setPassword,
    createAdminAccount:createAdminAccount
}
createAdminAccount('sst','sst')