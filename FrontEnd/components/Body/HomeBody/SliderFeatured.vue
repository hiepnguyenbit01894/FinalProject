<template>
  <!-- featured-product  -->
  <section class="featured-product" :wrap-around="true">
    <v-container>
      <h2 class="title">FEATURED PRODUCTS</h2>
      <swiper
        :slidesPerView="2"
        :spaceBetween="30"
        :autoplay="{
          delay: 2500,
          disableOnInteraction: false,
        }"
        :breakpoints="{
          '640': {
            slidesPerView: 2,
            spaceBetween: 20,
          },
          '768': {
            slidesPerView: 3,
            spaceBetween: 40,
          },
          '1024': {
            slidesPerView: 6,
            spaceBetween: 50,
          },
        }"
        :navigation="true"
        :modules="modules"
        class="mySwiper"
      >
        <swiper-slide v-for="item in featuredItem" :key="item.id">
          <img @click="$router.push('/shop')" :src="item.link_image" alt="" />
        </swiper-slide>
      </swiper>
    </v-container>
  </section>
</template>

<script>
import axios from "axios";
// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from "swiper/vue";

// Import Swiper styles
import "swiper/css";

import "swiper/css/pagination";

// import required modules
import { Autoplay, Navigation } from "swiper";

export default {
  name: "SliderFeature",
  data() {
    return {
      featuredItem: [],
      page: 2,
      page_size: 10,
    };
  },
  mounted() {
    axios
      .get(
        `http://localhost:2828/product/list?page=${this.page}&page_size=${this.page_size}`
      )
      .then((res) => {
        this.featuredItem = res.data.result;
      });
  },
  components: {
    Swiper,
    SwiperSlide,
  },
  setup() {
    return {
      modules: [Autoplay, Navigation],
    };
  },
};
</script>

<style lang="scss" scoped>
@import "../../../assets/scss/_mixin.scss";
@import "../../../assets/scss/_variables.scss";

img {
  width: 100%;
  height: 0%;
  object-fit: cover;
  border-radius: 50%;
}
.featured-product {
  @include titleSpacing;
  .mySwiper {
    .swiper-container {
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      border: solid $boderColor;
      border-radius: 50%;
      overflow: hidden;
      transition: 0.4s;
      &:hover {
        transition: 0.4s;
        border-color: $mainColor;
        img {
          transition: 0.4s;
          cursor: pointer;
          transform: scale(1.2);
        }
      }
    }
  }
}
</style>