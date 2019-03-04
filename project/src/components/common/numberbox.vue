<template>
    <div class="mui-numbox" data-numbox-step='1' data-numbox-min='1'>
        <!-- "-"按钮，点击可减小当前数值 -->
        <button class="mui-btn mui-numbox-btn-minus" type="button">-</button>
        <input class="mui-numbox-input" type="number" ref="box" @change="changeNumber"/>
        <!-- "+"按钮，点击可增大当前数值 -->
        <button class="mui-btn mui-numbox-btn-plus" type="button">+</button>
    </div>
</template>

<script>
import mui from "MUI/js/mui.js";
export default {
  data: function() {
    return {};
  },
  props: ["max"],
  created() {},
  methods: {
    changeNumber() {
      this.$emit("func", this.$refs.box.value);
    }
  },
  watch: {
    max: function(newVal, oldVal) {
      mui(".mui-numbox")
        .numbox()
        .setOption("max", newVal);
    }
  },
  components: {}
};
</script>

<style lang="less" scoped>
</style>
