<template>
  <div>
    <h2 class="font-bold">ベストアンサーランキング</h2>
<ranking-base :users="users"></ranking-base>
  </div>
</template>

<script>
import axios from "axios";
import RankingBase from "./RankingBase.vue"

export default {
  components: {
    RankingBase,
  },
  data() {
    return {
      users: [],
      length: "",
    };
  },
  created() {
    axios
      .get("api/v1/bestanswer_ranking")
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
