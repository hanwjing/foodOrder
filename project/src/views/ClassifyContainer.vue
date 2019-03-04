<template>
    <div>
        <swiper :lunbotuList="lunboList" :isfull="true"></swiper>

        <div>
            <mt-header title="-- 主 食 --"></mt-header>
            <div class="chinesefood">
                <ul>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/newsList">
                            <img src="../assets/images/newImage/food1.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food2.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food3.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food4.jpg" alt="">
                        </router-link>
                    </li>
                </ul>
            </div>
        </div>
        <div>
            <mt-header title="-- 主 菜 --"></mt-header>
            <div class="chinesefood westfood">
                <ul>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/newsList">
                            <img src="../assets/images/newImage/food1.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food2.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food3.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food4.jpg" alt="">
                        </router-link>
                    </li>
                </ul>
            </div>
        </div>
        <div>
            <mt-header title="-- 汤 品 --"></mt-header>
            <div class="chinesefood">
                <ul>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/newsList">
                            <img src="../assets/images/newImage/food1.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food2.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food3.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food4.jpg" alt="">
                        </router-link>
                    </li>
                </ul>
            </div>
        </div>
        <div>
            <mt-header title="-- 甜 品 --"></mt-header>
            <div class="chinesefood westfood">
                <ul>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/newsList">
                            <img src="../assets/images/newImage/food1.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food2.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food3.jpg" alt="">
                        </router-link>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <router-link to="/classify/photoList">
                            <img src="../assets/images/newImage/food4.jpg" alt="">
                        </router-link>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</template>

<script>
import swiper from "@/components/common/swiper.vue";
export default {
  data() {
    return {
      lunboList: []
    };
  },
  created() {
    this.getLunbotu();
  },
  methods: {
    getLunbotu() {
      this.$http.get("api/getlunbo2").then(function(data) {
        // console.log(data);
        if (data.body.status == 0) {
          this.lunboList = data.body.message;
        }
      });
    }
  },
  components: {
    swiper
  }
};
</script>

<style lang="less" scoped>
.chinesefood {
  background-color: #fff;
  overflow-x: auto;
  &.westfood {
    overflow: hidden;
    ul {
      width: 100%;
      padding: 15px 0px 10px 15px;
      overflow: hidden;
      li {
        width: 45%;
      }
    }
  }
  ul {
    width: 166%;
    margin: 0;
    padding: 15px 5px 18px 15px;
    li {
      float: left;
      width: 22%;
      padding: 0;
      margin: 0 15px 15px 0;
      a {
        margin: 0;
        img {
          height: 90px;
        }
      }
    }
  }
}
</style>
