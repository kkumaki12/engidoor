import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import './index.css'
import store from './store.js';
import Paginate from 'vuejs-paginate'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faUserSecret } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'



Vue.config.productionTip = false;
library.add(faUserSecret,fas,far)
Vue.component('font-awesome-icon', FontAwesomeIcon)
Vue.component('paginate', Paginate)

Vue.config.productionTip = false


axios.defaults.baseURL =
process.env.VUE_APP_API_BASE_URL
//console.log(process.env.VUE_APP_API_BASE_URL);
//console.log(process.env.API_BASE_URL);
//console.log(process.env);

axios.interceptors.request.use(
  config => {
    //console.log('interceptors request', config);
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);


new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app');

