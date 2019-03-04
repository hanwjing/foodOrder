<template>
    <div>
        <div id="slider" class="mui-slider">
            <div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
                <div class="mui-scroll">
                    <div v-for="item in cates" :key="item.id" :class="['mui-control-item',item.id==0?'mui-active':'']" @click="toggle(item.id)">
                        {{ item.title }}
                    </div>
                </div>
            </div>
        </div>

        <ul class="photo-list">
            <router-link v-for="item in list" :key="item.id" :to="'/home/photoInfo/'+item.id" tag="li">
                <!--图片的请求地址为根路径+服务器返回的路径-->
                <img v-lazy="rootPath+item.img_url">
                <div class="info">
                    <h1 class="info-title">{{ item.title }}</h1>
                    <div class="info-body">{{ item.zhaiyao }}</div>
                </div>
            </router-link>
        </ul>
    </div>
</template>

<script>
import mui from "MUI/js/mui.js";
import Vue from "vue";
export default {
  data: function() {
    return {
      cates: [],
      list: [],
      rootPath: Vue.http.options.root
    };
  },
  created() {
    this.getCatesData();
  },
  mounted() {
    // 当组件中的DOM结构被渲染好并放到页面中后，会执行这个钩子函数
    // 如果要操作元素最好在 mounted 里面，因为这里时候的DOM元素是最新的
    mui(".mui-scroll-wrapper").scroll({
      deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
    });
  },
  methods: {
    getCatesData() {
      this.$http.get("api/getimgcategory").then(function({ body }) {
        if (body.status === 0) {
          this.cates = body.message;
          //手动追加一个全部的数据
          this.cates.unshift({ title: "全部", id: 0 });
          this.getImagesById(this.cates[0].id);
        }
      });
    },
    getImagesById(id) {
      this.$http.get("api/getimages/" + id).then(function({ body }) {
        console.log(body);
        this.list = body.message;
      });
    },
    toggle(id) {
      this.getImagesById(id);
    }
  },
  components: {}
};
</script>

<style lang="less" scoped>
.photo-list {
  list-style: none;
  margin: 0;
  padding: 10px;
  padding-bottom: 0;

  li {
    background-color: #ccc;
    text-align: center;
    margin-bottom: 10px;
    box-shadow: 0 0 9px #999;
    position: relative;

    img {
      width: 100%;
      vertical-align: middle;
    }

    /*懒加载的样式*/
    img[lazy="loading"] {
      width: 40px;
      height: 300px;
      margin: auto;
    }

    .info {
      color: white;
      text-align: left;
      position: absolute;
      bottom: 0;
      background-color: rgba(0, 0, 0, 0.4);
      max-height: 84px;

      .info-title {
        font-size: 14px;
      }
      .info-body {
        font-size: 13px;
      }
    }
  }
}
</style>
