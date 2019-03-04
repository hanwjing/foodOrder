<template>
    <div class="orderseat">
        <!-- 顶部滑动条区域
               参照MUI案例中的 tab-top-webview-main.html
         -->
        <div id="slider" class="mui-slider">
            <div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
                <div class="mui-scroll" id="mui-scroll-">
                    <div v-for="item in seatclass" :key="item.st_id" :class="['mui-control-item',item.st_id==0?'mui-active':'']" @click=toggle(item.st_id)>
                        {{ item.st_title }}
                    </div>
                </div>

            </div>
        </div>


        <div class="mui-card" v-for="item in seatlist">
            <router-link :to="'/orderseat/orderinfo/'+item.oid">
                <div class="mui-card-content">
                    <img :src="rootPath+item.img" alt="">
                </div>
                <div class="mui-card-footer mui-card-media" >
                    <div class="mui-media-body">
                        <p>{{item.st_title}}</p>
                        <p style="font-size: 12px;color: #888;">发表于 {{item.add_time | dataFormatter}}</p>
                        <span style="color: #000;">￥{{item.oprice}}.00 </span>
                        <span style="font-size: 12px;color: #888;"> &nbsp; 已预约：{{item.ohas_order}} &nbsp; 剩余：{{item.oleave}}</span>
                        <button type="button" class="mui-btn buttonfr">预约</button>
                    </div>
                </div>
            </router-link>
        </div>
    </div>
</template>

<script>
// 1. 导入 mui 的js文件
import mui from "MUI/js/mui.js";
import Vue from "vue";
export default {
  data() {
    return {
      rootPath: Vue.http.options.root,
      seatlist: [],
      seatclass: []
    };
  },
  created() {
    this.getseatclass();
  },
  mounted() {
    mui(".mui-scroll-wrapper").scroll({
      deceleration: 0.0005
    });
  },
  methods: {
    getseatclass() {
      this.$http.get("api/getseatclass").then(({ body }) => {
        if (body.status == 0) {
          this.seatclass = body.message;
          this.seatclass.unshift({ st_title: "全部", st_id: 0 });
          this.getseatlist(this.seatclass[0].st_id);
        }
      });
    },
    getseatlist(id) {
      this.$http.get("api/getseatlist/" + id).then(({ body }) => {
        this.seatlist = body.message;
      });
    },
    toggle(id) {
      this.getseatlist(id);
    }
  }
};
</script>

<style lang="less" scoped>
.orderseat {
  background-color: #fff;
  .mui-slider {
    z-index: 0;
    #mui-scroll- > .mui-control-item.mui-active {
      color: #ffc200;
    }
  }
  .mui-card {
    height: 210px;
    .mui-card-content {
      height: 130px;
      img {
        width: 100%;
        height: 100%;
      }
    }
  }
  .mui-media-body {
    font-size: 13px;
    line-height: 12px;
    p {
      margin: 6px 0;
    }
    span {
      margin: 5px 0;
    }
    .buttonfr {
      float: right;
      margin: -12px 0 0 30px;
      border: none;
      border-radius: 12px;
      background-color: #ffc200;
    }
  }
}
</style>
