<template>
  <div>
    <div class="relative inline-block text-left ml-2">
      <div class="font-bold">ジャンルから検索</div>
      <div v-for="tag in tags" :key="tag.id">
        <div
          class="
            origin-top-right
            right-0
            mt-2
            w-56
            rounded-md
            shadow-lg
            bg-white
            dark:bg-gray-800
            ring-1 ring-black ring-opacity-5
          "
        >
          <div class="py-1">
            <a
              href="#"
              class="
                block block
                px-4
                py-2
                text-md text-gray-700
                hover:bg-gray-100
                hover:text-gray-900
                dark:text-gray-100
                dark:hover:text-white
                dark:hover:bg-gray-600
              "
            >
              <span class="flex flex-col">
                <router-link :to="{ name: 'QuestionTag', params: { tag: tag } }">
                  
                <span @click="childEvent">
                  {{ tag }}
                </span>
                </router-link>
              </span>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  data: function () {
    return {
      tags: [
        "材料・素材",
        "金型",
        "機械加工",
        "半導体",
        "電子",
        "設計",
        "FA・自動化",
        "ロボット",
        "品質管理",
        "環境",
        "生産技術",
        "化学",
        "化学工学",
      ],
    };
  },
 methods: {
    childEvent() {
      this.$emit('parent-event')
    }
  }
};
</script>
