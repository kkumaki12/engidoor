<template>
  <div>
    <a
      class="text-indigo-500 inline-flex items-center mt-4 pr-20"
      @click="showReplys(comment)"
      v-if="`${replys.length}` != '0'"
      >{{ replys.length }} 件のコメント
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
    <!-- rep -->
    <transition name="slide">
      <section
        class="text-gray-600 body-font overflow-hidden"
        v-if="activeItem2 === comment"
      >
        <div class="container px-5 py-24 mx-auto divide-y-2 divide-gray-100">
          <div v-for="comment in replys" :key="comment.id">
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
                  <span class="mt-1 text-gray-500 text-sm"
                    >{{ comment.user.name }}さん</span
                  >
                </div>
                <div class="md:flex-grow">
                  <p class="leading-relaxed"></p>
                  <p>{{ comment.content }}</p>
                  <p>{{ comment.created_at }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </transition>
    <!-- ここまで -->

    <button @click="openCommentBox(comment)" class="bg-gray-200
          hover:bg-gray-400
          text-gray
          font-bold
          py-2
          px-4
          rounded
          focus:outline-none
          focus:shadow-outline">コメント投稿</button>

    <div
      v-bind:class="`{is-active: activeItem === ${comment}}`"
      v-if="activeItem === comment"
      class="ap"
    >
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
        "
      />
      <button
        @click="createReply(comment)"
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
  </div>
</template>

<script>
import axios from "axios";

export default {
  props: ["comment", "question"],
  data() {
    return {
      comments: [],
      activeItem: null,
      activeItem2: null,
      content: "",
      question_id: "",
      reply_comment: "",
      replys: [],
    };
  },
  created() {
    this.replyCatch();
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
          this.replyCatch();
        })
        .catch((error) => {
          console.log(error);
        });
    },
    replyCatch() {
      axios.get(`/api/v1/comments/reply/${this.comment}`).then((response) => {
        this.replys = response.data;
        console.log(response.data);
      });
    },
    showReplys(comment_id) {
      if (this.activeItem2 === comment_id) {
        this.activeItem2 = null;
      } else {
        this.activeItem2 = comment_id;
      }
      console.log(this.activeItem2);
      console.log(comment_id);
    },
  },
};
</script>

<style scoped>
.slide-enter {
  overflow: hidden;
  max-height: 0;
}
.slide-enter-active {
  -moz-transition-duration: 0.3s;
  -webkit-transition-duration: 0.3s;
  -o-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -moz-transition-timing-function: ease-in;
  -webkit-transition-timing-function: ease-in;
  -o-transition-timing-function: ease-in;
  transition-timing-function: ease-in;
}
.slide-enter-to {
  max-height: 150px;
  overflow: hidden;
}
.slide-leave {
  max-height: 150px;
  overflow: hidden;
}
.slide-leave-active {
  -moz-transition-duration: 0.3s;
  -webkit-transition-duration: 0.3s;
  -o-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -moz-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
  -webkit-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
  -o-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
  transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
}
.slide-leave-to {
  overflow: hidden;
  max-height: 0;
}
.ap {
  height: 150px;
  overflow: hidden;
}
</style>
