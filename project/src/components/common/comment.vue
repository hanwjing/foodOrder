<template>
    <div class="cmt-container">
        <h3>发表评论</h3>
        <hr>
        <textarea placeholder="请输入要BB的内容（做多吐槽120字）" v-model="content" maxlength="120"></textarea>

        <mt-button type="primary" size="large" @click="postComment">发表评论</mt-button>

        <div class="cmt-list">
            <div v-for="(item,idx) in comments" :key="item.content" class="cmt-item">
                <div class="cmt-title">
                    第{{ idx+1 }}楼&nbsp;&nbsp;用户：{{ item.user_name }}&nbsp;&nbsp;发表时间：{{ item.add_time | dataFormatter }}
                </div>
                <div class="cmt-body">
                    {{ item.content }}
                </div>
            </div>
        </div>

        <mt-button type="danger" size="large" plain @click="loadMore">加载更多</mt-button>
    </div>
</template>

<script>
export default {
  data: function() {
    return {
      content: "",
      comments: [],
      pageIndex: 1
    };
  },
  created() {
    this.getComments();
  },
  props: ["id"],
  methods: {
    postComment() {
      if (this.content.length != 0) {
        console.log(this.content);
        console.log(this.id);
        this.$http
          .post("api/postcomment/" + this.id, {
            content: this.content
          })
          .then(function({ body }) {
            //加载评论
            this.comments.unshift({
              content: this.content,
              user_name: "匿名用户",
              add_time: new Date()
            });
            this.content = "";
          });
      }
    },
    //获取评论数据
    getComments() {
      this.$http
        .get("api/getcomments/" + this.id, {
          //get请求的参数
          params: {
            pageindex: this.pageIndex
          }
        })
        .then(function({ body }) {
          console.log(body);
          if (body.status === 0) {
            if (this.pageIndex == 1) {
              this.comments = body.message;
            } else {
              this.comments = this.comments.concat(body.message);
            }
          }
        });
    },
    loadMore() {
      this.pageIndex++;
      this.getComments();
    }
  }
};
</script>

<style lang="less" scoped>
.cmt-container {
  h3 {
    font-size: 18px;
  }
  textarea {
    font-size: 14px;
    height: 85px;
    margin: 0;
  }

  .cmt-list {
    margin: 5px 0;
    .cmt-item {
      font-size: 13px;
      .cmt-title {
        line-height: 30px;
        background-color: #ccc;
      }
      .cmt-body {
        line-height: 35px;
        text-indent: 2em;
      }
    }
  }
}
</style>
