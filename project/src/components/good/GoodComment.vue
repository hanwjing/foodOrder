<template>
    <div>
        <comment :id="$route.params.id"></comment>
    </div>
</template>

<script>
import comment from "@/components/common/comment.vue";
export default {
  data: function() {
    return {};
  },
  created() {},
  methods: {},
  components: {
    comment
  }
};
</script>

<style lang="less" scoped>
</style>
