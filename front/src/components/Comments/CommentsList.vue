<template>
  <div>
    <section class="text-gray-600 body-font overflow-hidden">
      <div class="container px-5 py-24 mx-auto divide-y-2 divide-gray-100">
        <div v-for="comment in comments" :key="comment.id">
          <div class="-my-8 divide-y-2 divide-gray-900">
            <div class="py-8 flex flex-wrap md:flex-nowrap">
              <div class="md:w-64 md:mb-0 mb-6 flex-shrink-0 flex flex-col">
                <div class="w-16 h-16 rounded-full">
                  <img
                    v-if="comment.user.image.url"
                    :src="comment.user.image.url"
                    class="rounded-full w-12 h-12"
                    alt="ユーザーアイコン"
                  />
                </div>
                <span class="mt-1 text-gray-500 text-sm"
                  >{{ comment.user.name }}さん</span
                >
              </div>
              <div class="md:flex-grow">
                <p class="leading-relaxed"></p>
                <p>{{ comment.content }}</p>
                <good-button
                  :questionId="question.id"
                  :commentId="comment.id"
                ></good-button>
                <p>{{ comment.created_at }}</p>
                <comments-replys
                  :comment="comment.id"
                  :question="question"
                ></comments-replys>
              </div>
              <template v-if="bestAnswer">
                <best-answer-button
                  :commentId="comment.id"
                ></best-answer-button>
              </template>
              <div v-else class="text-red-600">ベストアンサー</div>
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
import CommentsReplys from "./CommentsReplys.vue";
import BestAnswerButton from "../BestAnswer/BestAnswerButton.vue";

export default {
  components: { GoodButton, CommentsReplys, BestAnswerButton },
  props: ["question"],
  data() {
    return {
      comments: [],
      activeItem: null,
      content: "",
      question_id: "",
      reply_comment: "",
      comment: [],
      bestAnswer: "true",
    };
  },
  created() {
    axios
      .get(`/api/v1/comments/question/${this.$route.params.id}`)
      .then((response) => {
        this.comments = response.data;
        console.log(response.data);
      });
    this.replyCatch();
    this.statusBestAnswer();
  },
  methods: {
    openCommentBox(comment_id) {
      if (this.activeItem === comment_id) {
        this.activeItem = null;
      } else {
        this.activeItem = comment_id;
      }
      console.log(this.activeItem);
      console.log(comment_id);
    },
    createReply(comment_id) {
      axios
        .post("/api/v1/comments", {
          content: this.content,
          question_id: this.question,
          user_id: this.$store.state.userId,
          reply_comment: comment_id,
        })
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    replyCatch() {
      axios.get(`/api/v1/comments/reply/57`).then((response) => {
        this.replys = response.data;
        console.log(response.data);
      });
    },
    statusBestAnswer() {
      axios
        .get(`/api/v1/bestanswer/${this.$route.params.id}`)
        .then((response) => {
          console.log("a");
          this.bestAnswer = false;
          console.log(this.bestAnswer);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

