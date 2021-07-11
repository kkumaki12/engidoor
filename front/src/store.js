import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    token: null
  },
  getters: {
    // ここにゲッターを記述
  },
  mutations: {
    updateToken(state, token){
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
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });

    }
  },
  modules: {
    // ここにモジュールを記述
  }
});
