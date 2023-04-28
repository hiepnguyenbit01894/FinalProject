<template>
  <div class="header">
    <v-container>
      <v-row no-gutters>
        <v-col lg="3">
          <HeaderInnerLogo />
        </v-col>
        <v-col lg="6">
          <HeaderInnerNavBar />
        </v-col>
        <v-col lg="3">
          <HeaderInnerCurrencies />
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>
<style lang="scss">
.header {
  position: fixed;
  top: 0;
  z-index: 20;
  width: 100%;
  background-color: white;
}
@media only screen and (max-width: 990px) {
  .header {
    display: none !important;
  }
}
</style>