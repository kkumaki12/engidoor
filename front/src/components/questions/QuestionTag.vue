<template>
  <div>
    <div class="md:grid md:grid-cols-12 md:flex-row">
      <div class="col-span-3">
        <TagsList @parent-event="parentEvent"></TagsList>
      </div>

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
            <p>{{ this.tag }}に関する質問</p>
            <p>{{ this.questions.length }}件</p>
          </div>
        </div>
        <question-base :questions="questions"></question-base>
      </div>
      <div class="col-span-1"></div>
    </div>
  </div>
</template>

<script>
import TagsList from "../Tags/Tagslist.vue";
import axios from "axios";
import QuestionBase from "../questions/QuestionBase.vue";

export default {
  components: {
    TagsList,
    QuestionBase,
  },
  data: function () {
    return {
      questions: [],
      tag: "",
    };
  },
  created() {
    this.getParamsQuestion();
  },
  methods: {
    getParamsQuestion: function () {
      axios
        .get(`api/v1/questions/specialty/${this.$route.params.tag}`)
        .then((response) => {
          this.tag = `${this.$route.params.tag}`;
          this.questions = response.data;
          console.log(response.data);
        });
    },
    parentEvent() {
      this.getParamsQuestion();
    },
  },
};
</script>


