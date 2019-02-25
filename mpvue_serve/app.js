//vue_app_server 服务器
const express = require("express");
var app = express();
app.use(express.static("public"));
app.listen(3000);
const pool = require("./pool");

//express mysql 参数 request;response
//跨域访问配置
//1:加载模块cors
const cors = require("cors");
//2:配置cors
app.use(cors({
  origin:["http://127.0.0.1:5500",
         "http://localhost:3001"],//允许列表
  credentials:true   //是否验证
}));
//3:加载第三方模块: express-session
const session = require("express-session");
//4:对模块配置
app.use(session({
  secret:"128位随机字符串",   //安全令牌
  resave:false,              //请求保存
  saveUninitialized:true,    //初始化
  cookie:{                   //sessionid保存时
    maxAge:1000*60*60*24     //间1天 cookie
  }
}));

//功能一:首页轮播
app.get("/getImages",(req,res)=>{
  var rows = [
    {id:1,img_url:"http://127.0.0.1:3000/img/food_pic1.jpg"},
    {id:2,img_url:"http://127.0.0.1:3000/img/food_pic2.jpg"},
    {id:3,img_url:"http://127.0.0.1:3000/img/food_pic3.jpg"},
  ];
  res.send(rows);
})


//#功能二:热销商品列表
app.get("/getGoodsList",(req,res)=>{
  //pageSize 页大小
  var pageSize = req.query.pageSize;
  //默认值
  if(!pageSize){
    pageSize = 3;
  }
  //3:创建sql
  //  查询总页数
  obj = {code:1};
  //  查询当前页内容
var sql=" SELECT id,name,sale,img_url,price,content";
    sql +=" FROM first_allfood";
    sql +=" LIMIT 0,?"
  pageSize = parseInt(pageSize);
  pool.query(sql,[pageSize],(err,result)=>{
    if(err)throw err;
    //console.log(result);
    obj.data = result;
    res.send(obj);
  }); 
});

//功能三:加载分类全部商品
app.get('/getFood',(req,res) => {
	var fid=parseInt(req.query.fid)
	if(!fid){
		fid=1
	}else if(fid>6){
		res.send({code:-1,msg:'nomorefood'})
		return
	}
	var obj={code:1}
	var sql='SELECT * FROM first_allfood WHERE familyid=?'
	pool.query(sql,[fid],(err,result) => {
		if(err) throw err;
		obj.data = result;
		res.send(obj)
	})
})
//功能四:将商品信息添加至购物车
app.get("/addCart",(req,res)=>{
  //1:参数 uid pid count
  var uid   = parseInt(req.query.uid);
  var pid   = parseInt(req.query.pid);
  var count = parseInt(req.query.count);
  if(!uid){uid=1}
  if(!count){count=1}
  //2:sql  INSERT
  var sql=" INSERT INTO `first_cart`(`id`, ";
      sql+=" `uid`, `pid`,`count`)";
      sql+="  VALUES (null,?,?,?) ON DUPLICATE KEY UPDATE count=count+1";
  pool.query(sql,[uid,pid,count],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows > 0){
        res.send({code:1,msg:"添加成功"});
      }else{
        res.send({code:-1,msg:"添加失败"});
      }
  })
  //3:json {code:1,msg:"添加成功"}
}); 

//功能五:查询购物车中数据
app.get("/getCartList",(req,res)=>{
  //1:参数
  var uid = parseInt(req.query.uid); 
  if(!uid){uid=1}
  //2:sql
  var sql =" SELECT f.pid,f.name,f.price,f.img_url,c.count";
      sql +=" FROM first_allfood f,first_cart c";
      sql +=" WHERE f.pid = c.pid";
      sql +=" AND c.uid = ?";    
  pool.query(sql,[uid],(err,result)=>{
      if(err)throw err;
      res.send({code:1,data:result});
  }) 
})
//功能六:同步购物中商品数量
app.get("/updateCart",(req,res)=>{
  var id = parseInt(req.query.id);
  var count = parseInt(req.query.count);
  if(count==0){
    var sql='DELETE FROM first_cart WHERE pid=?';
    pool.query(sql,[id],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows > 0){
        res.send({code:1,msg:"更新成功"});
      }else{
        res.send({code:-1,msg:"更新失败"});
      }
    })
  }else{
    var sql = " UPDATE first_cart SET count = ? WHERE pid = ?";
    pool.query(sql,[count,id],(err,result)=>{
      if(err)throw err; //17:30 sub add
      if(result.affectedRows > 0){
        res.send({code:1,msg:"更新成功"});
      }else{
        res.send({code:-1,msg:"更新失败"});
      }
    })  
  }
})

//功能二:新闻分页显示
app.get("/getNews",(req,res)=>{
  //1:参数       pno 页码;pageSize 页大小
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  //1.2:默认值
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 7;
  }
  //2:验证正则表达式
  var reg = /^[0-9]{1,}$/;
  if(!reg.test(pno)){
     res.send({code:-1,msg:"页码格式不正确"});
     return;
  }
  if(!reg.test(pageSize)){
    res.send({code:-2,msg:"页大小格式不正确"});
    return;
  }
  //3:创建sql
  //  查询总页数
  var sql = "SELECT count(id) as c FROM first_news";
  var progress = 0; //sql执行进度
  obj = {code:1};
  pool.query(sql,(err,result)=>{
       if(err)throw err;
       //console.log(result[0].c);
       var pageCount = Math.ceil(result[0].c/pageSize);
       obj.pageCount = pageCount;
       progress += 50;
       if(progress == 100){
        res.send(obj);
       }
  });
  //  查询当前页内容
var sql=" SELECT *";
    sql +=" FROM first_news";
    sql +=" LIMIT ?,?"
var offset = parseInt((pno-1)*pageSize);
pageSize = parseInt(pageSize);
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err)throw err;
    //console.log(result);
    obj.data = result;
    progress+=50;
    if(progress==100){
      res.send(obj);
    }
  }); 
})

//功能三:依据新闻编号查询新闻详细信息
app.get("/getNewsInfo",(req,res)=>{
  //1:参数   id   53
  var id = req.query.id;
  //2:sql    SELECT id,title,ctime,content FROM 
  //         xz_news WHERE id = ?
  var sql=" SELECT id,title,ctime,content";
      sql+=" FROM xz_news WHERE id = ?";
  //3:json   {code:1,data:obj}
  pool.query(sql,[id],(err,result)=>{
      if(err)throw err;
      res.send({code:1,data:result[0]});
  })
})





//功能十六:小程序美食分页显示
app.get("/getShopList",(req,res)=>{
   //1:参数       pno 页码;pageSize 页大小
   var pno = req.query.pno;
   var pageSize = req.query.pageSize;
   //1.2:默认值
   if(!pno){
     pno = 1;
   }
   if(!pageSize){
     pageSize = 7;
   }
   //2:验证正则表达式
   var reg = /^[0-9]{1,}$/;
   if(!reg.test(pno)){
      res.send({code:-1,msg:"页码格式不正确"});
      return;
   }
   if(!reg.test(pageSize)){
     res.send({code:-2,msg:"页大小格式不正确"});
     return;
   }
   //3:创建sql
   //  查询总页数
   var sql = "SELECT count(id) as c FROM xz_shoplist";
   var progress = 0; //sql执行进度
   obj = {code:1};
   pool.query(sql,(err,result)=>{
        if(err)throw err;
        //console.log(result[0].c);
        var pageCount = Math.ceil(result[0].c/pageSize);
        obj.pageCount = pageCount;
        progress += 50;
        if(progress == 100){
         res.send(obj);
        }
   });
   //  查询当前页内容
 var sql=" SELECT id,img_url,dname,daddr,dphone,dtime,dpoint";
     sql +=" FROM xz_shoplist";
     sql +=" LIMIT ?,?"
 var offset = parseInt((pno-1)*pageSize);
 pageSize = parseInt(pageSize);
   pool.query(sql,[offset,pageSize],(err,result)=>{
     if(err)throw err;
     //console.log(result);
     obj.data = result;
     progress+=50;
     if(progress==100){
       res.send(obj);
     }
   }); 
});

