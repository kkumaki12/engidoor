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
    <p>{{  comment.created_at }}</p>
    <p>{{ comment.name }}さん</p>
    <good-button :questionID="question.id"></good-button>
    

    </div>
  </div>
</template>

<script>
import axios from "axios";
import GoodButton from '../Good/GoodButton.vue';

export default {
  components: { GoodButton },
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
    });
  },
};
</script>
