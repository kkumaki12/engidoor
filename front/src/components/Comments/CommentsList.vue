<template>
  <div>
    <div v-for="comment in comments" :key="comment.id">
      <div v-if="(question.id = comment.question_id)">
        <div class="w-16 h-16 rounded-full">
          <img src="../../assets/default.png" class="rounded-full w-12 h-12"
          alt="ユーザーアイコン" >
        </div>

        {{ comment.user.name }}
        {{ comment.content }}
        {{ comment.created_at }}前
        <div v-if="this.$store.state.token">
          <div>ベストアンサーです</div>

          <button
            
            v-if="question.user_id == this.$store.state.userId"
          >
            ベストアンサー
          </button>
        </div>
      </div>
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
    axios.get("/api/v1/comments").then((response) => {
      this.questions = response.data;
      console.log(response.data);
    });
  },
  
  
};
</script>
