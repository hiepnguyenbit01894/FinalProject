<template>
  <v-navigation-drawer v-model="localdrawer" app>
    <v-sheet color="grey-lighten-4" class="pa-4">
      <v-avatar class="mb-4" color="grey-darken-1" size="64"></v-avatar>
      <h2 class="white--text">Admin</h2>
    </v-sheet>
    <v-divider></v-divider>
    <v-list>
      <v-list-item
        v-for="link in links"
        :key="link.id"
        link
        router
        :to="link.route"
      >
        <template v-slot:prepend>
          <v-icon>{{ link.icon }}</v-icon>
        </template>
        <v-list-item-title>{{ link.title }}</v-list-item-title>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
export default {
  props: {
    drawer: String,
  },
  name: "SideBar",
  data() {
    return {
      links: [
        { icon: "mdi-microsoft-windows", title: "Dashboard", route: "/dashboard" },
        { icon: "mdi-account", title: "Profiles", route: "/profile" },
        {
          icon: "mdi-clipboard-list-outline",
          title: "Products",
          route: "/products",
        },
        {
          icon: "mdi-clipboard-list",
          title: "Order",
          route: "/order",
        },
        
      ],
    };
  },
  computed: {
    localdrawer: {
      get() {
        return this.drawer;
      },
      set(Value) {
        this.$emit("update:drawer", Value);
      },
    },
  },
  
};
</script>

<style lang="scss" scoped>
.v-navigation-drawer {
  transform: translateX(100%) !important;
}
</style>