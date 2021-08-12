<template>
  <div>
    <h2 class="font-bold">いいね数ランキング</h2>
    <div class="border">
    <div v-for="user in users" :key="user.id">
      <li class="mt-2">
        <b>{{ users.indexOf(user) + 1 }}位</b>
        <router-link :to="{ name: 'UserShow', params: { id: user.id } }">
          {{ user.name }}さん
        </router-link>
        <img src="../../assets/default.png" class="w-16 h-16 rounded-full" />
      </li>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      users: [],
      length: "",
    };
  },
  created() {
    axios
      .get("api/v1/ranking")
      .then((response) => {
        this.users = response.data;
        this.length = response.data.length;
        console.log(response.data);
        console.log(response.data.length);
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>
