<template>
    <div class="area">
        <div class="mui-content">
            <form class="mui-input-group">
                <div class="mui-input-row">
                    <label>账号</label>
                    <input id='account' type="text" v-model="account" class="mui-input-clear mui-input" placeholder="请输入账号">
                </div>
                <div class="mui-input-row">
                    <label>密码</label>
                    <input id='password' type="password" v-model="pwd" class="mui-input-clear mui-input" placeholder="请输入密码">
                </div>
                <div class="mui-input-row">
                    <label>确认</label>
                    <input id='password_confirm' type="password" v-model="confirmpwd" class="mui-input-clear mui-input" placeholder="请确认密码">
                </div>
            </form>
            <div class="mui-content-padded">
                <!--v-tap="{methods: register}"-->
                <a id='reg' class="mui-btn mui-btn-block mui-btn-warning"  @click=register>注 册</a>
            </div>
        </div>
    </div>
</template>

<script>
import mui from "MUI/js/mui.js";
export default {
  data() {
    return {
      account: "",
      pwd: "",
      confirmpwd: ""
    };
  },
  created() {},
  methods: {
    register() {
      if (this.account == "" || this.pwd == "" || this.confirmpwd == "") {
        mui.alert("请输入必填的注册信息");
      } else if (this.pwd.length < 6) {
        mui.alert("密码必须大于六位");
      } else if (this.confirmpwd !== this.pwd) {
        mui.alert("两次密码不一致");
      } else {
        this.$http
          .post(
            "api/hasuser",
            {
              username: this.account
            },
            { emulateJSON: true }
          )
          .then(({ body }) => {
            if (body.status === 0) {
              if (body.message.length == 0) {
                let data = { username: this.account, password: this.pwd };
                console.log(data);
                this.$http
                  .post("api/register", data, { emulateJSON: true })
                  .then(({ body }) => {
                    mui.alert("注册成功");
                    setTimeout(
                      function() {
                        this.$router.push("/login");
                      }.bind(this),
                      1000
                    );
                  });
              } else {
                mui.alert("注册失败，用户名已被占用");
              }
            }
          });
      }
    }
  }
};
</script>

<style lang="less" scoped>
.area {
  margin: 0px auto 0 auto;
}
.mui-input-group:first-child {
  /*margin-top: 10px;*/
}
.mui-input-group label {
  width: 22%;
}
.mui-input-row label ~ input,
.mui-input-row label ~ select,
.mui-input-row label ~ textarea {
  width: 78%;
}
.mui-btn {
  padding: 10px;
}
.mui-btn-block {
  &.mui-btn-warning {
    background-color: #ffc200;
  }
  color: #fff;
}
.mui-checkbox input[type="checkbox"],
.mui-radio input[type="radio"] {
  top: 6px;
}
</style>
