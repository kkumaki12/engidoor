<template>
  <div>
    <div v-for="question in getLists" :key="question.id">
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
                      {{ question.created_at | moment }}
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="flex justify-between items-center hidden sm:block">
              <span class="font-light text-gray-600">
                {{ question.created_at | moment }}
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

                    <img
                      v-if="question.user.image.url"
                      :src="question.user.image.url"
                      class="rounded-full w-16 h-16"
                      alt="ユーザーアイコン"
                    />
                    <img
                      v-else
                      src="../../assets/default.png"
                      class="rounded-full w-16 h-16"
                      alt="ユーザーアイコン"
                    />

                  <div class="text-gray-600 font-bold text-sm hover:underline">
                    <router-link
                      :to="{
                        name: 'UserShow',
                        params: { id: question.user_id },
                      }"
                    >
                      <QuestionUser :question="question"></QuestionUser>
                    </router-link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <paginate
      :v-model="currentPage"
      :page-count="getPageCount"
      :page-range="3"
      :margin-pages="1"
      :click-handler="clickCallback"
      :prev-text="'<'"
      :prev-class="'inline-block w-12 h-12  mx-0.5 text-center'"
      :next-text="'>'"
      :next-class="'inline-block w-12 h-12  mx-0.5 text-center'"
      :container-class="'pagination justify-center mx-auto'"
      :page-class="'inline-block w-12 h-12 leading-10 mx-0.5 box-border text-center rounded-2xl text-black hover:bg-gray-300 '"
      :active-class="'bg-green-600 text-white hover:none'"
      :page-link-class="''"
    >
    </paginate>
  </div>
</template>

<script>
import QuestionUser from "./QuestionUser.vue";
import QuestionStatus from "./QuestionStatus.vue";
import QuestionCommentsCount from "./QuestionCommentsCount.vue";
import axios from "axios";
import moment from "moment";

export default {
  components: {
    QuestionUser,
    QuestionStatus,
    QuestionCommentsCount,
  },
  filters: {
    moment: function (date) {
      moment.locale("ja");
      return moment(date).fromNow();
    },
  },
  data: function () {
    return {
      count: "",
      currentPage: 1,
      perPage: 5,
      questions: [],
    };
  },
  created() {
    axios.get("api/v1/questions/list").then((response) => {
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
    clickCallback: function (pageNum) {
      this.currentPage = Number(pageNum);
      console.log(this.currentPage);
    },
  },
  computed: {
    getLists: function () {
      let current = this.currentPage * this.perPage;
      console.log(current);
      let start = current - this.perPage;
      console.log(start);
      return this.questions.slice(start, current);
    },
    getPageCount: function () {
      return Math.ceil(this.questions.length / this.perPage);
    },
  },
};
</script>
