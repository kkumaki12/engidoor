<template>
  <div v-show="count && status">
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
          lg:h-64
        "
      >
        <div class="grid grid-cols-12 gap-3">
          <!-- Meta Column -->
          <div class="col-span-0 sm:col-span-2 text-center hidden sm:block">
            <!-- 回答数 -->
            <question-comments-count
              :question="question.id"
              @count="count = $event"
            ></question-comments-count>
            <!-- 閲覧数 -->
            <div class="grid my-3">
              <span class="inline-block font-bold text-xs">
                {{ questionViewsCount(question.impressions_count) }} Views
              </span>
              <div class="mt-10 font-mono rounded-sm border-4 border-gray-200">
                {{ question.tag }}
              </div>
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
                {{ contentSlice(question.content) }}
              </p>
            </div>

            <!-- Question Labels -->
            <div class="grid grid-cols-2 mt-4 my-auto">
              <!-- ベストアンサー決定済み表示  -->
              <question-status
                :question="question"
                @status="status = $event"
              ></question-status>
              <!-- ユーザー情報 -->

              <div
                class="pr-0 col-none mr-2 lg:block lg:col-start-9 lg:col-end-12"
              >
                <img
                  v-if="question.user.image.url"
                  :src="question.user.image.url"
                  class="rounded-full w-16 h-16 ml-auto"
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
                    <div
                      class="
                        col-none
                        mr-2
                        lg:block
                        lg:col-start-9 lg:col-end-12
                      "
                    >
                      <div
                        class="text-gray-600 font-bold text-sm hover:underline"
                      >
                        {{ question.name }}さん
                      </div>
                    </div>
                  </router-link>
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
import QuestionStatus from "./QuestionStatus.vue";
import QuestionCommentsCount from "./QuestionCommentsCount.vue";
import Mixins from "@/mixin.js";

export default {
  components: {
    QuestionStatus,
    QuestionCommentsCount,
  },
  mixins: [Mixins],
  props: { questions: Array },
  data: function () {
    return {
      currentPage: 1,
      perPage: 5,
      status: false,
      count: false,
    };
  },
  created() {
console.log("ParentCreate")
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
    contentSlice: function (content) {
      if (content.length > 70) {
        return content.slice(0, 70) + "…";
      } else {
        return content;
      }
    },
    renderQuestion: function () {
      this.create = true;
    },
  },
  computed: {
    getLists: function () {
      let current = this.currentPage * this.perPage;
      let start = current - this.perPage;
      return this.questions.slice(start, current);
    },
    getPageCount: function () {
      return Math.ceil(this.questions.length / this.perPage);
    },
  },
  mounted() {
    this.$nextTick(function () {
      console.log("ParentMount");
    });
  },
};
</script>
