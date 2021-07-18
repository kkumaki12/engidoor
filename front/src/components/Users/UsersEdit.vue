<template>
  <div class="w-full max-w-xl container mt-24 mx-auto">
    <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <label for="image">画像</label>
      <input type="file" class="rounded w-full py-2 px-3 mb-3" />
      <label for="UserName">ユーザー名</label>
      
      <input
        v-model="name"
        class="
          shadow
          appearance-none
          border
          rounded
          w-full
          py-2
          px-3
          text-gray-700
          mb-3
          leading-tight
          focus:outline-none
          focus:shadow-outline
        "
        id="UserName"
      />

      <label for="UserOccupation">職業</label>
      <input
        v-model="occupation"
        class="
          shadow
          appearance-none
          border
          rounded
          w-full
          py-2
          px-3
          text-gray-700
          mb-3
          leading-tight
          focus:outline-none
          focus:shadow-outline
        "
      />
      <label for="UserSpecialty">得意分野</label>
      <select v-model="specialty">
        <option
          v-for="location in locations"
          :key="location"
          class="
            'shadow
            appearance-none
            border
            rounded
            w-full
            py-2
            px-3
            text-gray-700
            mb-3
            leading-tight
            focus:outline-none
            focus:shadow-outline'
          "
        >{{ location }}</option>
      </select>

      <button
      @click="updateUser()"
        class="
          bg-blue-500
          hover:bg-blue-700
          text-white
          font-bold
          py-2
          px-4
          rounded
          focus:outline-none
          focus:shadow-outline
          w-full
          block
        "
      >
        更新する
      </button>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  
  data: function () {
    return {
      user: [],
      name: this.user.name,
      occupation: "",
      content: "",
      specialty: "",
      locations: [
        "選択して下さい",
        "材料・素材",
        "金型",
        "機械加工",
        "半導体",
        "電子",
        "設計",
        "FA・自動化",
        "ロボット",
        "品質管理",
        "環境",
        "生産技術",
        "化学",
        "化学工学",
      ],
    };
  },
    beforeCreated() {

    axios.get(`/api/v1/users/${this.$route.params.id}`)
    .then(response => {
      this.user = response.data;
      console.log(response.data);
    });
  },
    methods: {
    updateUser() {
      axios
        .post("/api/v1/questions", {
          title: this.title,
          content: this.content,
          user_id: this.$store.state.userId
        })
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
