<template>
  <div class="menu">
    <nav class="navbar">
      <ul class="navbar-nav d-flex justify-space-around">
        <li class="nav-item">
          <NuxtLink to="/" class="link">Home </NuxtLink>
        </li>
        <li class="nav-item">
          <NuxtLink to="/shop" class="link" >Shop </NuxtLink>
        </li>
        <li class="nav-item">
          <NuxtLink to="/blog" class="link" >Blogs </NuxtLink>
        </li>
        <li class="nav-item">
          <NuxtLink to="/page" class="link" >Pages </NuxtLink>
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
export default {
  name: "NavBar",
};
</script>

<style lang="scss" scoped>
@import "../../assets/scss/mixin";
@import "../../assets/scss/variables";
.menu {
  width: 100%;
  font-family: "Sofia Sans Semi Condensed", sans-serif;
  .link {
    margin: 0 18px;
    @include fontInfor(18px, 600);
    text-decoration: none;
    text-transform: uppercase;
    color: black;
  }
  nav {
    margin-bottom: 0px;
    .navbar-nav {
      width: 100%;
      height: 100%;
      .nav-item {
        padding: 5px 0;
        margin: 5px;
        position: relative;

        &:hover {
          transition: 0.4s;
          a {
            transition: 0.2s;
            color: $mainColor;
          }
          &::before {
            width: 100%;
          }
        }
        &::before {
          content: "";
          position: absolute;
          background-color: $mainColor;
          color: red;
          height: 2px;
          width: 0;
          left: 0;
          bottom: -0px;
          transition: 0.4s;
        }
      }
    }
  }
  .navbar {
    width: 100%;
    height: 100%;
  }
}
</style>