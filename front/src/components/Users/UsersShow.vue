<template>
<div>
  <div class="container grid grid-cols-5">

    <div class="col-span-1 mt-56"></div>

    <!-- This is an example component -->
    <div class="min-h-screen flex items-center justify-center px-4 col-span-4">
      <div class="max-w-4xl bg-white w-full rounded-lg shadow-xl">
        <div class="p-4 border-b flex-row grid grid-cols-5">
          <div class="col-span-4">
            <h2 class="text-2xl">{{ user.name }}さんのマイページ</h2>
            <p class="text-sm text-gray-500">ユーザー情報</p>
          </div>
          <div class="col-span-1">
            <!--<% if @user == current_user %>-->

            <router-link :to="{ name: 'UserEdit', params: { id: user.id } }">
              <button
                v-if="this.$store.state.userId === user.id"
                class="
                  px-4
                  py-2
                  font-medium
                  tracking-wide
                  text-white
                  capitalize
                  transition-colors
                  duration-200
                  transform
                  bg-green-600
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
            <p><!-- @goods_count --></p>
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
              Fugiat ipsum ipsum deserunt culpa aute sint do nostrud anim
              incididunt cillum culpa consequat. Excepteur qui ipsum aliquip
              consequat sint. Sit id mollit nulla mollit nostrud in ea officia
              proident. Irure nostrud pariatur mollit ad adipisicing
              reprehenderit deserunt qui eu.
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
            <p class="text-gray-600">Attachments</p>
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
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="fill-current inline text-gray-500"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                  >
                    <path
                      d="M17 5v12c0 2.757-2.243 5-5 5s-5-2.243-5-5v-12c0-1.654 1.346-3 3-3s3 1.346 3 3v9c0 .551-.449 1-1 1s-1-.449-1-1v-8h-2v8c0 1.657 1.343 3 3 3s3-1.343 3-3v-9c0-2.761-2.239-5-5-5s-5 2.239-5 5v12c0 3.866 3.134 7 7 7s7-3.134 7-7v-12h-2z"
                    />
                  </svg>
                  <span> resume_for_manager.pdf </span>
                </div>
                <a href="#" class="text-purple-700 hover:underline">
                  Download
                </a>
              </div>

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
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="fill-current inline text-gray-500"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                  >
                    <path
                      d="M17 5v12c0 2.757-2.243 5-5 5s-5-2.243-5-5v-12c0-1.654 1.346-3 3-3s3 1.346 3 3v9c0 .551-.449 1-1 1s-1-.449-1-1v-8h-2v8c0 1.657 1.343 3 3 3s3-1.343 3-3v-9c0-2.761-2.239-5-5-5s-5 2.239-5 5v12c0 3.866 3.134 7 7 7s7-3.134 7-7v-12h-2z"
                    />
                  </svg>
                  <span> resume_for_manager.pdf </span>
                </div>
                <a href="#" class="text-purple-700 hover:underline">
                  Download
                </a>
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
import UsersTab from "./UsersTab.vue"




export default {
  components: { UsersTab },

  data() {
    return {
      user: [],
    };
  },
  created() {
    axios.get(`api/v1/users/${this.$route.params.id}`).then((response) => {
      this.user = response.data;
      console.log(response.data);
    });
  },
};
</script>


