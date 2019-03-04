'use strict'

const express = require("express");
let app = express();

app.use('/upload',express.static('./upload'))

const orm = require('orm');
const mysql = require('mysql');
app.use(orm.express('mysql://root:root@127.0.0.1:3306/hanwj',{
    define:function(db,models,next){
        next();
    }
}))

app.all('/api/*',(req,res,next)=>{
	//设置允许跨域响应报文头
		//设置跨域
	res.header("Access-Control-Allow-Origin", "*");
	res.header("Access-Control-Allow-Headers", "X-Requested-With");
	res.header("Access-Control-Allow-Methods","*");

	  res.setHeader('Content-Type','application/json;charset=utf-8');
	next();
});

const apiRoute = require('./routes/apiRoute.js');
app.use('/',apiRoute);

app.listen(8899,'127.0.0.1',()=>{
    console.log('api服务已启动, :8899');
})