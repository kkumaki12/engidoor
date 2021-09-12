<template>
  <!-- v-if="craeted" -->
  <div class="col-span-12 lg:col-span-8" v-if="create">
    <div
      v-if="bestAnswer"
      class="
        inline-block
        rounded-full
        text-white
        bg-red-400
        duration-300
        text-xs
        font-bold
        mr-1
        md:mr-2
        mb-2
        px-2
        md:px-4
        py-1
        opacity-90
      "
    >
      解決済
    </div>
    <div
      v-else
      href="#"
      class="
        inline-block
        rounded-full
        text-white
        bg-blue-400
        duration-300
        text-xs
        font-bold
        mr-1
        md:mr-2
        mb-2
        px-2
        md:px-4
        py-1
        opacity-90
      "
    >
      回答受付中
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  props: ["question"],
  data: function () {
    return {
      bestAnswer: "",
      create: false,
    };
  },
  created() {
    axios
      .get(`/api/v1/bestanswer/${this.question.id}`)
      .then((response) => {
        this.bestAnswer = response.data;
        console.log(response.data);
        this.create = true;
        this.$emit("status", true);
      })
      .catch((error) => {
        console.log(error);
        this.create = true;
        this.$emit("status", true);
      });
  },
};
</script>
