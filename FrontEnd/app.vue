<template>
  <NuxtLayout>
    <!-- Header -->
    <Header></Header>
    <!-- Header Mobile -->
    <HeaderMobile></HeaderMobile>
    <NuxtPage />
    <!-- footer -->
    <Footer></Footer>
  </NuxtLayout>
</template>
<script>
export default{
  name:'App',
  

}
</script>
<style lang="scss">
.allHeader {
  position: relative;
}
</style>