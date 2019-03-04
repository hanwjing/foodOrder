<template>
    <div class="goodsinfo-container">
        <!--添加购物车的小球动画-->
        <transition
                @before-enter="beforeEnter"
                @enter="enter"
                @after-enter="afterEnter">
            <div class="ball" v-show="ballFlag" ref="ball"></div>
        </transition>

        <!-- 商品轮播图区域 -->
        <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <!--使用自己封装的轮播组件-->
                    <swiper :lunbotuList="lunbotu" :isfull="true"></swiper>
                </div>
            </div>
        </div>

        <div class="mui-card">
            <div class="mui-card-header">{{ goodsinfo.title }}</div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <p class="price">
                        市场价：<del>￥{{ goodsinfo.market_price }}</del>&nbsp;&nbsp;销售价：<span class="now_price">￥{{ goodsinfo.sell_price }}</span>
                    </p>
                    <!-- @getcount用于子组件向父组件传值用的 -->
                    <!-- :max 父组件向子组件传递max值 -->
                    <p>购买数量:<number-box @func="getSelecedCount" :max="goodsinfo.stock_quantity"></number-box></p>
                    <p>
                        <mt-button type="primary" size="small">立即购买</mt-button>
                        <mt-button type="danger" size="small" @click="addToShopCar">加入购物车</mt-button>
                    </p>
                </div>
            </div>
        </div>

        <div class="mui-card">
            <div class="mui-card-header">商品参数</div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <p>商品货号：{{ goodsinfo.goods_no }}</p>
                    <p>库存情况：{{ goodsinfo.stock_quantity }}件</p>
                    <p>上架时间：{{ goodsinfo.add_time | dataFormatter }}</p>
                </div>
            </div>
            <div class="mui-card-footer">
                <mt-button type="primary" size="large" plain @click="goDesc(id)">图文介绍</mt-button>
                <mt-button type="danger" size="large" plain @click="goComment(id)">商品评论</mt-button>
            </div>
        </div>
    </div>
</template>

<script>
import Vue from "vue";
import Swiper from "@/components/common/swiper.vue";
import NumberBox from "@/components/common/numberbox.vue";
export default {
  data: function() {
    return {
      id: this.$route.params.id,
      lunbotu: [],
      rootPath: Vue.http.options.root,
      goodsinfo: {},
      selectedCount: 1,
      //控制小球是否显示
      ballFlag: false
    };
  },
  created() {
    this.getLunbotu();
    this.getGoodsInfo();
  },
  methods: {
    getLunbotu() {
      this.$http.get("api/getthumimages/" + this.id).then(result => {
        if (result.body.status === 0) {
          // 先循环轮播图数组的每一项，为item添加img属性，因为轮播图组件中只认识item.img，不认识item.src
          result.body.message.forEach(item => {
            item.src = this.rootPath + item.src;
          });
          this.lunbotu = result.body.message;
          console.log(this.lunbotu);
        }
      });
    },
    // 获取商品的信息
    getGoodsInfo() {
      this.$http.get("api/goods/getinfo/" + this.id).then(result => {
        if (result.body.status === 0) {
          this.goodsinfo = result.body.message[0];
          //console.log(this.goodsinfo);
        }
      });
    },
    goDesc(id) {
      this.$router.push({ name: "goodDesc", params: { id } });
    },
    goComment(id) {
      this.$router.push({ name: "goodComment", params: { id } });
    },
    getSelecedCount(count) {
      //console.log("子组件选择个数是"+count)
      this.selectedCount = count;
    },
    addToShopCar() {
      this.ballFlag = !this.ballFlag;
      //加入购物车
      const obj = {
        id: this.id,
        count: this.selectedCount,
        price: this.goodsinfo.sell_price,
        selected: true
      };
      //将数据追加到vuex中
      this.$store.commit("addToCar", obj);
    },
    beforeEnter(el) {
      el.style.transform = "translate(0,0)";
    },
    enter(el, done) {
      el.offsetWidth;
      // 获取小球的在页面中的位置
      const ballPosition = this.$refs.ball.getBoundingClientRect();
      // 获取徽标在页面中的位置
      const badgePosition = document
        .getElementById("badge")
        .getBoundingClientRect();

      const xDist = badgePosition.left - ballPosition.left;
      const yDist = badgePosition.top - ballPosition.top;

      el.style.transform = `translate(${xDist}px, ${yDist}px)`;
      el.style.transition = "all 1.5s ease";
      el.addEventListener("transitionend", done);
    },
    afterEnter(el) {
      el.style.transition = null;
      this.ballFlag = !this.ballFlag;
    }
  },
  components: {
    swiper: Swiper,
    NumberBox
  }
};
</script>

<style lang="less" scoped>
.mint-swipe {
  /*必须要设置高度，否则轮播图没有高度*/
  height: 200px;
  /*每一个轮播图的item*/
  .mint-swipe-item {
    &:nth-child(1) {
      background-color: red;
    }
    &:nth-child(2) {
      background-color: blue;
    }
    &:nth-child(3) {
      background-color: cyan;
    }

    img {
      width: 100%;
      height: 100%;
    }
  }
}

.goodsinfo-container {
  background-color: #eee;
  overflow: hidden;

  .now_price {
    color: red;
    font-size: 16px;
    font-weight: bold;
  }

  .mui-card-footer {
    display: block;
    button {
      margin: 15px 0;
    }
  }

  .ball {
    width: 15px;
    height: 15px;
    border-radius: 50%;
    background-color: red;
    position: absolute;
    z-index: 99;
    top: 390px;
    left: 146px;
  }
}
</style>
