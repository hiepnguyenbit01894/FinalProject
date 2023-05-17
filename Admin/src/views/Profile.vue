<template>
  <Home></Home>
  <v-card>
    <v-card-title>
      Users
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
      :items="users"
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
      itemsPerPage: 5,
      search:'',
      headers: [
        {
          title: "Id",
          align: "start",
          key: "id",
        },
        { title: "Username", align: "center", key: "username" },
        { title: "FirstName", align: "center", key: "firstname" },
        { title: "LastName", align: "center", key: "lastname" },
        { title: "Phone", align: "center", key: "phone" },
        { title: "Email", align: "center", key: "email" },
      ],
      users: [],
    };
  },
  components: {
    Home,
    VDataTable,
  },
  created() {
    this.getUsers();
  },
  methods: {
    getUsers() {
      axios.get(`http://localhost:2828/user/list`).then((res) => {
        console.log(res.data);
        this.users = res.data;
      });
    },
  },
};
</script>