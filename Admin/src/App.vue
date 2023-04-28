<template>
  <v-app id="inspire">
    <SideBar :drawer="drawer" />
    <Header @handleDrawer="drawer = !drawer"></Header>
    <v-main>
      <v-container class="py-8 px-6" fluid>
        <router-view></router-view>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import Header from "./components/Header.vue";
import SideBar from "./components/sideBar.vue";
export default {
  components: { Header, SideBar },
  data: () => ({
    cards: ["Today", "Yesterday"],
    drawer: false,
  }),
};
</script>
<style lang="scss" scoped>
.v-toolbar {
  color: white !important;
}
</style>