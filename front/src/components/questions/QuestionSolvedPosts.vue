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
    axios.get("api/v1/questions/solved").then((response) => {
      this.questions = response.data;
    });
  },
};
</script>
