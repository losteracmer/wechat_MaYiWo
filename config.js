var mysqlConfig = {
    host: 'localhost',
    user: 'root',
    password: '445247721',
    port: '3306',
    database: 'mayiwo',
    multipleStatements: true,
    charset:'utf8mb4_general_ci'
};

//200 OK
//400 Bad request
//403 Forbidden
//500 Internal Server Error
var config = 
{
    //mysql的配置
    mysqlConfig:mysqlConfig,

    // //appid
    // appid:'wxa32880bd5ddc2a31',
    // //secret
    // secret:'fcf01a9fed32431c09682c3fa4875f05',
    appid:'wx3b4968e01415506e',
    secret:'7a2c2c75e9771e2440b5c14da948c346'
}

module.exports = config;