<template>
  <header class="text-gray-600 body-font bg-green-500">
    <div
      class="
        container
        mx-auto
        flex flex-wrap
        p-5
        flex-col
        md:flex-row
        items-center
      "
    >
      <a
        class="
          flex
          title-font
          font-medium
          items-center
          text-gray-900
          mb-4
          md:mb-0
        "
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          stroke="currentColor"
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          class="w-10 h-10 text-white p-2 bg-indigo-500 rounded-full"
          viewBox="0 0 24 24"
        >
          <path
            d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"
          ></path>
        </svg>
        <router-link to="/" class="ml-3 text-xl">ENGIDOOR</router-link>
      </a>
      <div class="mx-auto">
        <input
          type="text"
          v-model="keyword"
          class="py-2 px-3"
          placeholder="質問を検索"
        />
        <button
          @click="search()"
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

      <nav
        class="md:ml-auto flex flex-wrap items-center text-base justify-center"
      >
        <template v-if="isAuthenticated">
          <font-awesome-icon
            :icon="['fas', 'file-import']"
            class="text-white"
          />

          <router-link
            to="/question"
            class="mr-5 hover:text-gray-900 text-white"
            >質問する</router-link
          >
          <font-awesome-icon :icon="['fas', 'user']" class="text-white" />
          <router-link
            :to="{ name: 'UserShow', params: { id: this.$store.state.userId } }"
            class="mr-5 hover:text-gray-900 text-white"
            >マイページ</router-link
          >

          <font-awesome-icon
            :icon="['fas', 'sign-out-alt']"
            class="text-white"
          />
          <button @click="logout()" class="mr-5 hover:text-gray-900 text-white">
            ログアウト
          </button>
        </template>
        <template v-if="!isAuthenticated">
          <font-awesome-icon :icon="['fas', 'user-plus']" class="text-white" />
          <router-link
            class="mr-5 hover:text-gray-900 text-white"
            to="/register"
            >登録</router-link
          >
          <font-awesome-icon
            :icon="['fas', 'sign-in-alt']"
            class="text-white"
          />
          <router-link class="mr-5 hover:text-gray-900 text-white" to="/login"
            >ログイン</router-link
          >
        </template>
      </nav>
    </div>
  </header>
</template>

<script>
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";

library.add(fas, far);
export default {
  data: function () {
    return {
      keyword: "",
    };
  },
  computed: {
    isAuthenticated() {
      return this.$store.getters.token != null;
    },
  },
  methods: {
    logout() {
      return this.$store.dispatch("logout");
    },
    search() {
      return this.$store.dispatch("search", {
        searchWord: this.keyword,
      });
    },
  },
};
</script>

