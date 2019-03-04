<template>
    <div class="photoinfo-container">
        <h3>{{ photoinfo.title }}</h3>
        <p class="subtitle">
            <span>发表时间：{{ photoinfo.add_time | dataFormatter }} </span>
            <span>点击：{{ photoinfo.click }}次</span>
        </p>

        <!-- 缩略图区域 -->
        <vue-preview :slides="photoList" ></vue-preview>

        <!-- 图片内容区域 -->
        <div class="content" v-html="photoinfo.content"></div>
    </div>
</template>

<script>
import Vue from "vue";
export default {
  data: function() {
    return {
      id: this.$route.params.id,
      photoinfo: {}, // 图片详情
      photoList: [],
      rootPath: Vue.http.options.root
    };
  },
  created() {
    this.getImageDeatils();
    this.getThumbs();
  },
  methods: {
    getImageDeatils() {
      this.$http.get("api/getimageInfo/" + this.id).then(({ body }) => {
        //console.log(body);
        if (body.status === 0 && body.message.length > 0) {
          this.photoinfo = body.message[0];
        }
      });
    },
    getThumbs() {
      this.$http.get("api/getthumimages/" + this.id).then(({ body }) => {
        body.message.forEach(item => {
          item.src = this.rootPath + item.src;
          item.msrc = item.src;
          item.w = 400;
          item.h = 200;
        });
        this.photoList = body.message;
        console.log(this.photoList);
      });
    }
  },
  components: {}
};
</script>

<style lang="less" scoped>
.photoinfo-container {
  padding: 3px;
  h3 {
    color: #26a2ff;
    font-size: 15px;
    text-align: center;
    margin: 15px 0;
  }
  .subtitle {
    display: flex;
    justify-content: space-between;
    font-size: 13px;
  }

  .content {
    font-size: 13px;
    line-height: 30px;
  }
}
</style>

<style lang="less">
/*因为缩略图是第三方插件，如果在scoped下无法修改第三方插件的样式，所以这边不设置scoped*/
.my-gallery figure {
  width: 100px;
  margin: 10px;
  display: inline-block;

  img[itemprop] {
    margin: 10px;
    box-shadow: 0 0 8px #999;
    width: 100px;
  }
}
</style>
