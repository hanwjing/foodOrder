<template>
    <div class="mui-numbox" data-numbox-min='1'>
        <button class="mui-btn mui-btn-numbox-minus" type="button">-</button>
        <input id="test" class="mui-input-numbox" type="number" :value="initCount" ref="numbox" @change="goodCountChange"/>
        <button class="mui-btn mui-btn-numbox-plus" type="button">+</button>
    </div>
</template>

<script>
import mui from "MUI/js/mui.js";
export default {
  mounted() {
    // 初始化数字选择框组件
    mui(".mui-numbox").numbox();
  },
  methods: {
    //当商品数量发生改变的时候，我们需要同步vuex的数据
    goodCountChange() {
      let obj = {
        id: this.goodid,
        count: this.$refs.numbox.value
      };
      this.$store.commit("updateCar", obj);
    }
  },
  props: ["initCount", "goodid"]
};
</script>

<style lang="less" scoped>
</style>
