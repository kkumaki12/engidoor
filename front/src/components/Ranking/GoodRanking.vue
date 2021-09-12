<template>
  <div>
    <div class="flex">
    <font-awesome-icon
        :icon="['fas', 'crown']"
        style="color: black"
      />
    <h2 class="font-bold">いいね数ランキング</h2>
    </div>
<ranking-base :users="users"></ranking-base>
  </div>
</template>

<script>
import axios from "axios";
import RankingBase from "./RankingBase.vue"
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";

library.add(fas, far);

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
      .get("api/v1/ranking")
      .then((response) => {
        this.users = response.data;
        this.length = response.data.length;
      })
      .catch(() => {
      });
  },
};
</script>
