<template>
  <ul class="list-inline d-flex justify-end">
    <li class="list-inline-item">
      <router-link class="link" to="/login">
        <v-icon icon="mdi-account" />
      </router-link>
    </li>
    <li class="list-inline-item">
      <router-link class="link" to="/cart">
        <v-icon icon="mdi-cart" />
      </router-link>
    </li>
  </ul>
</template>

<script>
export default {
  name: "CurrenciesM",
};
</script>

<style lang="scss" scoped>
@import "../../assets/scss/mixin";
@import "../../assets/scss/variables";
ul {
  gap: 10px;
  li {
    cursor: pointer;
    &:hover {
      i {
        color: $mainColor;
      }
    }
  }
}
.link {
  color: black;
}
</style>