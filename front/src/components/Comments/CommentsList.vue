<template>
  <div>
    <div v-for="comment in comments" :key="comment.id">
      <div class="w-16 h-16 rounded-full">
        <img
          src="../../assets/default.png"
          class="rounded-full w-12 h-12"
          alt="ユーザーアイコン"
        />
      </div>


    <p>{{ comment.content }}</p>

    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  props: ["question"],
  data() {
    return {
      comments: [],
    };
  },
  created() {
    axios.get(`/api/v1/comments/${this.$route.params.id}`).then((response) => {
      this.comments = response.data;
      console.log(response.data);
      console.log(this.comments);
    });
  },
};
</script>
