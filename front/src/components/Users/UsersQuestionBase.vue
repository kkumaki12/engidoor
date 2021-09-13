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
          <div class="col-span-0 sm:col-span-2 text-center hidden sm:block">
            <question-comments-count
              :question="question.id"
            ></question-comments-count>
            <div class="grid my-3">
              <span class="inline-block font-bold text-xs">
                {{ questionViewsCount(question.impressions_count) }}Views
              </span>
            </div>
          </div>

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

            <div class="grid grid-cols-2 mt-4 my-auto"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import QuestionCommentsCount from "../questions/QuestionCommentsCount.vue";
import Mixins from "@/mixin.js";

export default {
  components: {
    QuestionCommentsCount,
  },
  props: {
    questions: Array,
  },
  mixins: [Mixins],
  data() {
    return {};
  },
  created: {
    function() {
      console.log(this.q);
    },
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
