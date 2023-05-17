<template>
  <Home></Home>
  <v-card>
    <v-card-title>
      Orders
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
      v-model:items-per-page="itemsPerPage"
      :headers="headers"
      :items="orders"
      :search="search"
      item-value="name"
      class="elevation-1"
    ></v-data-table>
  </v-card>
</template>
<script>
import axios from "axios";
import Home from "../views/Home.vue";
import { VDataTable } from "vuetify/labs/VDataTable";
export default {
  data() {
    return {
      search:'',
      itemsPerPage: 5,
      headers: [
        {
          title: "Order Id",
          align: "start",
          key: "id",
        },
        { title: "Username", align: "center", key: "username" },
        { title: "Product", align: "center", key: "name" },
      ],
      orders: [],
    };
  },
  components: {
    Home,
    VDataTable,
  },
  created() {
    this.getOrders();
  },
  methods: {
    getOrders() {
      axios.get(`http://localhost:2828/order/list`).then((res) => {
        console.log(res.data.data);
        this.orders = res.data.data;
        console.log(this.orders);
      });
    },
  },
};
</script>