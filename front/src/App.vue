<template>
<div id="app">
<Header></Header>
<router-view></router-view>
</div>
</template>

<script>
import Header from './components/layouts/header.vue'
export default {
  name: 'app',
  components : {
    Header
  }
}
</script>
