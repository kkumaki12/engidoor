<template>
  <div id="app" v-cloak>
    <Header></Header>
    <router-view class="bg-green-100 bg-opacity-50"></router-view>
  </div>
</template>

<script>
import Header from "./components/layouts/TheHeading.vue";



export default {
  name: "app",
  components: {
    Header,
  },
};
</script>

<style>
[v-cloak] {
  display: none;
}
</style>
