<template>
  <div class="latest">
    <v-container>
      <h2>LATEST NEW</h2>
      <ul class="latest__main">
        <li class="latest__item">
          <div class="latest__image">
            <a href="#">
              <img src="../../../assets/image/blog1.webp" alt="" />
            </a>
            <div class="date">
              <span class="date__day"> 21 </span>
              <span class="date__month">AUG</span>
            </div>
          </div>
          <div class="latest__infor">
            <p>NEW</p>
            <h4>Tips to Maximize a Smaller Space</h4>
            <p class="latest__des">
              A small room does not have to feel cramped and cluttered. With the
              right furniture and some decorator tricks, you can create...
            </p>
            <a href="#" class="latest__read"> READ MORE </a>
          </div>
        </li>
        <li class="latest__item">
          <div class="latest__image">
            <a href="#!">
              <img src="../../../assets/image/blogImage2.webp" alt="" />
            </a>
            <div class="date">
              <span class="date__day"> 21 </span>
              <span class="date__month">AUG</span>
            </div>
          </div>
          <div class="latest__infor">
            <p>NEW</p>
            <h4>Tips to Maximize a Smaller Space</h4>
            <p class="latest__des">
              A small room does not have to feel cramped and cluttered. With the
              right furniture and some decorator tricks, you can create...
            </p>
            <a href="#" class="latest__read"> READ MORE </a>
          </div>
        </li>
        <li class="latest__item">
          <div class="latest__image">
            <a href="#">
              <img src="../../../assets/image/blogImage3.webp" alt="" />
            </a>
            <div class="date">
              <span class="date__day"> 21 </span>
              <span class="date__month">AUG</span>
            </div>
          </div>
          <div class="latest__infor">
            <p>NEW</p>
            <h4>Tips to Maximize a Smaller Space</h4>
            <p class="latest__des">
              A small room does not have to feel cramped and cluttered. With the
              right furniture and some decorator tricks, you can create...
            </p>
            <a href="#" class="latest__read"> READ MORE </a>
          </div>
        </li>
      </ul>
    </v-container>
  </div>
</template>

<script>
export default {
  name: "latest",
};
</script>

<style lang="scss" scoped>
@import "../../../assets/scss/_mixin.scss";
@import "../../../assets/scss/_variables.scss";
.latest {
  @include titleSpacing;
  &__image {
    padding: 10px;
  }
  h2 {
    margin: 20px 0;
  }
  &__main {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 30px;
  }
  &__item {
    box-shadow: 1px 2px 15px #c0baba;
    position: relative;
    .date {
      position: absolute;
      box-shadow: 0 3px 10px rgb(0 0 0 / 8%);
      width: 68px;
      height: 68px;
      background-color: #fff;
      color: #111111;
      font-weight: 600;
      text-align: center;
      text-transform: uppercase;
      top: 36px;
      left: 36px;
      padding: 10px 0;
      &__day {
        font-size: 14px;
        display: block;
        &::after {
          content: "";
          background-color: #111111;
          width: 27px;
          height: 1px;
          display: block;
          margin: 0 auto;
          margin-top: 4px;
        }
      }
    }
  }
  &__infor {
    padding: 20px;
  }
  &__read {
    display: inline-block;
    text-decoration: none;
    margin: 15px 0;
    font-weight: bold;
    letter-spacing: 2px;
    font-size: 14px;
    padding: 15px 40px;
    color: #fff;
    background-color: black;
    transition: 0.4s;
    font-size: 12px;
    font-weight: 500;
    transition: all 0.5s ease;
    &:hover {
      transition: all 0.5s ease;
      background-color: $mainColor;
    }
  }
  p {
    font-size: 16px;
    font-weight: 500;
    line-height: 24px;
    color: #83868c;
  }
  h4 {
    position: relative;
    font-size: 22px;
    display: inline-block;
    color: #111111;
    font-weight: 550;
    transition: all 0.3s ease;
    padding-bottom: 15px;
    margin-bottom: 15px;
    &::before {
      content: "";
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      height: 1px;
      width: 50px;
      background: $mainColor;
    }
  }
}
img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
@media only screen and (max-width: 990px) {
  .latest {
    &__main {
      grid-template-columns: repeat(1, 1fr);
    }
    &__item {
      display: flex;
    }
  }
}
</style>