<template>
  <div class="contentShop">
    <div class="contentShop__feature d-flex justify-space-between align-center">
      <v-container fluid>
        <v-row>
          <v-radio-group class="d-flex radioList" inline>
            <v-radio
              label="10.00$ - 30.00$"
              value="1"
              @change="check($event)"
            ></v-radio>
            <v-radio
              label="30.00$ - 60.00$"
              value="2"
              @change="check($event)"
            ></v-radio>
            <v-radio
              label="60.00$ - 90.00$"
              value="3"
              @change="check($event)"
            ></v-radio>
            <v-radio
              label="90.00$ - "
              value="4"
              @change="check($event)"
            ></v-radio>
          </v-radio-group>
        </v-row>
      </v-container>
      <!-- <v-select
        v-model="select"
        :hint="`${select.label}, ${select.value}`"
        :items="items1"
        item-title="label"
        item-value="value"
        :on-change="test($event)"
        persistent-hint
        return-object
        single-line
        hide-details
      ></v-select> -->
      <select class="sort" name="cars" id="cars" @change="test($event)">
        <option value="LH">Price:Low to High</option>
        <option value="HL">Price:High to Low</option>
        <option value="AZ">Name: Z-A</option>
        <option value="ZA">Name: A-Z</option>
      </select>
    </div>
    <ul class="contentShop__Main">
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
              <v-icon @click="toDetail(item.id)" icon="mdi-more"></v-icon>
            </li>
            <li @click="addtoCart(item)" class="options__item">
              <v-icon icon="mdi-cart"></v-icon>
            </li>
          </ul>
        </div>
      </li>
    </ul>
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
      selectedValue: "",
      taskTime: null,
      from: 0,
      to: 0,
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

  mounted() {
    this.getAll();
  },
  methods: {
    getAll() {
      console.log("this.from", this.from);
      console.log("this.to", this.to);
      axios
        .get(
          `http://localhost:2828/product/list?page=${this.page}&page_size=${this.page_size}&sort=${this.sort}&params_sort=${this.params_sort}&from=${this.from}&to=${this.to}`
        )
        .then((res) => {
          this.items = res.data.result;
          this.totalPages = res.data.totalPage;
        });
    },
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
      this.$router.push(`/product/${param}`);
    },
    reset() {
      (this.selectedValue = ""),
        (this.from = 0),
        (this.to = 0),
        (this.page = 1),
        (this.sort = 0),
        (this.params_sort = "ASC"),
        (this.searchValue = ""),
        (this.select = { label: "", value: "" });
    },
    test($event) {
      console.log("asdfadsf");
      console.log($event.target.value);
      this.reset();
      let value = $event.target.value;
      if (value == "HL") {
        this.sort = 1;
        this.params_sort = "DESC";
      } else if (value == "LH") {
        this.sort = 1;
        this.params_sort = "ASC";
      } else if (value == "AZ") {
        this.sort = 2;
        this.params_sort = "DESC";
      } else {
        this.sort = 2;
        this.params_sort = "ASC";
      }
      this.getAll();

      console.log();
    },
    check($event) {
      console.log($event.target.value);
      let val = $event.target.value;
      this.sort = 1;
      if (val == 1) {
        this.from = 10;
        this.to = 30;
      } else if (val == 2) {
        this.from = 30;
        this.to = 60;
      } else if (val == 3) {
        this.from = 60;
        this.to = 90;
      } else {
        this.from = 90;
        this.to = 300;
      }
      this.getAll();
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