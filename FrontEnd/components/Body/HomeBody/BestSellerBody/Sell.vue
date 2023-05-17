<template>
  <div class="sell">
    <ul class="sell__Main">
      <li v-for="item in itemSell" :key="item.id" class="sell__item">
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
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "sell",
  data() {
    return {
      itemSell: [],
      page: 1,
      page_size: 12,
    };
  },
  mounted() {
    axios
      .get(
        `http://localhost:2828/product/list?page=${this.page}&page_size=${this.page_size}`
      )
      .then((res) => {
        this.itemSell = res.data.result.splice(0, 8);
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
};
</script>

<style lang="scss" scoped>
@import "../../../../assets/scss/mixin";
@import "../../../../assets/scss/variables";
img {
  width: 100%;
  object-fit: cover;
}
.sell {
  &__Main {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
  }
  &__item {
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
        font-size: 15px;
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
}
@media only screen and (max-width: 990px) {
  .sell {
    &__Main {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
    }
  }
}
@media only screen and (max-width: 768px) {
  .sell {
    &__Main {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
    }
  }
}
</style>