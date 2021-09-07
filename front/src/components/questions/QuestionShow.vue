<template>
  <div>
    <main class="w-full flex justify-center mt-24">
      <div
        class="
          flex flex-col
          md:w-3/5
          p-3
          space-y-5
          rounded-xl
          border border-black
          bg-white
          shadow-md
        "
      >
        <div>
          <section class="font-bold text-lg text-blue-900">
            <img
              v-if="question.user.image.url"
              :src="question.user.image.url"
              class="w-16 h-16 rounded-full"
            />
            <img
              v-else
              src="../../assets/default.png"
              class="rounded-full w-16 h-16"
              alt="ユーザーアイコン"
            />
            <div>{{ question.user.name }}さん</div>
            <div>{{ this.$route.params }}</div>
            <div class="text-right mr-5">回答数{{ count }}</div>
          </section>
          <section class="text-sm font-thin text-orange-400">
            {{ question.created_at | moment }}
          </section>
          <section class="text-3xl font-bold">{{ question.title }}</section>
          <section class="font-normal text-md text-gray-700">
            {{ question.content }}
          </section>
          <section class="font-normal text-md text-gray800">
            <ul></ul>
          </section>

          <section class="flex justify-end">
            <button
              v-if="question.user_id === this.$store.state.userId"
              type="button"
              class="bg-red-600 text-white px-3 py-1 rounded-md"
              @click="deleteQuestion()"
            >
              削除
            </button>
          </section>
        </div>
      </div>
    </main>
    <comment-form :question="question"></comment-form>
  </div>
</template>

<script>
import axios from "axios";
import CommentForm from "../Comments/CommentForm.vue";
import Mixins from "@/mixin.js";

export default {
  components: { CommentForm },
  mixins: [Mixins],

  data: function () {
    return {
      question: [],
      count: "",
    };
  },
  created() {
    axios.get(`/api/v1/questions/${this.$route.params.id}`).then((response) => {
      this.question = response.data;
      console.log(response.data);
    });
    axios
      .get(`/api/v1/comments_count/${this.$route.params.id}`)
      .then((response) => {
        this.count = response.data;
        console.log(response.data);
      });
  },
  methods: {
    deleteQuestion() {
      if (confirm("削除しますか？")) {
        axios
          .delete(`/api/v1/questions/${this.$route.params.id}`)
          .then((response) => {
            console.log(response);
            this.$router.push("/");
          })
          .catch((error) => {
            console.log(error);
            alert("失敗しました");
          });
      }
    },
  },
};
</script>

