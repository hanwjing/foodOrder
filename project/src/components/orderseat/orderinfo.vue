<template>
    <div class="orderinfo">
        <!--<img :src="rootPath+orderinfo.img" alt="">-->
        <div class="first">
            <div class="mui-card">
                <div class="mui-card-content">
                    <img :src="rootPath+orderinfo.img" alt="">
                </div>
                <div class="mui-card-footer mui-card-media" >
                    <div class="mui-media-body">
                        <p>{{orderinfo.sname}} &nbsp; &nbsp; &nbsp; &nbsp; <span>{{orderinfo.st_title}}</span></p>
                        <p>{{orderinfo.odescript}}</p>
                        <span style="color: #333;font-size: 1.2rem">￥{{orderinfo.oprice}}.00 </span>
                        <span style="font-size: 0.9rem;color: #888;"> &nbsp; 已预约：{{orderinfo.ohas_order}} &nbsp; 剩余：{{orderinfo.oleave}}</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="second">
            <div class="title"><span>&nbsp; &nbsp; 服务详情</span></div>
            <div class="content" v-html="orderinfo.ocontent"></div>
        </div>
        <button class="mui-btn mui-btn-outlined3" @click=orderseat(orderinfo.oid)>预 约 座 位</button>
    </div>
</template>

<script>
import Vue from "vue";
import mui from "MUI/js/mui.js";
export default {
  data() {
    return {
      orderinfo: {},
      id: this.$route.params.id,
      rootPath: Vue.http.options.root,
      username: localStorage.getItem("username")
    };
  },
  created() {
    this.getorderinfo();
  },
  methods: {
    getorderinfo() {
      this.$http.get("api/getorderinfo/" + this.id).then(({ body }) => {
        if (body.status == 0) {
          this.orderinfo = body.message[0];
          console.log(this.orderinfo);
        }
      });
    },
    orderseat(id) {
      // console.log(id)
      let data = {
        username: this.username,
        sname: this.orderinfo.sname,
        sid: this.orderinfo.sid,
        oid: this.orderinfo.oid
      };
      if (localStorage.getItem("username")) {
        this.$http
          .post("api/seatorder", data, { emulateJSON: true })
          .then(({ body }) => {
            // console.log(body)
            mui.alert("预约成功");
          });
      } else {
        mui.alert("请先登录");
        this.$router.push("/login");
      }

      // this.$http.post("api/register", data,{ emulateJSON:true }).then(({body})=> {
      //     mui.alert("注册成功");
      //     setTimeout( function() {
      //         this.$router.push("/login");
      //     }.bind(this),1000);
      // });
    }
  }
};
</script>

<style scoped lang="less">
.orderinfo {
  .first {
    background-color: #fff;
    .mui-card {
      margin-bottom: 10px;
      background-color: #fff;
      border-bottom: 1px solid #aaa;
      overflow: hidden;
      img {
        width: 100%;
        height: 180px;
      }
      .mui-card-footer {
        .mui-media-body {
          p {
            &:nth-child(1) {
              color: #333;
              font-size: 1.1rem;
            }
          }
        }
      }
    }
  }
  .second {
    background-color: #fff;
    margin-top: 10px;
    .title {
      padding: 10px 20px;
      color: #454545;
      border-bottom: 1px solid #ccc;
      span {
        border-left: 1px solid #666;
      }
    }
    .content {
      text-indent: 1.5em;
    }
  }
  .mui-btn-outlined3 {
    width: 100%;
    color: #fff;
    background-color: #ffc200;
    border: none;
  }
}
</style>
