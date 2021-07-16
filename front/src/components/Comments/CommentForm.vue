<template>
<div class="w-full flex justify-center mt-24">
   <textarea
              v-model="postComment"
              type="text"
              rows="3"
              class="
                bg-gray-100
                appearance-none
                border
                rounded
                flex flex-col
        md:w-3/5
        justify-center
                py-2
                px-3
                text-gray-700
                leading-tight
                focus:outline-none
                focus:shadow-outline
              "
            />
            <button
              @click="createComment()"
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
              "
            >
              投稿する
            </button>
</div>
</template>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      postComment: '',
    };
  },
  methods: {
    createComment() {
      axios
        .post("/api/v1/comments", this.comment)
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

