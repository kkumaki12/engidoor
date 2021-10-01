<template>
  <div v-show="create">
    <div v-if="questions.length != 0">
      <div class="grid grid-cols-12">
        <div class="col-span-2"></div>
        <div class="col-span-8">
          <div
            class="
              flex
              items-center
              my-2
              rounded
              justify-between
              p-3
              bg-green-100
            "
          >
            <span class="rounded-lg p-2 bg-white"> </span>
            <div class="flex w-full ml-2 items-center justify-between">
              「{{ this.$store.state.searchWord }}」の検索結果:{{
                questions.length
              }}件
            </div>
          </div>
          <question-base :questions="questions"></question-base>
        </div>
        <div class="col-span-2"></div>
      </div>
    </div>
    <div v-else>
      <h1 class="text-center mt-6">
        「{{
          this.$store.state.searchWord
        }}」に関する質問はまだ投稿されていません
      </h1>
      <img
        src="../../assets/undraw_Post_re_mtr4.png"
        class="object-center mx-auto"
      />
    </div>
  </div>
</template>

<script>
import axios from "axios";
import QuestionBase from "./QuestionBase.vue";
export default {
  components: {
    QuestionBase,
  },
  data: function () {
    return {
      questions: [],
      create: false,
    };
  },
  created() {
    this.renderResearchResult();
  },
  methods: {
    renderResearchResult: function () {
      axios
        .get(`api/v1/questions/search/${this.$store.state.searchWord}`)
        .then((response) => {
          this.questions = response.data;
          this.create = true;
          console.log(response.data);
        });
    },
  },
  mounted() {
    this.$store.watch(
      () => this.$store.state.searchWord,
      () => {
        this.renderResearchResult();
      }
    );
  },
};
</script>
