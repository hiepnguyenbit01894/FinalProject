<template>
  <section class="slider-main">
      <swiper
        :spaceBetween="0"
        :effect="'fade'"
        :autoplay="{
          delay: 3000,
          disableOnInteraction: false,
        }"
        :pagination="{
          clickable: true,
        }"
        :modules="modules"
        class="mySwiper"
      >
        <swiper-slide v-for="item in imageSlide" :key="item.id">
          <img :src="item" />
        </swiper-slide>
      </swiper>
      <div class="content">
        <h1>FIGHT FOOD WASTE WITH EVERY MOUTHFUL</h1>
        <p>We will share all the fresh fruit and veg with you.</p>
        <div class="btn">
          <a href="#">FIND MORE</a>
        </div>
      </div>
  </section>
</template>

<script>
// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from "swiper/vue";

// Import Swiper styles
import "swiper/css";

import "swiper/css/effect-fade";
import "swiper/css/pagination";

// import required modules
import { Autoplay, EffectFade, Pagination } from "swiper";
export default {
  name: "SliderMain",

  data: () => ({
    imageSlide: [
      "https://cdn.shopify.com/s/files/1/0594/1696/9392/files/slide1.1.jpg?v=1629733271",
      "https://cdn.shopify.com/s/files/1/0594/1696/9392/files/slide1.2.jpg?v=1629733411",
    ],
  }),
  components: {
    Swiper,
    SwiperSlide,
  },
  setup() {
    return {
      modules: [Autoplay, EffectFade, Pagination],
    };
  },
};
</script>

<style lang="scss" scoped>
@import "../../../assets/scss/_mixin.scss";
@import "../../../assets/scss/_variables.scss";

.slider-main {
  margin-top: 75px;
  position: relative;
}

img {
  width: 100%;
  max-height: 750px;
  object-fit: cover;
  display: block;
}
.content {
  position: absolute;
  color: white;
  width: 100%;
  height: 10%;
  backdrop-filter: blur(3px);
  text-align: center;
  top: 0;
  bottom: 0;
  z-index: 2;
  h1 {
    font-size: calc(1.375rem + 1.5vw);
  }
  p {
    margin: 10px 0;
    font-size: 16px;
  }
}
.btn {
  display: inline-block;
  padding: 10px 20px;
  background-color: $mainColor;
  font-size: 16px;
  border-radius: 6px;
  cursor: pointer;
  &:hover {
    border: 1px solid white;
    background-color: transparent;
  }
  a {
    text-decoration: none;
    color: white;
  }
}
@media only screen and (max-width: 990px) {
  // .slide-main {
  //   min-height: 200%;
  // }
}
</style>