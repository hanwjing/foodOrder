<template>
    <div>
        <mt-header title="-- 每 日 一 言 --"></mt-header>
        <div class="yiyan">
            <p> from : {{oneWord.catname}}</p>
            <p>{{oneWord.hitokoto}}</p>
            <span>----by:{{oneWord.source}}</span>
        </div>

        <ul class="photo-list">
            <router-link v-for="item in newsList" :key="item.nid" :to="'/home/newsinfo/'+item.nid" tag="li">
                <img v-lazy="rootPath+item.img">
                <div class="info">
                    <h1 class="info-title">{{ item.ntitle }}</h1>
                    <div class="info-body">{{ item.ncontent | contentFormatter}}</div>
                </div>
            </router-link>
        </ul>
    </div>
</template>

<script>
import Vue from "vue";
export default {
  data: function() {
    return {
      newsList: [],
      oneWord: {},
      rootPath: Vue.http.options.root
    };
  },
  created() {
    this.getNewsList();
    this.getword();
  },
  methods: {
    getword() {
      this.$http
        .get(
          "https://api.imjad.cn/hitokoto/?cat=&charset=utf-8&length=50&encode=json&fun=sync&source=1"
        )
        .then(({ body }) => {
          this.oneWord = body;
        });
    },
    getNewsList() {
      this.$http.get("api/getnewslist").then(function({ body }) {
        console.log(body);
        if (body.status === 0) {
          this.newsList = body.message;
        }
      });
    }
  }
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
      height: 175px;
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
      background-color: rgba(0, 0, 0, 0.6);
      max-height: 84px;

      .info-title {
        font-size: 14px;
        text-align: center;
      }
      .info-body {
        text-indent: 2em;
        font-size: 13px;
      }
    }
  }
}

.mint-header {
  color: #000;
  background-color: #fff !important;
}
.yiyan {
  text-indent: 2em;
  background-color: #fff;
  overflow: hidden;
  padding: 0 10px;
  span {
    float: right;
  }
}
</style>
