import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import './index.css'

Vue.config.productionTip = false

axios.interceptors.request.use(
  config => {
    console.log('interceptors request', config);
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);


new Vue({
  router,
  render: h => h(App),
}).$mount('#app');


