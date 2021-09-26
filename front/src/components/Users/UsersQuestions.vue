<template>
  <div v-show="status">
    <div v-if="questions.length != 0">
      <users-question-base :questions="this.questions"></users-question-base>
    </div>
    <div v-else>
      <h1 class="text-center mt-6">投稿した質問はまだありません</h1>
      <img src="../../assets/undraw_Lost_re_xqjt.png" class="mx-auto" />
    </div>
  </div>
</template>

<script>
import UsersQuestionBase from "./UsersQuestionBase.vue";
import axios from "axios";

export default {
  components: { UsersQuestionBase },
  data() {
    return {
      questions: [],
      status: false,
    };
  },
  created() {
    axios
      .get(`api/v1/users/${this.$route.params.id}/questions/`)
      .then((response) => {
        this.questions = response.data;
        this.status = true;
        console.log(response.data);
        this.$emit("questions", this.questions);
      });
  },
};
</script>
