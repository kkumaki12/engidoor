<template>
<div>
  <h2>いいね数ランキング</h2>
  <div v-for="user in users" :key="user.id">
  <li>
    <b>位</b>
    {{ user.name }}さん
    <div class="w-16 h-16 rounded-full">image</div>
  </li>
  </div>
</div>
</template>

<script>
import axios from "axios";
export default {
    data() {
    return{
      users: []
    };
  },
  created() {

    axios.get('api/v1/ranking')
    .then(response => {
      this.users = response.data;
      console.log(response.data);
    })
    .catch((error) => {
          console.log(error);
        });
  }
};
</script>
