<template>
  <div>
    <div
      class="container mx-auto grid-cols-4 md:grid md:grid-cols-5 text-center"
    >
      <div class="col-span-1 md:mt-56 text-center">
        <img
          v-if="user.image.url"
          :src="user.image.url"
          class="rounded-full h-52 w-52 mx-auto"
        />
        <img
          v-else
          src="../../assets/default.png"
          class="rounded-full h-52 w-52 mx-auto"
        />
        <router-link :to="{ name: 'UsersImageEdit', params: { id: user.id } }">
          <button
            v-if="this.$store.state.userId === user.id"
            class="
              md:px-4
              md:py-2
              md:mt-2
              md:text-base
              px-1
              py-1
              justify-center
              mx-auto
              font-medium
              tracking-wide
              text-white
              capitalize
              transition-colors
              duration-200
              transform
              bg-green-500
              rounded-md
              dark:bg-gray-800
              hover:bg-green-500
              dark:hover:bg-gray-700
              focus:outline-none
              focus:bg-blue-500
              dark:focus:bg-gray-700
              text-sm
            "
          >
            <font-awesome-icon
              :icon="['fas', 'camera']"
              class="text-white"
            />変更
          </button>
        </router-link>
      </div>

      <div
        class="min-h-screen flex items-center justify-center px-4 col-span-4"
      >
        <div class="max-w-4xl bg-white w-full rounded-lg shadow-xl">
          <div class="p-4 border-b flex-row grid grid-cols-5">
            <div class="col-span-4">
              <h2 class="text-2xl">{{ user.name }}さんのマイページ</h2>
              <p class="text-sm text-gray-500">ユーザー情報</p>
            </div>
            <div class="col-span-1">
              <router-link :to="{ name: 'UserEdit', params: { id: user.id } }">
                <button
                  v-if="this.$store.state.userId === user.id"
                  class="
                    md:px-4
                    md:py-2
                    px-1
                    py-1
                    md:text-base
                    text-sm
                    font-medium
                    tracking-wide
                    text-white
                    capitalize
                    transition-colors
                    duration-200
                    transform
                    bg-green-500
                    rounded-md
                    dark:bg-gray-800
                    hover:bg-green-500
                    dark:hover:bg-gray-700
                    focus:outline-none
                    focus:bg-blue-500
                    dark:focus:bg-gray-700
                  "
                >
                  編集
                </button>
              </router-link>
              <div id="overlay"></div>
            </div>
          </div>

          <div>
            <div
              class="
                md:grid md:grid-cols-2
                hover:bg-gray-50
                md:space-y-0
                space-y-1
                p-4
                border-b
              "
            >
              <p class="text-gray-600">ユーザーネーム</p>
              <p>
                {{ user.name }}
              </p>
            </div>
            <div
              class="
                md:grid md:grid-cols-2
                hover:bg-gray-50
                md:space-y-0
                space-y-1
                p-4
                border-b
              "
            >
              <p class="text-gray-600">職業</p>
              <p>
                {{ user.occupation }}
              </p>
            </div>
            <div
              class="
                md:grid md:grid-cols-2
                hover:bg-gray-50
                md:space-y-0
                space-y-1
                p-4
                border-b
              "
            >
              <p class="text-gray-600">得意分野</p>
              <p>
                {{ user.specialty }}
              </p>
            </div>
            <div
              class="
                md:grid md:grid-cols-2
                hover:bg-gray-50
                md:space-y-0
                space-y-1
                p-4
                border-b
              "
            >
              <p class="text-gray-600">合計いいね数</p>
              <p>{{ goods.length }}</p>
            </div>
            <div
              class="
                md:grid md:grid-cols-2
                hover:bg-gray-50
                md:space-y-0
                space-y-1
                p-4
                border-b
              "
            >
              <p class="text-gray-600">自己紹介</p>
              <p>
                {{ user.introduction }}
              </p>
            </div>
            <div
              class="
                md:grid md:grid-cols-2
                hover:bg-gray-50
                md:space-y-0
                space-y-1
                p-4
              "
            >
              <p class="text-gray-600">回答ジャンル</p>
              <div class="space-y-2">
                <div
                  class="
                    border-2
                    flex
                    items-center
                    p-2
                    rounded
                    justify-between
                    space-x-2
                  "
                >
                  <div class="space-x-2 truncate">
                    <chart :user_id="user.id"></chart>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <users-tab :user="user"></users-tab>
  </div>
</template>

<script>
import axios from "axios";
import UsersTab from "./UsersTab.vue";
import Chart from "../../Chart.vue";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";

library.add(fas, far);

export default {
  components: { UsersTab, Chart },

  data() {
    return {
      user: [],
      goods: [],
    };
  },
  created() {
    axios.get(`api/v1/users/${this.$route.params.id}`).then((response) => {
      this.user = response.data;
      console.log(response);
    });
    this.usersGoodsCount();
  },
  methods: {
    usersGoodsCount: function () {
      axios
        .get(`api/v1/users/${this.$route.params.id}/goods`)
        .then((response) => {
          this.goods = response.data;
          console.log(response);
        });
    },
  },
};
</script>


