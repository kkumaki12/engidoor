<template>
  <div class="mx-auto">
        <input type="text" v-model="keyword" class="py-2 px-3" />
        <button
          class="
            bg-blue-500
            hover:bg-blue-700
            text-white
            font-bold
            py-2
            px-4
            rounded
          "
        >
          検索
        </button>
      </div>
</template>

<script>
export default {
  data: function () {
    return {
    keyword: '',
    };
  },
}
</script>
