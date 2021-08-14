<template>
  
    <div v-if="genre === 'null'">

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
          w-1/2
        "
        :class="{ 'border-green-500': isActive === '1' }"
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
          w-1/2
        "
        :class="{ 'border-green-500': isActive === '2' }"
        v-on:click="isActive = '2'"
      >
        解決済み質問
      </button>



    </div>
    <ul class="contents">
      <li v-if="isActive === '1'">
        <question-latest-posts></question-latest-posts>
      </li>
      <li v-else-if="isActive === '2'">
        <question-solved-posts></question-solved-posts>
      </li>

    </ul>
  </div>
  
  <div v-else>


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
          w-1/3
        "
        :class="{ 'border-green-500': isActive === '1' }"
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
          w-1/3
        "
        :class="{ 'border-green-500': isActive === '2' }"
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
          w-1/3
        "
        :class="{ 'border-green-500': isActive === '3' }"
        v-on:click="isActive = '3'"
      >
        {{ this.genre }}の質問
      </button>

    </div>
    <ul class="contents">
      <li v-if="isActive === '1'">
        <question-latest-posts></question-latest-posts>
      </li>
      <li v-else-if="isActive === '2'">
        <question-solved-posts></question-solved-posts>
      </li>
      <li v-else-if="isActive === '3'"><question-users-specialty></question-users-specialty></li>
    </ul>
  </div>
  
</template>

<script>
import QuestionUsersSpecialty from '../Questions/QuestionUsersSpecialty.vue';
import QuestionLatestPosts from "./QuestionLatestPosts.vue";
import QuestionSolvedPosts from "./QuestionSolvedPosts.vue";


export default {
  components: {
    QuestionLatestPosts,
    QuestionSolvedPosts,
    QuestionUsersSpecialty,
  },
  data: function () {
    return {
      questions: [],
      user: [],
      isActive: "1",
      genre: `${this.$store.state.specialty}`
    };
  },
};
</script>
