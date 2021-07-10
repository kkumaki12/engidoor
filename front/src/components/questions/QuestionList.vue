<template>
  <div>
    <!-- Unicons -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/@iconscout/unicons@3.0.6/css/line.css"
    />

    <!-- 質問カード -->
    <div v-for="question in questions" :key="question.id">
      <div
        class="
          bg-white
          rounded-lg
          shadow-sm
          hover:shadow-lg
          duration-500
          px-2
          sm:px-6
          md:px-2
          py-4
          my-6
        "
      >
        <div class="grid grid-cols-12 gap-3">
          <!-- Meta Column -->
          <div class="col-span-0 sm:col-span-2 text-center hidden sm:block">
            <!-- 回答数 -->
            <a
              href="#"
              class="
                grid grid-rows-2
                mx-auto
                mb-3
                py-1
                w-4/5
                2lg:w-3/5
                rounded-md
                bg-green-400
              "
            >
              <div class="inline-block font-medium text-2xl text-white">
                {{ question.comments }}
              </div>
              <div
                class="
                  inline-block
                  font-medium
                  text-white
                  mx-1
                  text-sm
                  lg:text-md
                "
              >
                回答
              </div>
            </a>

            <!-- 閲覧数 -->
            <div class="grid my-3">
              <span class="inline-block font-bold text-xs">
                {{ question.impressions_count }}Views
              </span>
            </div>
          </div>

          <!-- レスポンシブル対応 -->
          <div class="col-span-12 sm:col-start-3 sm:col-end-13 px-3 sm:px-0">
            <div class="grid block sm:hidden">
              <div class="flex flex-wrap">
                <div class="mr-2">
                  <div class="inline-block font-light capitalize">
                    <i class="uil uil-check-circle mr-1"></i>
                    <span class="text-sm"> </span>
                  </div>
                </div>
                <div class="mr-2">
                  <div class="inline-block">
                    <i class="uil uil-eye mr-1"></i>
                    <span class="text-sm capitalize font-light"> </span>
                  </div>
                </div>

                <div class="mr-2">
                  <div class="inline-block">
                    <i class="uil uil-clock mr-1"></i>
                    <span class="text-sm font-light">
                      {{ question.created_at }}前
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="flex justify-between items-center hidden sm:block">
              <span class="font-light text-gray-600">
                {{ question.created_at }}前
              </span>
            </div>

            <div class="mt-2">
              <router-link to="question/show/"
                class="
                  sm:text-sm
                  md:text-md
                  lg:text-lg
                  text-gray-700
                  font-bold
                  hover:underline
                "
              >
                {{ question.title }}
              </router-link>

              <p class="mt-2 text-gray-600 text-sm md:text-md">
                {{ question.content }}
              </p>
            </div>

            <!-- Question Labels -->
            <div class="grid grid-cols-2 mt-4 my-auto">
              <!-- ベストアンサー決定済み表示  -->
              <div class="col-span-12 lg:col-span-8">
                <div
                  v-if="question.best_answer"
                  class="
                    inline-block
                    rounded-full
                    text-white
                    bg-red-400
                    duration-300
                    text-xs
                    font-bold
                    mr-1
                    md:mr-2
                    mb-2
                    px-2
                    md:px-4
                    py-1
                    opacity-90
                  "
                >
                  解決済
                </div>
                <div
                  v-else
                  href="#"
                  class="
                    inline-block
                    rounded-full
                    text-white
                    bg-blue-400
                    duration-300
                    text-xs
                    font-bold
                    mr-1
                    md:mr-2
                    mb-2
                    px-2
                    md:px-4
                    py-1
                    opacity-90
                  "
                >
                  回答受付中
                </div>
              </div>
            </div>

            <!-- ユーザー情報 -->
            <QuestionUser :question="question"></QuestionUser>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import QuestionUser from "./QuestionUser.vue";
export default {
  components: {
    QuestionUser,
  },
  data() {
    
    return {
      questions: [],
      user: [],
    };
  },
  created() {
    axios.get("api/v1/questions/list").then((response) => {
      this.questions = response.data;
      console.log(response.data);
    });
  },
};
</script>
