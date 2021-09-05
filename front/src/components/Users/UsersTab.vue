  <template>
  <div>
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
        :class="{ 'border-green-500': isActives === '1' }"
        v-on:click="isActives = '1'"
      >
        投稿した質問
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
        :class="{ 'border-green-500': isActives === '2' }"
        v-on:click="isActives = '2'"
      >
        いいねした回答
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
        :class="{ 'border-green-500': isActives === '3' }"
        v-on:click="isActives = '3'"
      >
        未解決
      </button>
    </div>
    <ul class="contents">
      <li v-if="isActives === '1'">
        <users-questions v-on:questions="$event"></users-questions>
      </li>
      <li v-else-if="isActives === '2'">
        <users-goods-comments></users-goods-comments>
      </li>
      <li v-else-if="isActives === '3'"><users-unsolved-questions></users-unsolved-questions></li>
    </ul>
  </div>
</template>

<script>
import UsersQuestions from "./UsersQuestions.vue";
import UsersGoodsComments from "./UsersGoodsComment.vue";
import UsersUnsolvedQuestions from "./UsersUnsolvedQuestions.vue";

export default {
  components: { UsersQuestions, UsersGoodsComments, UsersUnsolvedQuestions },
  data() {
    return {
      questions: [],
      isActives: "1",
    };
  },
};
</script>
