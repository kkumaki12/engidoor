import Vue from 'vue';
import Router from 'vue-router';
import Home from './components/layouts/header.vue'
import Users from './views/Users.vue'
import QuestionCreate from './components/Questions/QuestionCreate.vue'
import QuestionShow from './components/Questions/QuestionShow.vue'
import QuestionList from './components/Questions/QuestionList.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'
import UserShow from './components/Users/UsersShow.vue'


Vue.use(Router);

export default new Router({
  routes: [
    { path: '/', component: Home },
    { path: '/users', component: Users }, 
    { path: '/question', component: QuestionCreate }, 
    { path: '/question/show', component: QuestionShow }, 
    { path: '/question/list', component: QuestionList }, 
    { path: '/login', component: Login }, 
    { path: '/register', component: Register },
    { path: '/users/:id', component: UserShow },
  ]
});

