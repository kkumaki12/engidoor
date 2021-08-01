import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import router from './router';
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    token: null,
    userId: null,
    searchWord: null
  },
  getters: {
    token: state => state.token,
    userId: state => state.id,
    searchWord: state => state.keyword
  },
  mutations: {
    updateToken(state, token) {
      state.token = token;
    },
    updateUserId(state, userId) {
      state.userId = userId;
    },
    updateSearchWord(state, searchword) {
      state.searchWord = searchword;
    }
  },
  actions: {
    login({ commit }, authData) {
      axios
        .post("api/v1/login", {
          user: {
            email: authData.email,
            password: authData.password,
          },
        })
        .then((response) => {
          console.log(response);
          commit('updateToken', response.data.token);
          commit('updateUserId', response.data.id);
          router.push('/');
        }).catch((error) => {
          console.log(error);
          alert("入力内容に誤りがあります");
        })
    },
    logout({ commit }) {
      commit('updateToken', null);
      commit('updateUserId', null);
      router.push('/login');
    },
    search({ commit }, searchWord) {
      console.log(searchWord);
      commit('updateSearchWord', searchWord.searchWord);
      this.keyword= '';
      router.push(`/question/search/${searchWord.searchWord}`)
    }
  },
  modules: {
    // ここにモジュールを記述
  },
  plugins: [createPersistedState()]
});
