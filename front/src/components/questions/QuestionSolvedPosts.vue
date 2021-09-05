<template>
  <div>
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
            <question-comments-count
              :question="question.id"
            ></question-comments-count>
            <!-- 閲覧数 -->
            <div class="grid my-3">
              <span class="inline-block font-bold text-xs">
                {{ questionViewsCount(question.impressions_count) }} Views
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
              <router-link
                :to="{ name: 'QuestionShow', params: { id: question.id } }"
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
                {{ question.content.substring(0, 50) }}
              </p>
            </div>

            <!-- Question Labels -->
            <div class="grid grid-cols-2 mt-4 my-auto">
              <!-- ベストアンサー決定済み表示  -->
              <question-status :question="question"></question-status>
              <!-- ユーザー情報 -->
              <div
                class="
                  col-none
                  hidden
                  mr-2
                  lg:block
                  lg:col-start-9 lg:col-end-12
                "
              >
                <div class="flex items-center">
                  <div class="w-16 h-16">
                    <img
                      v-if="question.user.image.url"
                      :src="question.user.image.url"
                      class="rounded-full"
                    />
                    <img
                      v-else
                      src="../../assets/default.png"
                      class="rounded-full"
                      alt="ユーザーアイコン"
                    />
                  </div>
                  <div class="text-gray-600 font-bold text-sm hover:underline">
                    <router-link
                      :to="{
                        name: 'UserShow',
                        params: { id: question.user_id },
                      }"
                    >
                      {{ question.user.name }}さん
                    </router-link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

import QuestionStatus from "./QuestionStatus.vue";
import QuestionCommentsCount from "./QuestionCommentsCount.vue";
export default {
  components: { QuestionStatus, QuestionCommentsCount },
  data: function () {
    return {
      count: "",
      questions: [],
    };
  },
  created() {
    axios.get("api/v1/questions/solved").then((response) => {
      this.questions = response.data;
      console.log(response.data);
    });
  },
  methods: {
    questionViewsCount: function (view) {
      let count;
      if (view > 0) {
        count = view;
      } else {
        count = 0;
      }
      return count;
    },
  },
};
</script>
