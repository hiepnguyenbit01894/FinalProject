<template>
  <div class="contentShop">
    <div class="contentShop__feature d-flex justify-space-between align-center">
      <v-text-field
        hide-details
        @focus="searchClosed = false"
        @blur="searchClosed = true"
        label="Search.."
        append-inner-icon="mdi-magnify"
        class="search"
        :class="{ closed: searchClosed }"
        v-model="searchValue"
      ></v-text-field>
      <v-select
        v-model="select"
        :hint="`${select.label}, ${select.value}`"
        :items="items1"
        item-title="label"
        item-value="value"
        persistent-hint
        return-object
        single-line
      ></v-select>
    </div>
    <ul class="contentShop__Main" v-if="itemList.length">
      <li v-for="item in itemList" :key="item.id" class="contentShop__item">
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
              <v-icon icon="mdi-more"></v-icon>
            </li>
            <li @click="addtoCart(item)" class="options__item">
              <v-icon icon="mdi-cart"></v-icon>
            </li>
          </ul>
        </div>
      </li>
    </ul>
    <div v-else class="notfound text-center">
      <img src="../../../assets/image/no-prd.jpg" alt="" />
      <h4>No Product Found!</h4>
    </div>
    <v-pagination v-model="page" :length="totalPages"></v-pagination>
  </div>
</template>

<script>
import axios from "axios";
export default {
  modules: ["@nuxtjs/axios"],
  name: "contentShop",

  data() {
    return {
      page: 1,
      page_size: 8,
      totalPages: 0,
      sort: 0,
      params_sort: "",
      searchValue: "",
      items: [],
      select: { label: "", value: "" },
      items1: [
        { label: "Price:Low to High", value: 1 },
        { label: "Price:High to Low", value: 2 },
        { label: "Name: A-Z", value: 3 },
        { label: "Name: Z-A", value: 4 },
      ],

      filter: [],
      searchClosed: true,
    };
  },
  watch: {
    page: function (val) {
      this.page = val;
      console.log(val);
      this.getAll();
    },
  },
  created() {
    this.updatePage();
  },
  mounted() {
    this.getAll();
  },
  methods: {
    getAll() {
      axios
        .get(
          `http://localhost:2828/product/list?page=${this.page}&page_size=${this.page_size}&sort=${this.sort}&params_short=${this.params_sort}`
        )
        .then((res) => {
          this.items = res.data.result;
          this.totalPages = res.data.totalPage;
        });
    },
    addtoCart(item) {
      // this.$store.commit("addtoCart")
      this.$store.dispatch("addtoCart", item);
    },
    updatePage() {
      console.log(123132132);
    },
    
  },
  computed: {
    itemList() {
      if (this.searchValue.trim().length > 0) {
        return this.items.filter((item) =>
          item.name
            .toLowerCase()
            .includes(this.searchValue.trim().toLowerCase())
        );
      }
      return this.items;
    },
  },
};
</script>

<style lang="scss" scoped>
@import "../../../assets/scss/mixin";
@import "../../../assets/scss/variables";
img {
  width: 100%;
  object-fit: cover;
}

.contentShop {
  &__feature {
    width: 100%;
    align-items: flex-start !important;
  }
  .filter {
    cursor: pointer;
    transition: 0.4s;
    position: relative;
    &_click {
      border: 1px solid black;
      padding: 5px 8px;
      &:hover {
        transition: 0.4s;
        color: white;
        background-color: $mainColor;
      }
    }
    &_box {
      position: absolute;
      left: 0;
      top: 0;
      background-color: $mainColor;
    }
  }
  .search {
    max-width: 50%;
    transition: 0.4s;
    border: 50%;
    &.closed {
      max-width: 50px;
      transition: 0.4s;
    }
  }
  margin: 20px 0;
  border-top: 1px solid $boderColor;
  &__Main {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    text-align: center;
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
        // opacity: 0.8;
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
  .notfound {
    img {
      max-width: 400px;
      max-height: 400px;
    }
    h4 {
      font-size: 20px;
      font-weight: bold;
    }
  }
}
@media only screen and (max-width: 990px) {
  .contentShop {
    &__Main {
      grid-template-columns: repeat(3, 1fr);
    }
  }
}
@media only screen and (max-width: 768px) {
  .contentShop {
    &__Main {
      grid-template-columns: repeat(2, 1fr);
    }
  }
}
</style>