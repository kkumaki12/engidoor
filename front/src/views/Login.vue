<template>
  <div class="w-full max-w-xl container mt-24 mx-auto">
    <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <label for="email">email</label>
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
        "
      >
        ログイン
      </button>
    </div>
  </div>
</template>

<!-- Vue側でメールアドレスを小文字にする -->
<script>
import axios from "axios";
const qs = require("qs");
export default {
  data() {
    return {
      email: "",
      password: "",
    };
  },
  methods: {
    login() {
      const result = axios
        .post("api/v1/login", {
          user: {
            email: this.email,
            password: this.password,
          },
           paramsSerializer: function (params) {
              return qs.stringify(params, { arrayFormat: "brackets" });
            },
        })

        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
    
            if (result.data.state) {
          //結果を基にページ遷移
          this.$router.push("/");
        }
    },
  },
};
</script>

    methods: {
      async login() {
        const self = this;
        const result = await axios
          .post("/api/login", {
            account: {
              email: this.email,
              password: this.password,
            },
            paramsSerializer: function (params) {
              return qs.stringify(params, { arrayFormat: "brackets" });
            },
          })
          .catch((e) => {
            console.error(e);
          });

        if (!result) {
          this.message = "エラー";
          return;
        }
        if (!result.data) {
          this.message = "エラー";
          return;
        }

        if (result.data.state) {
          //結果を基にページ遷移
          this.$router.push("/home");
        }
      },
    },
  };
