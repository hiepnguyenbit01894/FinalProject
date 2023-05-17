<template>
  <SideBar :drawer="drawer" />
  <Header @handleDrawer="drawer = !drawer"></Header>
</template>

<script>
import Header from "../components/Header.vue";
import SideBar from "../components/sideBar.vue";
export default {
  data() {
    return{
        drawer: false,
    }
  },
  components: {
    Header,
    SideBar,
  },
};
</script>

<style>
</style>