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
      <label for="UserImage" class="block">ユーザー画像</label>
      <input class="custom-file-input" type="file" @change="changeFile" />

      <div class="form-group"></div>
      <div v-if="uploadfile">
        <input
          @click="regist"
          type="button"
          value="画像アップロード"
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
        />
      </div>
      <div v-else>
        <div
          class="
            bg-red-500
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
          <font-awesome-icon
            @click="registerGood()"
            :icon="['fas', 'ban']"
            style="color: white"
          />画像を選択してください
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";

library.add(fas, far);

export default {
  props: {
    user: Object,
  },

  data: function () {
    return {
      presignedUrl: "", // Rails側で発行される署名付きリンク
      uploadFile: {}, // アップロードする予定のファイル
      productId: "",
      errors: "",
      uploadfile: "",
      alert: false,
    };
  },

  methods: {
    changeFile(e) {
      const files = e.target.files || e.dataTransfer.files;
      this.uploadfile = files[0];
      console.log(this.uploadfile);
    },

    async regist() {
      var params = new FormData();
      params.append("image", this.uploadfile);
      console.log(params);
      await axios.put(`/api/v1/users/${this.$route.params.id}`, params, {
        headers: {
          "content-type": "multipart/form-data",
        },
      });
      this.$router.push(`/users/${this.$route.params.id}`);
    },
  },
};
</script>
