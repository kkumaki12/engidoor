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
      未解決
      </button>
    </div>
    <ul class="contents">
      <li v-if="isActive === '1'">s</li>
      <li v-else-if="isActive === '2'">コンテンツ2</li>
      <li v-else-if="isActive === '3'">コンテンツ3</li>
    </ul>

  </div>
 
  </template>
  
  <script>
  export default {
     data() {
    return {
      user: [],
      isActive: '1',
    };
  },
  
  }
  </script>
