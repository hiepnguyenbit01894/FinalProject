<template>
  <div class="detail">
    <v-container>
      <div v-for="item in item" :key="item.id">
        <div class="detail__nav">
          <nuxt-link to="/">
            <span class="detail__home"> Home </span>
          </nuxt-link>
          <v-icon icon="mdi-chevron-right"></v-icon>
          <span class="detail__name"> {{ item.name }}</span>
        </div>
        <div class="detail__body">
          <v-row no-gutters>
            <v-col md="6" class="pr-2 ma-2">
              <img :src="item.link_image" alt="" />
            </v-col>
            <v-col md="5" class="pa-2 ma-2">
              <h3>{{ item.name }}</h3>
              <p class="price">${{ item.price }}.00</p>
              <p class="para">
                {{ item.title }}
              </p>
              <div class="d-flex justify-space-between">
                
                <v-col md="5" class="pa-0" @click="addtoCart(item)">
                  <v-btn>Add to Cart</v-btn>
                </v-col>
              </div>
            </v-col>
          </v-row>
        </div>
      </div>
    </v-container>
  </div>
</template>
  
  <script>
import axios from "axios";
export default {
  data() {
    return {
      item: [],
      qty: 1,
      loading: false,
    };
  },
  created: function () {
    this.getId();
  },
  methods: {
    getId() {
      console.log("asdasdasdasd");
      axios
        .get(`http://localhost:2828/product/detail/${this.$route.params.id}`)
        .then((res) => {
          this.item = res.data.result;
        });
    },
    addtoCart(item) {
      // this.$store.commit("addtoCart")
      alert("Add to cart success");
      this.$store.dispatch("addtoCart", item);
      console.log("Shop", item);
    },
  },
};
</script>
  
<style lang="scss" scoped>
@import "../../assets/scss/mixin";
@import "../../assets/scss/variables";
img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.detail {
  margin-top: 70px;
  h3 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 15px;
  }
  a {
    color: black;
    text-decoration: none;
  }
  &__name {
    color: $mainColor;
  }
  .price {
    color: $mainColor;
    font-size: 16px;
    padding-bottom: 15px;
    border-bottom: 1px solid $boderColor;
  }
  .para {
    padding: 15px 0px 15px 0;
    color: $fontShopcolor;
  }
  input[type="number"] {
    border: 1px solid black;
  }
  .v-btn {
    font-weight: bold;
    padding: 0 39px;
    height: 55px;
    font-size: 14px;
    background: #83b735;
  }
}
</style>