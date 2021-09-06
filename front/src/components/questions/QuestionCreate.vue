<template>
  <div id="app">
    <div class="container mx-auto mt-6">
      <div class="w-full max-w-3xl mx-auto">
        <div style="bg-white rounded px-8 pt-6 pb-8 mb-4">
          <div class="mb-4">
            <label
              class="block text-gray-600 text-sm font-semibold mb-2"
              for="title"
            >
              タイトル
            </label>
            <input
              v-model="title"
              type="text"
              class="
                appearance-none
                border
                rounded
                w-full
                py-2
                px-3
                text-gray-700
                leading-tight
                focus:outline-none
                focus:shadow-outline
                focus:border-b-2 focus:border-indigo-500
              "
            />
          </div>
          <div class="mb-4">
            <label
              class="block text-gray-600 text-sm font-semibold mb-2"
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
                w-full
                text-gray-700
                leading-tight
                focus:outline-none
                focus:shadow-outline
                focus:border-b-2 focus:border-indigo-500
              "
            ></v-select>
          </div>
          <div class="mb-4">
            <label
              class="block text-gray-600 text-sm font-semibold mb-2"
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
                w-full
                text-gray-700
                leading-tight
                focus:outline-none
                focus:shadow-outline
                focus:border-b-2 focus:border-indigo-500
              "
              rows="8"
            ></textarea>
          </div>

          <div class="flex items-center justify-between">
            <button
              @click="createQuestion()"
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
  },
};
</script>

<style scoped>
::placeholder {
  background-color: orange;
}
</style>
