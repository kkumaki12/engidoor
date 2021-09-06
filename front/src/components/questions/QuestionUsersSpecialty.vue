<template>
  <question-base :questions="questions"></question-base>
</template>

<script>
import QuestionBase from "./QuestionBase.vue";
import axios from "axios";

export default {
  components: {
    QuestionBase,
  },

  data: function () {
    return {
      questions: [],
    };
  },
  created() {
    axios
      .get(`api/v1/questions/specialty/${this.$store.state.specialty}`)
      .then((response) => {
        this.questions = response.data;
        console.log(response.data);
      });
  },
};
</script>
