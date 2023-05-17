<template>
  <v-app id="inspire">
    <v-main>
      <v-container class="py-8 px-6" fluid>
        <router-view></router-view>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
// import Header from "./components/Header.vue";
// import SideBar from "./components/sideBar.vue";
export default {
  components: { },
  data: () => ({
    cards: ["Today", "Yesterday"],
    drawer: false,
    
  }),

  
  methods: {
    
  },
};
</script>
<style lang="scss" scoped>
.v-toolbar {
  color: white !important;
}
</style>