<template>
  <swiper class="swiper" :options="swiperOption">
    <swiper-slide><good-ranking></good-ranking></swiper-slide>
    <swiper-slide><best-answer-ranking></best-answer-ranking></swiper-slide>

    <div class="swiper-button-prev" slot="button-prev"></div>
    <div class="swiper-button-next" slot="button-next"></div>
  </swiper>
</template>

<script>
import { Swiper, SwiperSlide } from "vue-awesome-swiper";
import "swiper/css/swiper.css";
import GoodRanking from "./GoodRanking.vue";
import BestAnswerRanking from "./BestAnswerRanking.vue";

export default {
  name: "swiper-example-navigation",
  title: "Navigation",
  components: {
    Swiper,
    SwiperSlide,
    GoodRanking,
    BestAnswerRanking,
  },
  data() {
    return {
      swiperOption: {
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      },
    };
  },
};
</script>

<style scoped>
.swiper-button-prev,
.swiper-button-next {
  width: 32px;
  height: 32px;
  margin-top: -16px;
}
.swiper-button-prev {
  background: url(../../assets/arrow2.png) no-repeat center center / contain;
  transform: scale(-1, 1);
  left: 0;
}
.swiper-button-prev::after {
  content: "";
}

.swiper-button-next {
  background: url(../../assets/arrow2.png) no-repeat center center / contain;
  right: 0;
}
.swiper-button-next::after {
  content: "";
}

</style>
