<template>
  <div>
    <a
      href="#"
      class="
        grid grid-rows-2
        mx-auto
        mb-3
        py-1
        w-4/5
        2lg:w-3/5
        rounded-md
        bg-green-400
      "
    >
      <div class="inline-block font-medium text-2xl text-white">
        {{ count }}
      </div>
      <div class="inline-block font-medium text-white mx-1 text-sm lg:text-md">
        回答
      </div>
    </a>
  </div>
</template>

<script>
import axios from "axios";
export default {
  props: ["question"],
  data: function () {
    return {
      count: "",
    };
  },
  created() {
    axios.get(`/api/v1/comments_count/${this.question}`).then((response) => {
      this.count = response.data;
      console.log(response.data);
    });
  },
};
</script>

