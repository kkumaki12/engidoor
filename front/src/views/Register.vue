<template>
<div class="w-full max-w-xl container mt-24 mx-auto">
  <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">



      <label for="email">ユーザー名</label>
      <input type="text" v-model="email" id="email" class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">

      <label for="email">メールアドレス</label>
      <input type="email" v-model="email" id="email" class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">

            <label for="password">パスワード</label>
      <input type="password" v-model="password" id="password" class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">

                  <label for="confirmPassword">パスワード(確認)</label>
      <input type="confirmPassword" v-model="confirmPassword" id="confirmPassword" class="shadow appearance-none border border-red-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">

      <button @click="register" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full block">登録</button>

  </div>
  </div>

</template>

<script>
export default {
  data(){
    return {
      userName:'',
      email:'',
      password:'',
      confirmPassword:'',
    };
  },
  methods: {
    login(){}
  }
};
</script>
