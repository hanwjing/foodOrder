<template>
    <div>
        <!--<mt-swipe :auto="4000">-->
            <!--<mt-swipe-item v-for="item in lunboList" :key="item.img">-->
                <!--<img :src="item.img" :alt="item.url">-->
            <!--</mt-swipe-item>-->
        <!--</mt-swipe>-->
        <!--<swiper></swiper>-->
        <swiper :lunbotuList="lunboList" :isfull="true"></swiper>

        <ul class="mui-table-view mui-grid-view mui-grid-9">
            <li class="mui-table-view-cell mui-media mui-col-xs-4" v-for="item in classifyList" :key="item.cid">
                <a href="javascript:;" @click="toggle(item.cid)">
                    <img :src="rootPath+item.cimg" alt="">
                    <div class="mui-media-body">{{item.ctitle}}</div>
                </a>
            </li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4">
                <router-link to="/home/newslist">
                    <img src="../assets/images/menu9.png" alt="">
                    <div class="mui-media-body">食品资讯</div>
                </router-link>
            </li>
        </ul>

        <div>
            <mt-header title="-- 推 荐 商 家 --"></mt-header>
            <div class="mui-card" v-for="(item,index) in sellerInfo" :key="item.sell_count">
                <router-link :to="'/home/selldetail/'+item.sname+'/'+item.sid">
                    <div class="mui-card-header mui-card-media" >
                        <img :src="rootPath+item.simg" />
                        <div class="mui-media-body">
                            <p style="color:#000;">{{item.sname}}</p>
                            <p>月售:{{item.sell_count}}</p>
                            <p>发表于 {{item.add_time|dataFormatter}}</p>
                        </div>
                    </div>
                </router-link>
            </div>
        </div>
    </div>
</template>

<script>
import Vue from "vue";
import swiper from "@/components/common/swiper.vue";
export default {
  data: function() {
    return {
      lunboList: [],
      classifyList: [],
      sellerInfo: [],
      rootPath: Vue.http.options.root,
      flag1: 1,
      flag2: 2,
      list: []
    };
  },
  created() {
    this.getLunbotu();
    this.getIndexClassify();
    this.getSellerInfo();
  },
  methods: {
    getLunbotu() {
      this.$http.get("api/getlunbo").then(function(data) {
        if (data.body.status == 0) {
          this.lunboList = data.body.message;
        }
      });
    },
    getIndexClassify() {
      this.$http.get("api/getclassify").then(function(data) {
        if (data.body.status == 0) {
          data.body.message.splice(2, 1);
          this.classifyList = data.body.message;
          // this.classifyList.unshift({ cid: 0 });
          // this.getsells(this.classifyList[0].id);
          // console.log(this.classifyList)
        }
      });
    },
    getSellerInfo(id) {
      this.$http.get("api/getsellerinfo").then(({ body }) => {
        // console.log(body)
        if (body.status == 0) {
          this.sellerInfo = body.message;
        }
      });
    },
    getsells(id) {
      this.$http.get("api/getsells/" + id).then(function({ body }) {
        if (body.status == 0) {
          console.log(body);
          this.sellerInfo = body.message;
        }
      });
    },
    toggle(id) {
      this.getsells(id);
    }
  },
  components: {
    swiper
  }
};
</script>

<style lang="less" scoped>
.mui-card {
  margin: 8px 0;
  padding-bottom: 8px;
  background-color: #fff;
  .mui-card-header {
    img {
      width: 55px;
      height: 55px;
      margin-right: 10px;
    }
  }
  .mui-card-header:after {
    background-color: #fff;
  }
}
.mui-grid-view.mui-grid-9 {
  background-color: #fff;
  border: none;
  li {
    height: 118px;
    img {
      width: 63px;
      height: 59px;
      border-radius: 50%;
    }

    .mui-media-body {
      font-size: 13px;
    }
  }
}
</style>
