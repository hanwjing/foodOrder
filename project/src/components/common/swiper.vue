<template>
    <!--<div>-->
        <!--<mt-swipe :auto="4000">-->
            <!--&lt;!&ndash; 在组件中，使用v-for循环的话，一定要使用key &ndash;&gt;-->
            <!--&lt;!&ndash; 将来谁使用此轮播图组件，谁为我们传递lunbotuList &ndash;&gt;-->
            <!--&lt;!&ndash; 此时lunbotuList 应该是父组件向子组件传值来设置 &ndash;&gt;-->
            <!--<mt-swipe-item v-for="item in lunbotuList" :key="item.url">-->
                <!--&lt;!&ndash;:class="{'full': isfull}" 表示是否需要添加full样式，如果为true表示需要添加。-->
                     <!--为了解决在商品详情页面中轮播图的图片使用宽高100%页面不好看的问题&ndash;&gt;-->
                <!--<img :src="item.src" alt="" :class="{'full': isfull}">-->
            <!--</mt-swipe-item>-->
        <!--</mt-swipe>-->
    <!--</div>-->

    <div>
        <!-- 轮播图区域 -->
        <mt-swipe :auto="4000">
            <mt-swipe-item v-for="item in lunbotuList" :key="item.url">
                <img :src="rootPath+item.img" alt="" :class="{'full': isfull}">
            </mt-swipe-item>
        </mt-swipe>

    </div>

</template>

<script>
import Vue from "vue";
export default {
  data: function() {
    return {
      rootPath: Vue.http.options.root
    };
  },
  created() {},
  props: ["lunbotuList", "isfull"],
  methods: {},
  components: {}
};
</script>

<style lang="less" scoped>
.mint-swipe {
  height: 150px;

  .mint-swipe-item {
    /*让图片居中*/
    text-align: center;

    img {
      /*高度100%*/
      height: 100%;
    }
  }
}

/*是否启用宽度100%*/
.full {
  width: 100%;
}
</style>
