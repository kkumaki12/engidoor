<template>
  <div id="app">
    <div class="lg:grid lg:grid-cols-12 lg:flex-row">
      <div class="col-span-3">
        <TagsList></TagsList>
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
import QuestionList from "../questions/QuestionList.vue";
import RankingList from "../Ranking/RankingList.vue";
import TagsList from "../Tags/Tagslist.vue";

export default {
  name: "app",
  components: {
    QuestionList,
    RankingList,
    TagsList,
  },
};
</script>
