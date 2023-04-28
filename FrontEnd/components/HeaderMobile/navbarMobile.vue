<template>
  <nav class="navMobile" :class="{ open: showNav }">
    <div class="logo">
      <div class="logoMenu" @click="toggle()">
        <v-icon icon="mdi-close" />
      </div>
    </div>
    <div class="navMobile_content">
      <ul id="tabMenuMobile">
        <li class="nav-item">
          <NuxtLink to="/" class="link">Home </NuxtLink>
          <i class="bi bi-arrow-right"></i>
        </li>
        <li class="nav-item">
          <NuxtLink to="/shop" class="link">Shop </NuxtLink>
          <i class="bi bi-arrow-right"></i>
        </li>
        <li class="nav-item">
          <NuxtLink to="/blog" class="link">Blogs </NuxtLink>
          <i class="bi bi-arrow-right"></i>
        </li>
        <li class="nav-item">
          <NuxtLink to="/page" class="link">Pages </NuxtLink>
          <i class="bi bi-arrow-right"></i>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
export default {
  name: "navbarMobile",
  data() {
    return {
      showNav: false,
    };
  },
  methods: {
    toggle() {
      this.$emit("toggle");
    },
  },
};
</script>

<style lang="scss" scoped>
@import "../../assets/scss/_mixin.scss";
@import "../../assets/scss/_variables.scss";
.navMobile {
  position: absolute;
  z-index: 40;
  top: 0;
  background-color: white;
  width: 70%;
  height: 100vh;
  transform: translateX(-100%);
  transition: 0.3s;
  border: 1px solid #dedede;
  #tabMenuMobile {
    height: 100% !important;
    background-color: white;
  }
  .logo {
    

    display: flex;
    justify-content: flex-end;
    .logoMenu {
      margin: 20px 10px;
    }
  }
  .nav-item {
    text-decoration: none;
    display: flex;
    padding: 20px 10px;
    justify-content: space-between;
    border: inherit;
    .link {
      @include fontInfor(15px, 600);
      text-decoration: none;
      text-transform: uppercase;
      color: black;
    }
  }
}
</style>