import Vue from 'vue';
import Router from 'vue-router';
import store from './store.js';
import Home from './components/layouts/Home.vue'
import QuestionCreate from './components/questions/QuestionCreate.vue'
import QuestionShow from './components/questions/QuestionShow.vue'
import QuestionList from './components/questions/QuestionList.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'
import UserShow from './components/Users/UsersShow.vue'
import UserEdit from './components/Users/UsersEdit.vue'
import QuestionSearchResult from './components/questions/QuestionSearchResult.vue'
import QuestionTag from './components/questions/QuestionTag.vue'
import UsersImageEdit from './components/Users/UsersImageEdit.vue'


Vue.use(Router);

export default new Router({
  mode: 'history',
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
    { path: '/users/image/:id', component: UsersImageEdit, name: 'UsersImageEdit' },
    { path: '/question/search/:params', component: QuestionSearchResult, name: 'QuestionSearchResult' },
    { path: '/question/tag/:tag', component: QuestionTag, name: 'QuestionTag' },

  ]
});

