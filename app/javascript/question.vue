<template>
<div class="container">
<div class="w-full max-w-3xl mx-auto">

  <div style="bg-white rounded px-8 pt-6 pb-8 mb-4">
    <div class="mb-4">
      <label class="block text-gray-600 text-sm font-semibold mb-2" for="title">
        タイトル
      </label>
      <input v-model="postTitle" class="bg-gray-100 appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">

    </div>
    <div class="mb-4">
      <label class="block text-gray-600 text-sm font-semibold mb-2" for="tag">
        タグ
      </label>
       <input v-model="postTag" placeholder= "複数タグ付けする場合はスペースを開けてください" class= "bg-gray-100 appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="tag">
    </div>
    <div class="mb-4">
      <label
        class="block text-gray-600 text-sm font-semibold mb-2"
        for="content"
      >
        内容
      </label>
      <textarea v-model="postContent" class="bg-gray-100 p-1 appearance-none border rounded w-full text-gray-700 leading-tight focus:outline-none focus:shadow-outline" rows="8">
    </div>
    
        <div class="flex items-center justify-between">
        <button @click="postQuestion" class= "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">投稿する</button>
    </div>
</div>
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

<style scoped>
</style>
