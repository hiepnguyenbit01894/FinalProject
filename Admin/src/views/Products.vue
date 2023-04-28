<template>
  <v-card>
    <v-card-title>
      Nutrition
      <v-spacer></v-spacer>
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="items"
      :search="search"
    ></v-data-table>
  </v-card>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      search: "",
      items:[],
    };
  },
  getAll() {
      axios
        .get(
          `http://localhost:2828/product/list?page=${this.page}&page_size=${this.page_size}&sort=${this.sort}&params_short=${this.params_sort}`
        )
        .then((res) => {
          this.items = res.data.result;
        });
    },
};
</script>