<template>
    <div class="photoinfo-container">
        <h3>{{ newinfo.ntitle }}</h3>
        <img :src="rootPath+newinfo.img" alt="">
        <p class="subtitle">
            <span>发表时间：{{ newinfo.add_time | dataFormatter }} </span>
            <span>阅读：{{ newinfo.readnum }}</span>
        </p>

        <!-- 缩略图区域 -->
        <!--<vue-preview :src="rootPath+newinfo.img"></vue-preview>-->

        <!-- 图片内容区域 -->
        <div class="content" v-html="newinfo.ncontent"></div>
    </div>
</template>

<script>
import Vue from "vue";
import Comment from "@/components/common/comment.vue";
export default {
  data: function() {
    return {
      nid: this.$route.params.id,
      newinfo: {},
      rootPath: Vue.http.options.root
    };
  },
  created() {
    this.getnewinfo();
  },
  methods: {
    getnewinfo() {
      this.$http.get("api/getnewinfo/" + this.nid).then(function({ body }) {
        if (body.status === 0 && body.message.length > 0) {
          this.newinfo = body.message[0];
        }
      });
    }
  },
  components: {
    Comment
  }
};
</script>

<style lang="less">
.photoinfo-container {
  padding: 3px;
  img {
    width: 100%;
    height: 180px;
  }
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
    text-indent: 2em;
  }
}
</style>
