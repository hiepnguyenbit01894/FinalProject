<template>
  <div class="col-lg-2 currencies right">
    <div class="inner-currencies">
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
    </div>
  </div>
</template>

<script>
export default {
  name: "currencies",
  data() {},
};
</script>

<style lang="scss" scoped>
@import "../../assets/scss/mixin";
@import "../../assets/scss/variables";
.currencies {
  li {
    cursor: pointer;
    font-size: 20px;
    &:hover {
      i {
        color: $mainColor;
        transition: 0.3s;
      }
    }
  }
  .list-inline-item{
    margin: 0px 15px;
  }
  .link {
    color: black;
  }
}
</style>