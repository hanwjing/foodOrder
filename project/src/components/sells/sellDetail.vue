<template>
    <div>
        <mt-swipe :auto="4000">
            <mt-swipe-item >
                <img :src="rootPath+sellerInfo.simg">
            </mt-swipe-item>
            <mt-swipe-item v-if="sellerInfo.surl">
                <img :src="rootPath+sellerInfo.surl">
            </mt-swipe-item>
        </mt-swipe>

        <div>
            <div class="mui-card muicard1">
                <div class="mui-card-content ">
                    <p style="color:#000;">{{sellerInfo.sname}}</p>
                    <p style="text-indent: 2em;">{{sellerInfo.scontent}}</p>
                </div>
                <div class="mui-card-content" style="color:#666;">
                    <div>
                        <span  style="width:80px;">
                            <i class="iconfont icon-icon-test"></i>
                            位置：
                        </span>
                        <span>{{sellerInfo.saddress}}</span>
                    </div>
                    <div>
                        <span  style="width:80px;">
                            <i class="iconfont icon-book"></i>
                            人均：
                        </span>
                        <span>￥{{sellerInfo.severy}}.00</span>
                    </div>
                    <div>
                        <span  style="width:80px;">
                            <i class="iconfont icon-phone"></i>
                            手机号码：{{sellerInfo.stel}}
                        </span>
                        <br>
                        <span  style="width:80px;margin-left: 24px;">
                            电话号码：{{sellerInfo.snum}}
                        </span>
                    </div>
                    <div>
                        <span>
                            <i class="iconfont icon-shijian"></i>
                            营业时间：
                        </span>
                        <span>{{sellerInfo.sdura}}</span>
                    </div>
                </div>
                <div class="mui-card-footer" >
                    <router-link v-show="flag" to="/orderseat" tag="button" class="mui-btn mui-btn-outlined">预约座位</router-link>
                    <button v-show="!flag" type="button" class="mui-btn mui-btn-outlined2">本店不支持预定座位</button>
                </div>
            </div>
            <mt-header title="-- 点 餐 --"></mt-header>

            <div class="mui-card muicard2"  v-for="(item,index) in foodlist" :key="item.fid">
                <router-link :to="'/home/fooddetail/'+item.fid">
                    <div class="mui-card-header mui-card-media" >
                        <img :src="rootPath+item.url" />
                        <div class="mui-media-body">
                            <p style="color:#000">{{item.fname}}</p>
                            <p>售价:￥{{item.fprice}}.00    &nbsp; &nbsp; <span>原价:￥{{item.forigin_price}}.00</span></p>
                            <p>{{item.fdescript |contentFormatter2}}</p>
                        </div>
                    </div>
                </router-link>
                <button class="mui-btn mui-btn-outlined3" @click=addCart(item.fid,item.sid)>加入购物车</button>

            </div>

            <button class="mui-btn mui-btn-outlined3 top" @click=comeback>订 单 列 表</button>
        </div>
    </div>
</template>

<script>
import Vue from "vue";
import mui from "MUI/js/mui.js";
export default {
  name: "sellDetail",
  data() {
    return {
      rootPath: Vue.http.options.root,
      name: this.$route.params.sname,
      id: this.$route.params.sid,
      sellerInfo: {},
      foodlist: [],
      flag: false
    };
  },
  created() {
    document.querySelector(
      ".mint-header-title"
    ).innerHTML = this.$route.params.sname;
    this.getsells();
    this.getfoodlist();
  },
  methods: {
    getsells() {
      this.$http.get("api/getselldetail/" + this.name).then(({ body }) => {
        if (body.status == 0) {
          this.sellerInfo = body.message[0];
          if (this.sellerInfo.sorder_seat == 1) {
            this.flag = true;
          }
        }
      });
    },
    getfoodlist() {
      this.$http.get("api/getfoodlist/" + this.id).then(({ body }) => {
        if (body.status == 0) {
          this.foodlist = body.message;
        }
      });
    },
    addCart(fid, sid) {
      let data = {
        username: localStorage.getItem("username"),
        sname: this.name,
        sid: sid,
        fid: fid
      };
      if (localStorage.getItem("username")) {
        this.$http
          .post("api/foodorder", data, { emulateJSON: true })
          .then(({ body }) => {
            mui.alert("加入购物车成功");
          });
      } else {
        mui.alert("请先登录");
        this.$router.push("/login");
      }
    },
    comeback() {
      this.$router.push("/myorder");
    }
  }
};
</script>

<style scoped lang="less">
.mint-swipe {
  height: 170px;
  img {
    width: 100%;
    height: 100%;
  }
}
.mui-card {
  &.muicard1 {
    margin: 0 0 8px 0;
    padding-bottom: 8px;
    .mui-card-content {
      padding: 6px 10px 8px;
      border-bottom: 1px solid #ccc;
    }
    .mui-card-footer {
      padding: 0 5px 0 0;
      text-align: center;
      button {
        border: none;
        width: 100%;
        height: 100%;
        &.mui-btn-outlined {
          background-color: #4fc8ff;
          color: #fff;
        }
        &.mui-btn-outlined2 {
          background-color: #ccc;
          color: #f5f5f5;
        }
      }
    }
  }
}
.mui-card {
  &.muicard2 {
    margin-bottom: 10px;
    background-color: #fff;
    border-bottom: 1px solid #aaa;
    overflow: hidden;
    .mui-card-header {
      img {
        width: 75px;
        height: 68px;
        margin-right: 10px;
      }
      .mui-media-body {
        p {
          span {
            text-decoration: line-through;
            color: #ccc;
            font-size: 0.75rem;
          }
        }
      }
    }
    .mui-card-header:after {
      background-color: #fff;
    }
    .mui-btn-outlined3 {
      float: right;
      background-color: #31baff;
      border: none;
      color: #fff;
      margin: -5px 20px 10px 0;
    }
  }
}
.mint-header {
  margin-top: -20px;
}
.top {
  width: 100%;
  margin-top: 15px;
}
</style>
