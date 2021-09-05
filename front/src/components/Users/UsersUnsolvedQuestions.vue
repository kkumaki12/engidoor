<template>
  <users-question-base :questions="this.questions"></users-question-base>
</template>

<script>
import UsersQuestionBase from "./UsersQuestionBase.vue";
import axios from "axios";

export default {
  components: { UsersQuestionBase },
  data() {
    return {
      questions: [],
    };
  },
  created() {
    axios
      .get(`api/v1/users/${this.$route.params.id}/questions/unsolved`)
      .then((response) => {
        this.questions = response.data;
        console.log(response.data);
        this.$emit("questions", this.questions);
      });
  },
};
</script>
