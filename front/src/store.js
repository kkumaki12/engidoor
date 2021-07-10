import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    questions: [],
  },
  getters: {
    // ここにゲッターを記述
  },
  mutations: {
    fetchQuestions(state) {
      state.questions = [];
      axios.get('/api/v1/questions/list').then((response) => {
        
          state.questions.push(response.data.questions);
        
      }, (error) => {
        console.log(error);
      });
    }
  },
  actions: {
    // ここにアクションを記述
  },
  modules: {
    // ここにモジュールを記述
  }
});
