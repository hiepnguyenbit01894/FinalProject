
<template>
  <v-app-bar app color="light-green-lighten-1" elevate-on-scroll elevation="4">
    <v-app-bar-nav-icon @click="$emit('handleDrawer')"></v-app-bar-nav-icon>

    <v-spacer></v-spacer>
    <v-col lg="5" cols="12">
      <v-form class=" ">
        <!-- <v-text-field
          label="Search "
          append-icon="mdi-magnify"
          class="shrink mx-4 my-0 rounded"
          variant='outlined'
          ></v-text-field
        > -->
        <v-text-field
          class="ml-1"
          dense
          :flat="!searchFocused"
          placeholder="Search Anywhere"
          hide-details
          rounded
          solo-inverted
          prepend-inner-icon="mdi-magnify"
        />
      </v-form>
    </v-col>
    <v-spacer></v-spacer>
    
    <v-btn>
      <span>Logout</span>
      <v-icon icon="mdi-logout"></v-icon>
    </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  name: "header",
  data() {
    return {};
  },
  methods:{
    
  }
};
</script>

<style lang="scss" scoped>
img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>