<template>
  <div class="logo col-lg-2">
    <a href="/">
      <img
        src="https://cdn.shopify.com/s/files/1/0594/1696/9392/files/logo.png?v=1629866780"
        alt=""
      />
    </a>
  </div>
</template>

<script>
export default {
  name: "logo",
};
</script>

<style lang="scss" scoped>
@import "../../assets/scss/mixin";
@import "../../assets/scss/variables";
img {
  max-width: 100%;
  width: 140px;
  object-fit: cover;
}
</style>