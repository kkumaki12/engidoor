<template>
  <div>
    aa
<!-- The solid style is implicit -->
<font-awesome-icon icon="user-secret" />

<!-- It's better to be explicit -->
<!-- Don't forget to bind the property with ":" (we forget all the time!) -->
<font-awesome-icon :icon="['fas', 'user-secret']" />

   
  </div>
</template>

<script>
import axios from "axios";
import { library } from '@fortawesome/fontawesome-svg-core'
import { faUserSecret } from '@fortawesome/free-solid-svg-icons'

library.add(faUserSecret)

export default {
  // propsでrailsのviewからデータを受け取る
  props: ['questionId'],
  data() {
    return {
      goodList: []  // いいね一覧を格納するための変数{ id: 1, user_id: 1, question_id: 1 } がArrayで入る
    }
  },
  // 算出プロパティ ここではlikeListが変更される度に、count、isLiked が再構築される (watchで監視するようにしても良いかも)
  computed: {
    // いいね数を返す
    count() {
      return this.goodList.length
    },
    isGood() {
      if (this.goodList.length === 0) { return false }
      return Boolean(this.findGoodId())
    }
  },
  // Vueインスタンスの作成・初期化直後に実行される
  created: function() {
    this.fetchLikeByQuestionId().then(result => {
      this.goodList = result
    })
  },
  methods: {
    // rails側のindexアクションにリクエストするメソッド
    fetchGoodByQuestionId: async function() {
      const res = await axios.get(`/api/v1/goods/${this.questionId}`)
      if (res.status !== 200) { process.exit() }
      return res.data
    },
    // rails側のcreateアクションにリクエストするメソッド
    registerGood: async function() {
      const res = await axios.question('/api/goods', { question_id: this.questionId })
      if (res.status !== 201) { process.exit() }
      this.fetchGoodByQuestionId().then(result => {
        this.goodList = result
      })
    },
    // rails側のdestroyアクションにリクエストするメソッド
    deleteGood: async function() {
      const goodId = this.findGoodId()
      const res = await axios.delete(`/api/goods/${goodId}`)
      if (res.status !== 200) { process.exit() }
      this.goodList = this.goodList.filter(n => n.id !== goodId)
    },
    // ログインユーザがいいねしているlikeモデルのidを返す
    findGoodId: function() {
      const good = this.goodList.find((good) => {
        return (good.user_id === this.$store.state.userId)
      })
      if (good) { return good.id }
    }
  }
}
