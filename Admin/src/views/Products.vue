<template>
  <v-card>
    <v-card-title>
      Products
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
      :sort-by="[{ key: 'price', order: 'asc' }]"
      :search="search"
      class="elevation-1"
    >
      <template v-slot:item.link_image="{ item }">
        <img :src="item.raw.link_image" style="width: 50px; height: 50px" />
      </template>
      <template v-slot:item.price="{ item }">
        <td>$ {{ item.raw.price }}.00</td>
      </template>
      <template v-slot:top>
        <v-toolbar flat>
          <v-divider class="mx-4" inset vertical></v-divider>
          <v-spacer></v-spacer>
          <v-dialog v-model="dialog" max-width="500px">
            <template v-slot:activator="{ props }">
              <v-btn color="primary" dark class="mb-2" v-bind="props">
                Add New Products
              </v-btn>
            </template>

            <v-card>
              <v-card-title>
                <span class="text-h5">{{ formTitle }}</span>
              </v-card-title>
              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        v-model="editedItem.name"
                        label="Product Name"
                      ></v-text-field>
                    </v-col>
                    <v-col sm="6" md="4">
                      <v-text-field
                        v-model="editedItem.price"
                        label="Price"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        v-model="editedItem.link_image"
                        label="Image"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        v-model="editedItem.quantity"
                        label="Quantity"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        v-model="editedItem.title"
                        label="Title"
                      ></v-text-field>
                    </v-col>
                  </v-row>
                </v-container>
              </v-card-text>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue-darken-1" variant="text" @click="close">
                  Cancel
                </v-btn>
                <v-btn color="blue-darken-1" variant="text" @click="save">
                  Save
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
          <v-dialog v-model="dialogDelete" max-width="500px">
            <v-card>
              <v-card-title class="text-h5"
                >Are you sure you want to delete this item?</v-card-title
              >
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue-darken-1" variant="text" @click="closeDelete"
                  >Cancel</v-btn
                >
                <v-btn
                  color="blue-darken-1"
                  variant="text"
                  @click="deleteItemConfirm"
                  >OK</v-btn
                >
                <v-spacer></v-spacer>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-toolbar>
      </template>
      <template v-slot:[`item.actions`]="{ item }">
        <v-icon size="small" class="me-2" @click="editItem(item.raw)">
          mdi-pencil
        </v-icon>
        <v-icon size="small" @click="deleteItem(item.raw)"> mdi-delete </v-icon>
      </template>
      <template v-slot:no-data>
        <v-btn color="primary" @click="initialize"> Reset </v-btn>
      </template>
    </v-data-table>
  </v-card>
  <home></home>
</template>
<script>
import axios from "axios";
import Home from "../views/Home.vue";
import { VDataTable } from "vuetify/labs/VDataTable";

import Swal from "sweetalert2";

export default {
  data: () => ({
    page: 1,
    page_size: 30,
    totalPages: 0,
    sort: 0,
    search: "",
    dialog: false,
    dialogDelete: false,
    headers: [
      {
        title: "Product Name",
        align: "start",
        key: "name",
      },
      { title: "Image", align: "start", key: "link_image", sortable: false },
      { title: "Price", align: "start", key: `price` },
      { title: "Quantity", align: "start", key: "quantity", sortable: false },
      { title: "Actions", align: "start", key: "actions", sortable: false },
    ],
    items: [],
    editedIndex: -1,
    editedItem: {
      id: 0,
      name: "",
      price: 0,
      link_image: "",
      quantity: 0,
      title: "",
    },
    defaultItem: {
      id: 0,
      name: "",
      price: 0,
      link_image: "",
      quantity: 0,
      title: "",
    },
  }),
  components: {
    VDataTable,
    Home,
  },
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "New Item" : "Edit Item";
    },
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },

  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      axios
        .get(
          `http://localhost:2828/product/list?page=${this.page}&page_size=${this.page_size}&sort=${this.sort}&params_short=${this.params_sort}`
        )
        .then((res) => {
          this.items = res.data.result;
          this.totalPages = res.data.totalPage;
          console.log(this.items);
        });
    },

    editItem(item) {
      this.editedIndex = this.items.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.items.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
      console.log("deleted data");
    },

    deleteItemConfirm() {
      this.items.splice(this.editedIndex, 1);
      this.closeDelete();
      axios
        .delete(`http://localhost:2828/product/delete/${this.editedItem.id}`)
        .then((res) => {
          console.log(res);
          this.alert(3);
        });
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },
    save() {
      if (this.editedIndex > -1) {
        console.log("edited data");
        console.log(this.editedItem);
        axios
          .put(`http://localhost:2828/product/update`, {
            id: this.editedItem.id,
            name: this.editedItem.name,
            price: this.editedItem.price,
            link_image: this.editedItem.link_image,
            quantity: this.editedItem.quantity,
            title: this.editedItem.title,
          })
          .then((res) => {
            console.log(res.data.result);
            this.alert(1);
          });

        Object.assign(this.items[this.editedIndex], this.editedItem);
      } else {
        console.log("created data");
        axios
          .post(`http://localhost:2828/product/add`, {
            name: this.editedItem.name,
            price: this.editedItem.price,
            link_image: this.editedItem.link_image,
            quantity: this.editedItem.quantity,
            title: this.editedItem.title,
          })
          .then((res) => {
            console.log(res);
            this.alert(2);
          });
        this.items.push(this.editedItem);
      }
      this.close();
    },
    alert(param) {
      if (param == 1) {
        Swal.fire("Success", "Your product have been edited", "success");
      } else if (param == 2) {
        Swal.fire("Success", "Your product have been Added", "success");
      } else if (param == 3) {
        Swal.fire("Success", "Your product have been Deleted", "success");
      }
    },
  },
};
</script>