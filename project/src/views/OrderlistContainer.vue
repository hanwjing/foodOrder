<template>
    <div class="orderlist">

        <div id="slider" class="mui-slider">
            <div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
                <div class="mui-scroll" id="mui-scroll-">
                    <div v-for="item in payinfoList" :key="item.ispay" :class="['mui-control-item',item.ispay==0?'mui-active':'']" @click=toggle(item.ispay,username)>
                        {{ item.ispayname }}
                    </div>
                </div>
            </div>
        </div>
         <div v-if="cartList.length ==0 ">
             你没有点餐哦
             <button class="mui-btn mui-btn-outlined1" @click=toOrder>快去点餐吧~</button>
         </div>
        <div class="mui-card" v-for="item in cartList">
            <div class="mui-card-header">
                <span style="font-size: 1rem">{{item.sname}}</span>
                <span class="fr"  style="font-size: 1rem">{{item.ispayname}}</span>
            </div>
            <div class="mui-card-content" v-for="item1 in foodlist" v-if="item.ispay==item1.ispay && item.sname == item1.sname">
                <div class="mui-card-content-inner">
                    <div class="mui-input-row mui-checkbox">
                        <input name="checkbox1" value="Item 1" type="checkbox">
                    </div>

                    <img :src="rootPath+item1.url" />
                    <div class="info">
                        <h1>{{item1.fname}}</h1>
                        <p>
                            <span class="price">￥{{item1.fprice}}.00 </span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="mui-card-content" v-for="item2 in seatlist" v-if="item.ispay==item2.ispay && item.sname == item2.sname">
                <div class="mui-card-content-inner">
                    <div class="mui-input-row mui-checkbox">
                        <input name="checkbox1" value="Item 1" type="checkbox">
                    </div>

                    <img :src="rootPath+item2.img" />
                    <div class="info">
                        <h1>{{item2.st_title}}</h1>
                        <p>
                            <span class="price">￥{{item2.oprice}}.00 </span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="mui-card-footer fr">
                <button type="button" class="mui-btn mui-btn-outlined" v-show="item.ispay==1" @click=cancelOrder(item.id)>取消订单</button> &nbsp;
                <button type="button" class="mui-btn mui-btn-outlined" v-show="item.ispay==1" @click=payOrder(item.id)>支付订单</button> &nbsp;
                <button type="button" class="mui-btn mui-btn-outlined" v-show="item.ispay==2" disabled>支付成功</button> &nbsp;
                <button type="button" class="mui-btn mui-btn-outlined" v-show="item.ispay==3" disabled>已 取 消</button>
            </div>
        </div>
    </div>
</template>

<script>
import Vue from "vue";
import mui from "MUI/js/mui.js";
export default {
  name: "orderlist",
  data() {
    return {
      username: "",
      payinfoList: [],
      cartList: [],
      foodlist: [],
      seatlist: [],
      hash: [],
      hash2: [],
      payid: "",
      rootPath: Vue.http.options.root,
      list1: [],
      list2: [],
      list3: []
    };
  },
  created() {
    console.log(this.cartList);
    this.getitem();
    this.getpayinfo();
  },
  methods: {
    getitem() {
      if (!localStorage.getItem("username")) {
        this.$router.push("/login");
      }
      this.username = localStorage.getItem("username");
    },
    getpayinfo() {
      this.$http.get("api/getpayinfo").then(({ body }) => {
        if (body.status == 0) {
          this.payinfoList = body.message;
          this.payinfoList.unshift({ ispayname: "全部", ispay: 0 });
          this.getcartlist(this.payinfoList[0].ispay, this.username);
        }
      });
    },
    getcartlist(id, name) {
      this.$http.get("api/getcartlist/" + id + "/" + name).then(({ body }) => {
        let that = this;
        if (body.status == 0) {
          this.cartList = body.message;
          this.cartList.forEach((item, index) => {
            if (item.fid == 0) {
              this.$http
                .get("api/getorderinfo/" + item.oid)
                .then(({ data }) => {
                  data.message[0].ispay = item.ispay;
                  data.message[0].sname = item.sname;
                  this.hash.unshift(data.message[0]);
                  this.seatlist = this.unique1(this.hash);
                });
            } else {
              this.$http
                .get("api/getfooddetail/" + item.fid)
                .then(({ data }) => {
                  data.message[0].ispay = item.ispay;
                  data.message[0].sname = item.sname;
                  this.hash2.unshift(data.message[0]);
                  this.foodlist = this.unique12(this.hash2);
                });
            }
          });
        }
      });
    },
    toggle(id, name) {
      this.getcartlist(id, name);
      // console.log(id,name)
      this.payid = id;
    },
    unique1(arr) {
      var allArr = [];
      for (var i = 0; i < arr.length; i++) {
        var flag = true;
        for (var j = 0; j < allArr.length; j++) {
          if (arr[i].oid == allArr[j].oid) {
            flag = false;
          }
        }
        if (flag) {
          allArr.push(arr[i]);
        }
      }
      return allArr;
    },
    unique12(arr) {
      var allArr = [];
      for (var i = 0; i < arr.length; i++) {
        var flag = true;
        for (var j = 0; j < allArr.length; j++) {
          if (arr[i].fid == allArr[j].fid) {
            flag = false;
          }
        }
        if (flag) {
          allArr.push(arr[i]);
        }
      }
      return allArr;
    },
    cancelOrder(id) {
      let data = { id: id };
      this.$http
        .post("api/changepay", data, { emulateJSON: true })
        .then(({ body }) => {
          mui.alert("已取消");
          this.getcartlist(this.payinfoList[0].ispay);
        });
    },
    payOrder(id) {
      var btnArray = ["确认", "取消"];
      let that = this;
      let data = { id: id };
      mui.confirm("确认支付？？", "支付提示", btnArray, function(e) {
        if (e.index == 1) {
          mui.alert("已取消支付");
        } else {
          that.$http
            .post("api/paychange", data, { emulateJSON: true })
            .then(({ body }) => {
              mui.alert("已成功支付");
              that.getcartlist(that.payinfoList[0].ispay);
            });
        }
      });
    },
    toOrder() {
      this.$route.push("/");
    }
  },
  mounted() {
    mui(".mui-scroll-wrapper").scroll({
      deceleration: 0.0005
    });
  }
};
</script>

<style scoped lang="less">
.fr {
  float: right;
}
.orderlist {
  .mui-slider {
    z-index: 0;
    background-color: #fff;
    #mui-scroll- > .mui-control-item.mui-active {
      color: #ffc200;
    }
  }
  .mui-card-content {
    border: 1px solid #ccc;
    .mui-card-content-inner {
      display: flex;
      align-items: center;
      padding: 15px 10px;
      .mui-checkbox {
        width: 55px;
        height: 40px;
      }
      img {
        width: 50px;
        margin-left: -10px;
        margin-right: 10px;
      }
      h1 {
        font-size: 13px;
      }
      .info {
        .price {
          color: red;
          font-weight: bold;
        }
        p {
          a {
            margin-left: 15px;
          }
        }
      }
    }
  }
  .mui-card-footer {
    padding: 0 5px 0 0;
  }
  .mui-btn-outlined1 {
    width: 100%;
    margin-top: 30px;
  }
}
</style>
