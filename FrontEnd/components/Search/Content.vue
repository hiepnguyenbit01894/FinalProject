<template>
  <div class="search">
    <v-text-field
      density="compact"
      variant="solo"
      label="Search products..."
      append-inner-icon="mdi-magnify"
      single-line
      hide-details
      :class="{ closed: searchClosed }"
      v-model="searchValue"
    ></v-text-field>
    <div class="search__main">
      <v-card>
        <v-list v-if="itemList.length">
          <v-list-item v-for="item in itemList" :key="item.id">
            <div
              class="d-flex justify-space-between align-center"
              @click="toDetail(item.id)"
            >
              <img :src="item.link_image" />
              <div class="infor">
                <p class="name">{{ item.name }}</p>
                <p class="price">${{ item.price }}.00</p>
              </div>
            </div>
          </v-list-item>
        </v-list>
        <v-list-item v-else class="notfound text-center">
          <h4>No Product Found!</h4>
        </v-list-item>
      </v-card>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "search",
  data() {
    return {
      page: 1,
      page_size: 22,
      totalPages: 0,
      sort: 0,
      items: [],
      searchValue: "",
      searchClosed: true,
    };
  },
  created() {
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
    toDetail(param) {
      console.log("asdasdasd;", param);
      this.$router.push(`/product/${param}`);
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
@import "../../assets/scss/mixin";
@import "../../assets/scss/variables";
img {
  width: 100px;
  height: 100;
  object-fit: cover;
}
.search {
  width: 300px;
  height: 200px;
}
.search__main {
  width: 100%;
  height: 150px;
  overflow-y: scroll;
}
.v-text-field {
  border: 1px solid $boderColor;
}
.v-card {
  .v-list-item {
    border: 1px solid $boderColor;
    cursor: pointer;
    &:hover {
      img {
        transition: 0.4s;
        transform: scale(1.2);
      }
      .infor {
        transition: 0.4s;
        color: $mainColor;
      }
    }
    img,
    .infor {
      transition: 0.4s;
    }
  }
}
</style>