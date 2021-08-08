<template>
  <div class="w-full max-w-xl container mt-24 mx-auto">
      <div v-if="alertOpen" class="text-white px-6 py-4 border-0 rounded relative mb-4 bg-red-500">
    <span class="text-xl inline-block mr-5 align-middle">
      <font-awesome-icon
        :icon="['fas', 'bell']"
      />
    </span>
    <span class="inline-block align-middle mr-8">
      <b class="capitalize">エラー</b> 登録に失敗しました
    </span>
      </div>
    <button class="absolute bg-transparent text-2xl font-semibold leading-none right-0 top-0 mt-4 mr-6 outline-none focus:outline-none" v-on:click="closeAlert()">
      <span>×</span>
    </button>
    <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <label for="email">ユーザー名</label>
      <input
        type="text"
        v-model="name"
        id="name"
        class="
          shadow
          appearance-none
          border border-red-500
          rounded
          w-full
          py-2
          px-3
          text-gray-700
          mb-3
          leading-tight
          focus:outline-none
          focus:shadow-outline
        "
      />

      <label for="email">メールアドレス</label>
      <input
        type="email"
        v-model="email"
        id="email"
        class="
          shadow
          appearance-none
          border border-red-500
          rounded
          w-full
          py-2
          px-3
          text-gray-700
          mb-3
          leading-tight
          focus:outline-none
          focus:shadow-outline
        "
      />

      <label for="password">パスワード</label>
      <input
        type="password"
        v-model="password"
        id="password"
        class="
          shadow
          appearance-none
          border border-red-500
          rounded
          w-full
          py-2
          px-3
          text-gray-700
          mb-3
          leading-tight
          focus:outline-none
          focus:shadow-outline
        "
      />

      <label for="password_confirmation">パスワード(確認)</label>
      <input
        type="password"
        v-model="password_confirmation"
        id="password_confirmation"
        class="
          shadow
          appearance-none
          border border-red-500
          rounded
          w-full
          py-2
          px-3
          text-gray-700
          mb-3
          leading-tight
          focus:outline-none
          focus:shadow-outline
        "
      />

      <button
        @click="register()"
        class="
          bg-blue-500
          hover:bg-blue-700
          text-white
          font-bold
          py-2
          px-4
          rounded
          focus:outline-none
          focus:shadow-outline
          w-full
          block
        "
      >
        登録
      </button>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";

library.add(fas, far);

export default {
  data() {
    return {
      name: "",
      email: "",
      password: "",
      password_confirmation: "",
      alertOpen: false
    };
  },
  methods: {
    register() {
      axios
        .post("/api/v1/users", {user:{
          name: this.name,
          email: this.email,
          password: this.password,
          password_confirmation: this.password_confirmation,
        }})
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
          this.alertOpen = true;
        });
    },
     closeAlert: function(){
      this.alertOpen = false;
    },
  },
};
</script>
