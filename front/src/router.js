import Vue from 'vue';
import Router from 'vue-router';
import store from './store.js';
import Home from './components/layouts/Home.vue'
import QuestionCreate from './components/Questions/QuestionCreate.vue'
import QuestionShow from './components/Questions/QuestionShow.vue'
import QuestionList from './components/Questions/QuestionList.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'
import UserShow from './components/Users/UsersShow.vue'
import UserRanking from './components/Users/UsersRanking.vue'
import UserEdit from './components/Users/UsersEdit.vue'
import QuestionSearchResult from './components/Questions/QuestionSearchResult.vue'


Vue.use(Router);

export default new Router({
  routes: [
    { path: '/', component: Home },
    {
      path: '/question', component: QuestionCreate, beforeEnter(to, from, next) {
        if (store.getters.token) {
          next();
        } else {
          next('/login');
        }
      }
    },
    { path: '/question/show/:id', component: QuestionShow, name: 'QuestionShow' },
    { path: '/question/list', component: QuestionList },
    {
      path: '/login', component: Login, beforeEnter(to, from, next) {
        if (store.getters.token) {
          console.log('yes');
          next('/');
        } else {
          console.log('no');
          next();
        }
      }
    },
    {
      path: '/register', component: Register, beforeEnter(to, from, next) {
        if (store.getters.token) {
          next('/');
        } else {
          next();
        }
      }
    },
    { path: '/users/:id', component: UserShow, name: 'UserShow' },
    { path: '/users/edit/:id', component: UserEdit, name: 'UserEdit' },
    { path: 'ranking', component: UserRanking, },
    { path: '/question/search/:params', component: QuestionSearchResult, name: 'QuestionSearchResult' },

  ]
});

