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
          border-green-500
          w-1/3
          
        "
        v-on:click="isActives = '1'"
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
        v-on:click="isActives = '2'"
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
        v-on:click="isActives = '3'"
      >
      未解決
      </button>
    </div>
    <ul class="contents">
      <li v-if="isActives === '1'"><users-questions v-on:questions="$event"></users-questions></li>
      <li v-else-if="isActives === '2'">コンテンツ2</li>
      <li v-else-if="isActives === '3'">コンテンツ3</li>
    </ul>

  </div>
 
  </template>

<script>
import UsersQuestions from "./UsersQuestions.vue";
export default {
  components: { UsersQuestions },
  data() {
    return {
      questions: [],
      isActives: '1'
    };
  },
}
</script>
