<template v-if="user">
  <div class="w-full max-w-xl container mt-24 mx-auto">
    <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <div
        v-if="alert == true"
        class="text-white px-6 py-4 border-0 rounded relative mb-4 bg-red-500"
      >
        <span class="text-xl inline-block mr-5 align-middle">
          <font-awesome-icon :icon="['fas', 'bell']" />
        </span>
        <span class="inline-block align-middle mr-8">
          <b class="capitalize">{{ errors }}</b>
        </span>
      </div>

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
      <v-select
        name="hoge"
        :options="options"
        v-model="specialty"
        class="
          shadow
          appearance-none
          border
          rounded
          w-full
          text-gray-700
          leading-tight
          focus:outline-none
          focus:shadow-outline
        "
      ></v-select>

      <label for="UserIntroduction">自己紹介</label>

      <textarea
        v-model="introduction"
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
        id="UserIntroduction"
      />

      <button
        @click="checkForm()"
        class="
          bg-blue-500
          hover:bg-blue-700
          text-white
          font-bold
          py-2
          px-4
          mt-4
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
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";

export default {
  components: { "v-select": vSelect },
  props: {
    user: Object,
  },

  data: function () {
    return {
      errors: "",
      name: "",
      occupation: "",
      specialty: "",
      introduction: "",
      alert: false,
      options: [
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
  created() {
    axios.get(`api/v1/users/${this.$route.params.id}`).then((response) => {
      this.name = response.data.name;
      this.occupation = response.data.occupation;
      this.specialty = response.data.specialty;
      this.introduction = response.data.introduction;
      console.log(response);
      console.log(this.uploadfile);
    });
  },

  methods: {
    updateUser() {
      axios
        .put(`/api/v1/users/${this.$route.params.id}`, {
          name: this.name,
          occupation: this.occupation,
          specialty: this.specialty,
          introduction: this.introduction,
        })
        .then((response) => {
          alert("更新しました");
          console.log(response);
          console.log("成功");
          this.$router.push(`/users/${this.$route.params.id}`);
        })
        .catch((error) => {
          alert("更新に失敗しました");
          console.log(error);
          this.$router.push(`/users/${this.$route.params.id}`);
        });
    },
    checkForm: function (e) {
      if (this.name) {
        this.updateUser();
      }
      this.errors = "";
      console.log("成功");
      if (!this.name) {
        this.errors = "ユーザーネームを入力してください";
        this.alert = true;
      }
      e.preventDefault();
    },
  },
};
</script>
