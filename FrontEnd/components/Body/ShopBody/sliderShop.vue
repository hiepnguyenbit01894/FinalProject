<template>
  <div class="slideShop">
    <div class="slideShop__title d-flex">
      <v-icon icon="mdi-star" color="yellow" small></v-icon>
      <h2 class="">BEST SELLERS</h2>
    </div>
    <swiper
      :slidesPerView="1"
      :spaceBetween="30"
      :autoplay="{
        delay: 2500,
        disableOnInteraction: false,
      }"
      :breakpoints="{
        '640': {
          slidesPerView: 1,
          spaceBetween: 20,
        },
        '768': {
          slidesPerView: 2,
          spaceBetween: 40,
        },
        '1024': {
          slidesPerView: 3,
          spaceBetween: 30,
        },
      }"
      :navigation="true"
      :modules="modules"
      class="mySwiper"
    >
      <swiper-slide v-for="item in slideItem" :key="item.id">
        <div class="image">
          <img :src="item.link_image" alt="" />
        </div>
        <div class="infor">
          <p class="infor__name">{{ item.name }}</p>
          <p class="infor__price">{{ item.price }}.00$</p>
        </div>
        <div class="options">
          <ul class="options__inner d-flex justify-center">
            <li class="options__item">
              <v-icon @click="toDetail(item.id)" icon="mdi-more"></v-icon>
            </li>
            <li @click="addtoCart(item)" class="options__item">
              <v-icon icon="mdi-cart"></v-icon>
            </li>
          </ul>
        </div>
      </swiper-slide>
    </swiper>
  </div>
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
  name: "slideShop",

  data: () => ({
    slideItem: [],
    page: 2,
    page_size: 12,
  }),
  
  mounted() {
    axios
      .get(
        `http://localhost:2828/product/list?page=${this.page}&page_size=${this.page_size}`
      )
      .then((res) => {
        this.slideItem = res.data.result.splice(0, 7);
      });
  },
  methods: {
    addtoCart(item) {
      if (JSON.parse(localStorage.getItem("user")) == null) {
        alert("You Must Login to Shopping");
      } else {
        alert("Add to cart success");
        this.$store.dispatch("addtoCart", item);
        console.log("Sell", item);
      }
    },
    toDetail(param) {
      console.log("asdasdasd;", param);
      this.$router.push(`/product/${param}`);
    },
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
@import "../../../assets/scss/mixin";
@import "../../../assets/scss/variables";
img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 50%;
}
.v-icon {
  display: inline-block;
}
.slideShop {
  h2 {
    font-size: 30px;
    display: inline-block;
  }
}
.swiper-slide {
  text-align: center;
  position: relative;
  &:hover {
    .options {
      opacity: 1;
      transition: 0.2s;
      transform: translateY(-320%);
    }
  }
  .infor {
    background-color: $inforItembg;
    &__name {
      @include inforTitle(16px, 700, 1, 1px);
      padding: 20px 0 10px 0;
    }
    &__price {
      @include inforTitle(15px, 700, 1, 1px);
      padding: 10px 0 20px 0;
      color: $mainColor;
    }
  }
  .options {
    position: absolute;
    width: 100%;
    opacity: 0;
    transition: 0.4s;
    &__inner {
      gap: 40px;
    }
    &__item {
      padding: 10px;
      border-radius: 50%;
      background-color: white;
      box-shadow: 0 15px 25px rgba(27, 26, 26, 0.08);
      transition: 0.3s;
      &:hover {
        background-color: $mainColor;
        color: white;
        cursor: pointer;
        transition: 0.3s;
      }
    }
  }
}
// slide
</style>