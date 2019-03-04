
let successState = 0
let failState = 1
let domain = 'http://127.0.0.1:8899'

exports.getlunbof = (req,res)=>{
    let resObj = {status:successState,message:''}
    let sql = 'SELECT * FROM my_lunbof'
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getlunbos = (req,res)=>{
    let resObj = {status:successState,message:''}
    let sql = 'SELECT * FROM my_lunbos'
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getclassify = (req,res)=>{
    let resObj = {status:successState,message:''}
    let sql = 'SELECT * FROM my_classify'
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getsellerinfo = (req,res)=>{
    let resObj = {status:successState,message:''}
    let sql = 'SELECT * FROM seller_info'
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getsells = (req,res)=>{
    let cid = req.params.id-0;
    let resObj = {status:successState,message:''}
    let sql = `SELECT * FROM seller_info where cid=`+cid
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getselldetail = (req,res)=>{
    let sname = req.params.name;
    let resObj = {status:successState,message:''}
    let sql = `SELECT * FROM seller_info where sname="`+sname+`"`
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getnewslist = (req,res)=>{
    let resObj = {status:successState,message:''}
    let sql = `SELECT * FROM news_list`
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getnewinfo = (req,res)=>{
    let nid = req.params.id
    let resObj = {status:successState,message:''}
    let sql = `SELECT * FROM news_list where nid=`+nid
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getfoodlist = (req,res)=>{
    let sid = req.params.id
    let resObj = {status:successState,message:''}
    let sql = `SELECT * FROM food_detail where sid=`+sid
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getfooddetail = (req,res)=>{
    let fid = req.params.id
    let resObj = {status:successState,message:''}
    let sql = `SELECT * FROM food_detail where fid=`+fid
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getseatlist = (req,res)=>{
    let st_id = req.params.id
    let resObj = {status:successState,message:''}
    let sql = `SELECT * FROM order_seat where st_id=`+st_id
    if(st_id <= 0){
        sql = `SELECT * FROM order_seat`
    }
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getorderinfo = (req,res)=>{
    let oid = req.params.id
    let resObj = {status:successState,message:''}
    let sql = `SELECT * FROM order_seat where oid=`+oid
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getseatclass = (req,res)=>{
    let resObj = {status:successState,message:''}
    let sql = `SELECT * FROM order_sort`
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.postlogin = (req,res)=>{
    let resObj = {status:successState,message:''}
    req.on('data',(chunk)=>{
        let login = chunk.toString()
        const querystring = require('querystring')
        let userObj = querystring.parse(login)
        let sql = `select username,password from users where username = '${userObj.username}' and password = '${userObj.password}'`
        req.db.driver.execQuery(sql,(err,datas)=>{
            if(err){
                resObj.status = failState
                resObj.message = err.message
                res.end(JSON.stringify(resObj))
                return
            }
            resObj.message = datas
            res.end(JSON.stringify(resObj))
        })
    })
    
}

exports.hasuser = (req,res)=>{
    let resObj = {status:successState,message:''}
    req.on('data',(chunk)=>{
        let login = chunk.toString()
        const querystring = require('querystring')
        let userObj = querystring.parse(login)
        let sql = `select username from users where username = '${userObj.username}'`
        req.db.driver.execQuery(sql,(err,datas)=>{
            if(err){
                resObj.status = failState
                resObj.message = err.message
                res.end(JSON.stringify(resObj))
                return
            }
            resObj.message = datas
            res.end(JSON.stringify(resObj))
        })
    })
    
}

exports.postregister = (req,res) =>{
    let resObj = {status:successState,message:''}
    req.on('data',(chunk)=>{
        let register = chunk.toString()
        const querystring = require('querystring')
        let userObj = querystring.parse(register)
        let sql = `insert into users values ('${userObj.username}', '${userObj.password}')`
        req.db.driver.execQuery(sql,(err,datas)=>{
            if(err){
                resObj.status = failState
                resObj.message = err.message
                res.end(JSON.stringify(resObj))
                return
            }
            resObj.message = datas
            res.end(JSON.stringify(resObj))
        })
    })
}

exports.getpayinfo = (req,res)=>{
    let ispay = req.params.id
    let resObj = {status:successState,message:''}
    let sql = `SELECT * FROM is_pay`
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.getcartlist = (req,res)=>{
    let ispay = req.params.id
    let username = req.params.name
    let resObj = {status:successState,message:''}
    let sql = `SELECT * FROM user_order where ispay=`+ispay+` and username='${username}'`
    if(ispay<=0){
        sql = `SELECT * FROM user_order where username = '${username}'`
    }
    req.db.driver.execQuery(sql,(err,datas)=>{
        if(err){
            resObj.status = failState
            resObj.message = err.message
            res.end(JSON.stringify(resObj))
            return
        }
        resObj.message = datas
        res.end(JSON.stringify(resObj))
    })
}

exports.changepay = (req,res)=>{
    let resObj = {status:successState,message:''}
    req.on('data',(chunk)=>{
        let cart = chunk.toString()
        const querystring = require('querystring')
        let cartObj = querystring.parse(cart)
        let sql = `UPDATE user_order SET ispay = 3 , ispayname = '已取消' where id=`+cartObj.id
        req.db.driver.execQuery(sql,(err,datas)=>{
            if(err){
                resObj.status = failState
                resObj.message = err.message
                res.end(JSON.stringify(resObj))
                return
            }
            resObj.message = datas
            res.end(JSON.stringify(resObj))
        })
    })
    
}

exports.paychange = (req,res)=>{
    let resObj = {status:successState,message:''}
    req.on('data',(chunk)=>{
        let cart = chunk.toString()
        const querystring = require('querystring')
        let cartObj = querystring.parse(cart)
        let sql = `UPDATE user_order SET ispay = 2 , ispayname = '已支付' where id=`+cartObj.id
        req.db.driver.execQuery(sql,(err,datas)=>{
            if(err){
                resObj.status = failState
                resObj.message = err.message
                res.end(JSON.stringify(resObj))
                return
            }
            resObj.message = datas
            res.end(JSON.stringify(resObj))
        })
    })
    
}

exports.foodorder = (req,res)=>{
    let resObj = {status:successState,message:''}
    req.on('data',(chunk)=>{
        let food = chunk.toString()
        const querystring = require('querystring')
        let foodObj = querystring.parse(food)
        let sql = `INSERT INTO user_order(username,sname,sid,fid,oid,ispay,ispayname,number) VALUES('${foodObj.username}', '${foodObj.sname}', ${foodObj.sid}, ${foodObj.fid}, 0, 1, '未支付', 1)`
        req.db.driver.execQuery(sql,(err,datas)=>{
            if(err){
                resObj.status = failState
                resObj.message = err.message
                res.end(JSON.stringify(resObj))
                return
            }
            resObj.message = datas
            res.end(JSON.stringify(resObj))
        })
    })
    
}

exports.seatorder = (req,res)=>{
    let resObj = {status:successState,message:''}
    req.on('data',(chunk)=>{
        let seatorder = chunk.toString()
        const querystring = require('querystring')
        let seatObj = querystring.parse(seatorder)
        let sql = `INSERT INTO user_order(username,sname,sid,fid,oid,ispay,ispayname,number) VALUES('${seatObj.username}', '${seatObj.sname}', ${seatObj.sid}, 0, ${seatObj.oid}, 1, '未支付', 1)`
        req.db.driver.execQuery(sql,(err,datas)=>{
            if(err){
                resObj.status = failState
                resObj.message = err.message
                res.end(JSON.stringify(resObj))
                return
            }
            resObj.message = datas
            res.end(JSON.stringify(resObj))
        })
    })
}





