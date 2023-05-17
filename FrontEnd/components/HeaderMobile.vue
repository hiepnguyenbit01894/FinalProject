<template>
  <v-container>
    <div class="header-mobile">
      <v-row no-gutters class="align-center">
        <v-col cols="3">
          <div
            id="navigation-icon"
            v-if="mobileView"
            @click="showNav = !showNav"
          >
            <v-icon icon="mdi-menu" />
          </div>
        </v-col>
        <HeaderMobileNavbarMobile
          :class="{ open: showNav }"
          @toggle="showNav = false"
        ></HeaderMobileNavbarMobile>
        <v-col cols="6" class="text-center">
          <HeaderMobileLogoMobile></HeaderMobileLogoMobile>
        </v-col>
        <v-col cols="3">
          <HeaderInnerCurrencies />
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>
<script>
export default {
  name: "App",
  data() {
    return {
      mobileView: true,
      showNav: false,
    };
  },
  methods: {
    test() {
      this;
    },
  },
};
</script>
<style lang="scss" scoped>
.header-mobile {
  padding: 15px 0;
  position: fixed;
  top: 0;
  z-index: 20;
  width: 100%;
  background-color: white;
}
.v-col-3 {
  padding: 10px !important;
}
.v-container {
  margin: 15px 0;
}
.open {
  transform: translateX(0) !important;
}
.v-container {
  padding: 0px;
}
@media only screen and (min-width: 991px) {
  .v-container {
    display: none !important;
  }
}
</style>