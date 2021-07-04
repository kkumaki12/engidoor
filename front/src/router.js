import Vue from 'vue';
import Router from 'vue-router';
import Home from './components/layouts/header.vue'
import Users from './views/Users.vue'
import QuestionCreate from './components/questions/QuestionCreate.vue'
import QuestionShow from './components/questions/QuestionShow.vue'
import QuestionList from './components/questions/QuestionList.vue'


Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [{path: '/', component: Home },{path: '/users', component: Users},{path: '/question', component: QuestionCreate},{path: '/question/show', component: QuestionShow},{path: '/question/list',component: QuestionList}]
});

