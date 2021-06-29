<template>

    <div class="mb-4" id="app">
      <label class="block text-gray-600 text-sm font-semibold mb-2" for="title">
        タイトル
      </label>
      <input v-model="postTitle" class="bg-gray-100 appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">

    </div>

</template>

<script>
export default {

  data: function () {
    return {
      postTitle: "",
      postTag: "",
      postContent: "",
    };
  },
};
</script>


