<template>
    <div class="mui-input-group" id="input_example">
        <div class="mui-input-row">
            <label>用户名：</label>
            <input type="text" class="mui-input-clear" placeholder="请输入用户名" v-model="name">
        </div>
        <div class="mui-input-row">
            <label>密码：</label>
            <input type="password" class="mui-input-clear mui-input-password" placeholder="请输入密码" v-model="password">
        </div>
        <div class="mui-button-row">
            <button type="button" class="mui-btn mui-btn-primary" @click="submit">确认</button>
        </div>
        <div class="right">
            <p>没有账号？ <router-link to="/register">去注册</router-link></p >
        </div>
    </div>
</template>

<script>
import mui from "MUI/js/mui.js";
export default {
  data: function() {
    return {
      name: "",
      password: ""
    };
  },
  methods: {
    submit() {
      var check = true;
      mui("#input_example input").each(function() {
        if (!this.value || this.value.trim() == "") {
          var label = this.previousElementSibling;
          mui.alert(label.innerText + "不允许为空");
          check = false;
          return false;
        }
      }); //校验通过，继续执行业务逻辑
      if (check) {
        this.$http
          .post(
            "api/login",
            {
              username: this.name,
              password: this.password
            },
            { emulateJSON: true }
          )
          .then(function({ body }) {
            if (body.message.length == 0) {
              mui.alert("用户名或密码不正确");
            } else {
              localStorage.setItem("username", this.name);
              mui.alert("登陆成功!");
              this.$router.push({ path: "/" });
            }
          });
      }
    }
  }
};
</script>

<style scoped lang="less">
#input_example {
  overflow: hidden;
  .right {
    float: right;
  }
}
</style>
