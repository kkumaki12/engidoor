<template>
<div id="app">
  <div class="grid grid-cols-12 flex-row">
    <div class="col-span-1"></div>
    <div class="col-span-9">
  <QuestionList></QuestionList>
    </div>
    
    <div class="col-span-2">
      <UsersRanking></UsersRanking>
    </div>
  </div>
</div>
</template>

<script>
import QuestionList from '../Questions/QuestionList.vue'
import UsersRanking from '../Users/UsersRanking.vue'
export default {
  name: 'app',
  components : {
    QuestionList,
    UsersRanking
  }
}
</script>
