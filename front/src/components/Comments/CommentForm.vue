<template>
  <div>
    <div class="w-full flex justify-center mt-24">
      <textarea
        v-model="content"
        type="text"
        rows="3"
        class="
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
          focus:border-b-2 focus:border-indigo-500
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
        投稿
      </button>
    </div>
    <section class="text-gray-600 body-font overflow-hidden">
      <div
        class="
          container
          px-5
          py-24
          mx-auto
          divide-y-4 divide-gray-300 divide-dotted
        "
      >
        <div v-for="comment in comments" :key="comment.id">
          <div class="py-8 flex flex-wrap md:flex-nowrap">
            <div class="md:w-64 md:mb-0 mb-6 flex-shrink-0 flex flex-col">
              <div class="w-16 h-16 rounded-full">
                <img
                  v-if="comment.user.image.url"
                  :src="comment.user.image.url"
                  class="rounded-full w-12 h-12"
                  alt="ユーザーアイコン"
                />
                <img
                  v-else
                  src="../../assets/default.png"
                  class="rounded-full w-12 h-12"
                  alt="ユーザーアイコン"
                />
              </div>
              <span class="mt-1 text-gray-500 text-sm"
                >{{ comment.user.name }}さん</span
              >
              <div v-if="bestAnswerCommentId == comment.id">
                <div
                  class="
                    px-4
                    py-2
                    text-base
                    rounded-full
                    text-red-600
                    bg-red-200
                    inline-block
                  "
                >
                  ベストアンサー
                </div>
              </div>
            </div>
            <div class="md:flex-grow">
              <p class="leading-relaxed"></p>
              <p>{{ comment.content }}</p>
              <good-button
                :questionId="question.id"
                :commentId="comment.id"
              ></good-button>
              <p>{{ comment.created_at | moment }}</p>
              <template v-if="bestAnswer && question.user_id == user_id">
                <best-answer-button
                  :commentId="comment.id"
                  @render="statusBestAnswer()"
                ></best-answer-button>
              </template>

              <comments-replys
                :comment="comment.id"
                :question="question.id"
              ></comments-replys>
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
import moment from "moment";
export default {
  components: { GoodButton, CommentsReplys, BestAnswerButton },
  props: { question :Object },

  data: function () {
    return {
      content: "",
      question_id: "",
      user_id: this.$store.state.userId,
      comments: [],
      activeItem: null,
      bestAnswerCommentId: "",
      reply_comment: "",
      comment: [],
      bestAnswer: "true",
    };
  },
  filters: {
    moment: function (date) {
      moment.locale("ja");
      return moment(date).fromNow();
    },
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
    createComment() {
      axios
        .post("/api/v1/comments", {
          content: this.content,
          question_id: this.question.id,
          user_id: this.$store.state.userId,
        })
        .then((response) => {
          console.log(response);
          this.renderComments();
        })
        .catch((error) => {
          console.log(error);
          alert("コメントの投稿に失敗しました");
        });
      this.content = "";
    },
    renderComments() {
      axios
        .get(`/api/v1/comments/question/${this.$route.params.id}`)
        .then((response) => {
          this.comments = response.data;
          console.log(response.data);
        });
    },
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
          question_id: this.question.id,
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
          console.log(response.data);
          this.bestAnswerCommentId = response.data.comment_id;
          this.bestAnswer = false;
          console.log(this.bestAnswerCommentId);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

