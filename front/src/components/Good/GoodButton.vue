<template>
  <div>
    aa
    <!-- The solid style is implicit -->
    <div v-if="isGood">
      <font-awesome-icon
        @click="deleteGood()"
        :icon="['fas', 'heart']"
        style="color: red"
      />
    </div>
    <div v-else>
      <font-awesome-icon
        @click="registerGood()"
        :icon="['far', 'heart']"
        style="color: red"
      />
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
  // propsでrailsのviewからデータを受け取る
  props: { questionId: Number, commentId: Number },
  data() {
    return {
      goodList: [], // いいね一覧を格納するための変数{ id: 1, user_id: 1, post_id: 1 } がArrayで入る
    };
  },
  // 算出プロパティ ここではlikeListが変更される度に、count、isLiked が再構築される (watchで監視するようにしても良いかも)
  computed: {
    // いいね数を返す
    count() {
      return this.goodList.length;
    },
    // ログインユーザが既にいいねしているかを判定する
    isGood() {
      if (this.goodList.length === 0) {
        return false;
      }
      return Boolean(this.findGoodId());
    },
  },
  // Vueインスタンスの作成・初期化直後に実行される
  created: function () {
    this.fetchGoodByCommentId().then((result) => {
      this.goodList = result;
    });
  },
  methods: {
    // rails側のindexアクションにリクエストするメソッド
    fetchGoodByCommentId: async function () {
      const res = await axios.get(`/api/v1/comments/${this.commentId}/goods`);
      if (res.status !== 200) {
        process.exit();
      }
      console.log(res);
      return res.data;
    },
    // rails側のcreateアクションにリクエストするメソッド
    registerGood: async function () {
      const res = await axios.post(`/api/v1/comments/${this.commentId}/goods`, {
        comment_id: this.commentId,
        user_id: this.$store.state.userId,
      });
      console.log(res);
      if (res.status !== 201) {
        process.exit();
      }
      this.fetchGoodByCommentId().then((result) => {
        console.log(this.commentId);
        this.goodList = result;
        console.log(this.goodList);
      });
    },
    // rails側のdestroyアクションにリクエストするメソッド
    deleteGood: async function () {
      const goodId = this.findGoodId();
      const res = await axios.delete(
        `/api/v1/users/${this.$store.state.userId}/comments/${this.commentId}/goods`,
        {
          comment_id: this.commentId,
          user_id: this.$store.state.userId,
        }
      );
      if (res.status !== 200) {
        process.exit();
      }
      this.goodList = this.goodList.filter((n) => n.id !== goodId);
    },
    // ログインユーザがいいねしているlikeモデルのidを返す
    findGoodId: function () {
      const good = this.goodList.find((good) => {
        return good.user_id === this.$store.state.userId;
      });
      if (good) {
        return good.id;
      }
    },
  },
};
</script>
