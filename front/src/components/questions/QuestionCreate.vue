<template>
  <div id="app">
    <div class="container mx-auto mt-6">
      <div class="w-full max-w-3xl mx-auto">
        <div style="bg-white rounded px-8 pt-6 pb-8 mb-4">
          <div class="mb-4">
            <div
              v-if="alert == true"
              class="
                text-white
                px-6
                py-4
                border-0
                rounded
                relative
                mb-4
                bg-red-500
              "
            >
              <span class="text-xl inline-block mr-5 align-middle">
                <font-awesome-icon :icon="['fas', 'bell']" />
              </span>
              <span class="inline-block align-middle mr-8">
                <b class="capitalize"
                  ><li v-for="error in errors" :key="error">{{ error }}</li></b
                >
              </span>
            </div>
            <label
              class="
                md:inline-block
                block
                text-gray-600 text-sm
                font-semibold
                mb-2
                w-11/12
                mx-auto
              "
              for="title"
            >
              タイトル
            </label>
            <input
              v-model="title"
              type="text"
              class="
                p-1
                appearance-none
                border
                rounded
                w-11/12
                md:w-full
                text-gray-700
                leading-tight
                focus:outline-none
                focus:shadow-outline
                focus:border-b-2 focus:border-blue-400
                block
                mx-auto
              "
            />
          </div>
          <div class="mb-4">
            <label
              class="
                md:inline-block
                block
                text-gray-600 text-sm
                font-semibold
                mb-2
                w-11/12
                mx-auto
              "
              for="tag"
            >
              タグ
            </label>
            <v-select
              placeholder="選択してください"
              name="hoge"
              :options="options"
              v-model="tag"
              class="
                bg-white
                shadow
                appearance-none
                border
                rounded
                w-11/12
                md:w-full
                text-gray-700
                leading-tight
                focus:outline-none
                focus:shadow-outline
                focus:border-b-2 focus:border-blue-400
                block
                mx-auto
              "
            ></v-select>
          </div>
          <div class="mb-4">
            <label
              class="
                md:inline-block
                block
                text-gray-600 text-sm
                font-semibold
                mb-2
                w-11/12
                mx-auto
              "
              for="content"
            >
              内容
            </label>
            <textarea
              v-model="content"
              class="
                p-1
                appearance-none
                border
                rounded
                w-11/12
                md:w-full
                text-gray-700
                leading-tight
                focus:outline-none
                focus:shadow-outline
                focus:border-b-2 focus:border-blue-400
                block
                mx-auto
              "
              rows="8"
            ></textarea>
          </div>

          <div class="flex items-center justify-between">
            <button
              @click="checkForm()"
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
                w-11/12
                md:w-full
                mx-auto
              "
            >
              投稿する
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";
export default {
  components: { "v-select": vSelect },
  data: function () {
    return {
      title: "",
      tag: "",
      content: "",
      errors: [],
      alert: false,
      options: [
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
        "その他",
      ],
    };
  },
  computed: {
    token() {
      return this.$store.getters.token;
    },
  },
  methods: {
    createQuestion() {
      axios
        .post("/api/v1/questions", {
          title: this.title,
          content: this.content,
          tag: this.tag,
          user_id: this.$store.state.userId,
        })
        .then((response) => {
          console.log(response);
          this.$router.push("/");
        })
        .catch((error) => {
          console.log(error);
          this.$router.push("/");
        });
    },
    checkForm: function (e) {
      if (this.title && this.tag && this.content) {
        this.createQuestion();
        console.log("投稿に成功しました");
      }
      this.errors = [];
      if (!this.title) {
        this.errors.push("タイトルを入力してください");
        this.alert = true;
      }
      if (!this.tag) {
        this.errors.push("タグを選択してください");
        this.alert = true;
      }
      if (!this.content) {
        this.errors.push("本文を入力してください");
        this.alert = true;
      }
      e.preventDefault();
    },
  },
};
</script>

<style scoped>
::placeholder {
  background-color: orange;
}
</style>
