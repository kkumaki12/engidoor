<template>
<div>
  <div class="w-full flex justify-center mt-24">
    <textarea
      v-model="content"
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

    </div>
  </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  props: ["question"],

  data: function () {
    return {
      content: "",
      question_id: "",
      user_id: this.$store.state.userId,
      comments: []
    };
  },
    created() {
    axios.get(`/api/v1/comments/${this.$route.params.id}`).then((response) => {
      this.comments = response.data;
      console.log(response.data);
      console.log(this.comments);
    });
  },
  methods: {
    createComment() {
      axios
        .post("/api/v1/comments", {
          content: this.content,
          question_id: this.question,
          user_id: this.$store.state.userId,
        })
        .then((response) => {
          console.log(response);
          axios.get(`/api/v1/comments/${this.$route.params.id}`).then((response) => {
      this.comments = response.data;
    });
        })
        .catch((error) => {
          console.log(error);
          alert("コメントの投稿に失敗しました");
        });
        this.content = '';
    },
  },
};
</script>

