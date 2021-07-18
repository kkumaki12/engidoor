<template>
  <div>
    <!-- 質問カード -->

    <div class="tabs flex">
      <button
        class="
          text-gray-600
          py-4
          px-6
          block
          hover:text-green-900
          focus:outline-none
          text-green-500
          border-b-2
          font-medium
          border-green-500
          w-1/3
          
        "
        v-on:click="isActive = '1'"
      >
        新着質問
      </button>

      <button
        class="
          text-gray-600
          py-4
          px-6
          block
          hover:text-green-900
          focus:outline-none
          text-green-500
          border-b-2
          font-medium
          border-green-500
          w-1/3
          
        "
        v-on:click="isActive = '2'"
      >
        解決済み質問
      </button>

      <button
        class="
          text-gray-600
          py-4
          px-6
          block
          hover:text-green-900
          focus:outline-none
          text-green-500
          border-b-2
          font-medium
          border-green-500
          w-1/3
          
        "
        v-on:click="isActive = '3'"
      >
        何か
      </button>
    </div>
    <ul class="contents">
      <li v-if="isActive === '1'"><question-latest-posts :questions="questions"></question-latest-posts></li>
      <li v-else-if="isActive === '2'">コンテンツ2</li>
      <li v-else-if="isActive === '3'">コンテンツ3</li>
    </ul>

  </div>
</template>

<script>
import axios from "axios";
import QuestionLatestPosts from "./QuestionLatestPosts.vue";
export default {
  components: {
    QuestionLatestPosts,
  },
  data() {
    return {
      questions: [],
      user: [],
      isActive: "1",
    };
  },
  created() {
    axios.get("api/v1/questions/list").then((response) => {
      this.questions = response.data;
      console.log(response.data);
    });
  },
};
</script>
