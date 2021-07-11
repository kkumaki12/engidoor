import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import router from './router';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    token: null
  },
  getters: {
    token: state => state.token
  },
  mutations: {
    updateToken(state, token) {
      state.token = token;
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
          commit('updateToken', response.data.token);
          router.push('/')
        })
    },
  },
  modules: {
    // ここにモジュールを記述
  }
});
