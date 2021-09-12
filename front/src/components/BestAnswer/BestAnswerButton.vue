<template>
  <button
    @click="createBestAnswer()"
    class="
      bg-blue-500
      hover:bg-blue-700
      text-white
      font-bold
      py-2
      px-4
      rounded
      focus:outline-none
      focus:shadow-outline
      h-10
      w-40
    "
  >
    ベストアンサー
  </button>
</template>

<script>
import axios from "axios";
export default {
  props: { commentId: Number },
  methods: {
    createBestAnswer: function () {
      if (confirm("ベストアンサーにしますか?(一度決めたら変更できません)")) {
        axios
          .post(`/api/v1/comments/${this.commentId}/best_answers`)
          .then((response) => {
            console.log(response.data);
            this.$emit("render");
          });
      }
    },
  },
};
</script>

