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
                    v-if="user.image.url"
                    :src="user.image.url"
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
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      comments: [],

      content: "",
      question_id: "",
      user: [],
      comment: [],
      bestAnswer: "true",
    };
  },
  created() {
    axios
      .get(`/api/v1/users/${this.$route.params.id}/goods`)
      .then((response) => {
        this.comments = response.data;
        console.log(response.data);
      });
  },
};
</script>

