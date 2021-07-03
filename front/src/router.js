import Vue from 'vue';
import Router from 'vue-router';
import Home from './components/layouts/header.vue'
import Users from './views/Users.vue'
import QuestionForm from './components/question.vue'
import QuestionShow from './components/questions/Questionindex.vue'


Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [{path: '/', component: Home },{path: '/users', component: Users},{path: '/question', component: QuestionForm},{path: '/question/show', component: QuestionShow}]
});

