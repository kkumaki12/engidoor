<template>
  <div id="app">
    <div class="grid grid-cols-12 flex-row">
      <div class="col-span-3">
        <QuestionTabs></QuestionTabs>
      </div>
      <div class="col-span-6">
        <QuestionList></QuestionList>
      </div>
      <div class="col-span-1"></div>
      <div class="col-span-2">
        <RankingList></RankingList>
      </div>
    </div>
  </div>
</template>

<script>
import QuestionList from "../Questions/QuestionList.vue";
import RankingList from "../Ranking/RankingList.vue";
import QuestionTabs from "../Questions/QuestionTag.vue";

export default {
  name: "app",
  components: {
    QuestionList,
    RankingList,
    QuestionTabs,
  },
};
</script>
