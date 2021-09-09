<template>
  <div id="app" v-cloak>
    <Header class="w-full"></Header>

    <router-view></router-view>
  </div>
</template>

<script>
import Header from "./components/layouts/TheHeading.vue";

export default {
  name: "app",
  components: {
    Header,
  },
  mounted: function(){
      document.title = 'engidoor';
  },
};
</script>

<style>
[v-cloak] {
  display: none;
}
body{
  background-color: #F4F5F7;
}
</style>
