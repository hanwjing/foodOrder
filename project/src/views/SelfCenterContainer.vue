<template>
    <div class="selfCenter">
        <header>
            <router-link to="/login" >
                <img src="../assets/images/newImage/dessert1.jpg" alt="">
                <p v-if="!user">登 录 账 号</p>
                <p v-if="user">{{user}}</p>
            </router-link>
        </header>

        <ul class="mui-table-view">
            <li class="mui-table-view-cell">
                <router-link class="mui-navigate-right" to="/myorder">订单中心</router-link>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">我的购物车</a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">我的客服</a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">我的预约</a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">我的信息</a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">联系我们</a>
            </li>
            <li class="mui-table-view-cell">
                <a class="mui-navigate-right">问题反馈</a>
            </li>
            <li class="mui-table-view-cell exit" @click=exit>
                退出登录
            </li>
        </ul>



    </div>
</template>

<script>
export default {
  data() {
    return {
      user: ""
    };
  },
  created() {
    this.getItem();
  },
  methods: {
    getItem() {
      this.user = localStorage.getItem("username");
    },
    exit() {
      localStorage.removeItem("username");
      this.getItem();
    }
  }
};
</script>

<style lang="less" scoped>
.selfCenter {
  header {
    background-color: #fff;
    padding: 8px 0 10px 0;
    text-align: center;
    img {
      border-radius: 50%;
      width: 80px;
      height: 80px;
    }
    p {
      margin-top: 8px;
    }
  }
  .newmuicard {
    padding: 5px 10px;
    position: absolute;
    font-size: 14px;
    left: 50%;
    transform: translateX(-50%);
    margin: -10px 0 0 0;
    height: 100px;
    border: 1px solid #ccc;
    border-radius: 2px;
    background-color: white;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
    overflow: hidden;
    .mui-card-header {
      padding: 0;
      min-height: 30px;
      .mui-media-body {
        margin: 0;
        .mui-icon-forward {
          float: right;
          color: #000;
        }
      }
    }
    .mui-card-content {
      height: 80px;
    }
  }
  .exit {
    text-align: center;
    background-color: #f2f2f2;
  }
}
</style>
