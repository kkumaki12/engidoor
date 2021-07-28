<template>
  <div>
    <section class="text-gray-600 body-font overflow-hidden">
      <div class="container px-5 py-24 mx-auto divide-y-2 divide-gray-100">
        <div v-for="comment in comments" :key="comment.id">
          <div class="-my-8 divide-y-2 divide-gray-100">
            <div class="py-8 flex flex-wrap md:flex-nowrap">
              <div class="md:w-64 md:mb-0 mb-6 flex-shrink-0 flex flex-col">
                <div class="w-16 h-16 rounded-full">
                  <img
                    src="../../assets/default.png"
                    class="rounded-full w-12 h-12"
                    alt="ユーザーアイコン"
                  />
                </div>
                <span class="mt-1 text-gray-500 text-sm">さん</span>
              </div>
              <div class="md:flex-grow">
                <p class="leading-relaxed"></p>
                <p>{{ comment.content }}</p>
                <good-button
                  :questionId="question.id"
                  :commentId="comment.id"
                ></good-button>
                <p>{{ comment.created_at }}</p>
                <a class="text-indigo-500 inline-flex items-center mt-4"
                  >○○件のコメント
                  <svg
                    class="w-4 h-4 ml-2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    stroke-width="2"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  >
                    <path d="M5 12h14"></path>
                    <path d="M12 5l7 7-7 7"></path>
                  </svg>
                </a>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "axios";
import GoodButton from "../Good/GoodButton.vue";

export default {
  components: { GoodButton },
  props: ["question"],
  data() {
    return {
      comments: [],
    };
  },
  created() {
    axios.get(`/api/v1/comments/${this.$route.params.id}`).then((response) => {
      this.comments = response.data;
      console.log(response.data);
    });
  },
};
</script>
