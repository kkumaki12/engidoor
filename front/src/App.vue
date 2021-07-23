<template>
  <div id="app" v-cloak>
    <Header></Header>
    <router-view></router-view>
  </div>
</template>

<script>
import Header from "./components/layouts/header.vue";
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
