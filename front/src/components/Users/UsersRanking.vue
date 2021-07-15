<template>
<div>
  <h2>いいね数ランキング</h2>
  <div v-for="user in users" :key="user.id">
    <li>
    <b>{{ users.indexOf(user)+1 }}位</b>

    {{ user.name }}さん
    <img src="../../assets/default.png" class="w-16 h-16 rounded-full">
  </li>
  </div>
</div>
</template>

<script>
import axios from "axios";
export default {
    data() {
    return{
      users: [],
      length: ''
    };
  },
  created() {

    axios.get('api/v1/ranking')
    .then(response => {
      this.users = response.data;
      this.length = response.data.length;
      console.log(response.data);
      console.log(response.data.length);
    })
    .catch((error) => {
          console.log(error);
        });
  }
};
</script>
