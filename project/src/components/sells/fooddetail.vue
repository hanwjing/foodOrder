<template>
    <div>
        <img :src="rootPath+fooddetail.url" alt="">
        <div class="mui-card ">
            <div class="mui-card-content ">
                <p style="color:#000;">{{fooddetail.fname}} &nbsp; &nbsp; &nbsp; &nbsp; 已售：{{fooddetail.fsell_num}}</p>
            </div>
            <table class="layui-table" lay-skin="line">
                <colgroup>
                    <col width="100">
                </colgroup>
                <tbody>
                <tr>
                    <td>描述：</td>
                    <td>{{fooddetail.fdescript}} </td>
                </tr>
                <tr>
                    <td>价格：</td>
                    <td>￥{{fooddetail.fprice}}.00  &nbsp; &nbsp; <span style="text-decoration: line-through;color:#ccc;font-size: 0.8rem;">原价：￥{{fooddetail.forigin_price}}.00</span> </td>
                </tr>
                <tr>
                    <td>分类：</td>
                    <td>{{fooddetail.fclass}} </td>
                </tr>
                </tbody>
            </table>
            <button v-show="flag" type="button" class="mui-btn mui-btn-outlined" @click="button">图 文 详 情</button>
            <button v-show="!flag" class="mui-btn mui-btn-outlined2">没 图 啦~ 喵喵喵~</button>
        </div>
        <div v-if="isflag">
            <img :src="rootPath+fooddetail.img" alt="">
            <img  v-if="fooddetail.img_url" :src="rootPath+fooddetail.img_url" alt="">
        </div>
        <button class="mui-btn mui-btn-outlined" @click=addCart>加入购物车</button>
        <button class="mui-btn mui-btn-outlined3 top" @click=comeback>订 单 列 表</button>
    </div>
</template>

<script>
import Vue from "vue";
import mui from "MUI/js/mui.js";
export default {
  name: "fooddetail",
  data() {
    return {
      fooddetail: {},
      id: this.$route.params.fid,
      rootPath: Vue.http.options.root,
      flag: false,
      isflag: false
    };
  },
  created() {
    this.getfooddetail();
  },
  methods: {
    getfooddetail() {
      this.$http.get("api/getfooddetail/" + this.id).then(({ body }) => {
        if (body.status == 0) {
          this.fooddetail = body.message[0];
          if (this.fooddetail.img) {
            this.flag = true;
          }
        }
      });
    },
    button() {
      this.isflag = true;
    },
    addCart() {
      if (localStorage.getItem("username")) {
        mui.alert("加入购物车成功");
      } else {
        mui.alert("请先登录");
        this.$router.push("/login");
      }
    },
    comeback() {
      this.$router.push("/myorder");
    }
  }
};
</script>

<style scoped lang="less">
img {
  width: 100%;
  height: 190px;
}

.mui-card {
  margin: 0 0 8px 0;
  padding-bottom: 8px;
  .mui-card-content {
    padding: 6px 10px 8px;
    border-bottom: 1px solid #ccc;
  }
  .mui-card-footer {
    padding: 0 5px 0 0;
    text-align: center;
    button {
      border: none;
      width: 100%;
      height: 100%;
      &.mui-btn-outlined {
        background-color: #4fc8ff;
        color: #fff;
      }
      &.mui-btn-outlined2 {
        background-color: #ccc;
        color: #f5f5f5;
      }
    }
  }
}
table {
  margin: 0;
}
button {
  border: none;
  width: 100%;
  height: 100%;
  &.mui-btn-outlined {
    background-color: #4fc8ff;
    color: #fff;
  }
  &.mui-btn-outlined2 {
    background-color: #ccc;
    color: #f5f5f5;
  }
}
.top {
  margin-top: 15px;
}
</style>
