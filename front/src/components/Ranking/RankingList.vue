<template>
  <swiper class="swiper" :options="swiperOption">
    <swiper-slide><users-goods-ranking></users-goods-ranking></swiper-slide>
    <swiper-slide><best-answer-ranking></best-answer-ranking></swiper-slide>
    
    <div class="swiper-button-prev" slot="button-prev"></div>
    <div class="swiper-button-next" slot="button-next"></div>
  </swiper>
</template>

<script>
  import { Swiper, SwiperSlide } from 'vue-awesome-swiper';
  import 'swiper/css/swiper.css';
  import UsersGoodsRanking from '../Users/UsersRanking.vue';
import BestAnswerRanking from './BestAnswerRanking.vue';
  


  export default {
    name: 'swiper-example-navigation',
    title: 'Navigation',
    components: {
      Swiper,
      SwiperSlide,
      UsersGoodsRanking,
        BestAnswerRanking
    },
    data() {
      return {
        swiperOption: {
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
          }
        }
      }
    },
  }
</script>

<style scoped>
.swiper-button-prev{

};
.swiper-button-next{

}
</style>
