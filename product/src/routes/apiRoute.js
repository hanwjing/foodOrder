const express = require('express')

let route = express.Router()
const apiCtrl = require('../controllers/apiController.js')

route.get('/api/getlunbo',apiCtrl.getlunbof)
route.get('/api/getlunbo2',apiCtrl.getlunbos)
route.get('/api/getclassify',apiCtrl.getclassify)
route.get('/api/getsellerinfo',apiCtrl.getsellerinfo)
route.get('/api/getsells/:id', apiCtrl.getsells)
route.get('/api/getselldetail/:name', apiCtrl.getselldetail)
route.get('/api/getnewslist', apiCtrl.getnewslist)
route.get('/api/getnewinfo/:id', apiCtrl.getnewinfo)
route.get('/api/getfoodlist/:id', apiCtrl.getfoodlist)
route.get('/api/getfooddetail/:id', apiCtrl.getfooddetail)
route.get('/api/getseatlist/:id', apiCtrl.getseatlist)
route.get('/api/getorderinfo/:id', apiCtrl.getorderinfo)
route.get('/api/getseatclass', apiCtrl.getseatclass)
route.post('/api/login', apiCtrl.postlogin)
route.post('/api/hasuser', apiCtrl.hasuser)
route.post('/api/register', apiCtrl.postregister)
route.get('/api/getpayinfo', apiCtrl.getpayinfo)
route.get('/api/getcartlist/:id/:name', apiCtrl.getcartlist)
route.post('/api/changepay', apiCtrl.changepay)
route.post('/api/paychange', apiCtrl.paychange)
route.post('/api/seatorder', apiCtrl.seatorder)
route.post('/api/foodorder', apiCtrl.foodorder)

route.post('/api/post',(req,res)=>{
	var obj = {message:'post 请求 ok'};
	res.end(JSON.stringify(obj));
});

route.all('/api/jsonp',(req,res)=>{
    var callbackFn = req.query.callback;
    var obj = {message:'jsonp 请求 ok'};
    var jsonStr = JSON.stringify(obj);
    res.end(`${callbackFn}('${jsonStr}')`);
})

// 用户登录


module.exports = route