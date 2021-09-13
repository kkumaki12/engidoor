<template>
  <div class="w-full max-w-xl container mt-24 mx-auto">
    <h1>ENGIDOOR</h1>
    <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <label for="email">email</label>
      <input
        type="email"
        v-model="email"
        id="email"
        class="
          shadow
          appearance-none
          border
          rounded
          w-full
          py-2
          px-3
          text-gray-700
          mb-3
          leading-tight
          focus:outline-none
          focus:shadow-outline
          focus:border-blue-400
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
          border
          rounded
          w-full
          py-2
          px-3
          text-gray-700
          mb-3
          leading-tight
          focus:outline-none
          focus:shadow-outline
          focus:border-blue-400
        "
      />
      <div v-if="email && password">
        <button
          @click="login()"
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
            mb-2
          "
        >
          ログイン
        </button>
      </div>
      <div v-else>
        <button
          class="
            bg-blue-500
            opacity-30
            text-white
            font-bold
            py-2
            px-4
            rounded
            focus:outline-none
            focus:shadow-outline
            w-full
            block
            mb-2
          "
        >
          ログイン
        </button>
      </div>
      <button
        @click="guestLogin()"
        class="
          bg-red-500
          hover:bg-red-700
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
        ゲストログイン
      </button>
    </div>
    <p>
      未登録の方は<router-link to="/register" class="font-bold text-blue-600"
        >こちら</router-link
      >
    </p>
  </div>
</template>

<!-- Vue側でメールアドレスを小文字にする -->
<script>
export default {
  data() {
    return {
      email: "",
      password: "",
    };
  },
  methods: {
    login() {
      this.$store.dispatch("login", {
        email: this.email,
        password: this.password,
      });
    },
    guestLogin() {
      this.$store.dispatch("login", {
        email: "guest12@example.com",
        password: "guestpassword",
      });
    },
  },
};
</script>
