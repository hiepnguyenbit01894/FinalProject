<template>
  <div class="footer">
    <v-container>
      <v-row>
        <v-col lg="3" md="4" cols="12" >
          <div class="footer_infor--1">
            <div class="footer_logo">
              <a href="" class="footer_logo--link">
                <img
                  src="../../assets/image/logo.webp"
                  width="140"
                  alt="FruitBee - Organic Food, Natural Responsive Shopify Theme"
                />
              </a>
            </div>
            <p class="footer_para">
              Sophisticated simplicity for the
              <br />
              independent mind.
            </p>
            <div class="footer_list">
              <ul class="footer_list--icons">
                <li class="list_icons--item">
                  <a href="#" class="icons_item--link">
                    <i class="bi bi-twitter"></i>
                  </a>
                </li>
                <li class="list_icons--item">
                  <a href="#" class="icons_item--link">
                    <i class="bi bi-dribbble"></i>
                  </a>
                </li>
                <li class="list_icons--item">
                  <a href="#" class="icons_item--link">
                    <i class="bi bi-behance"></i>
                  </a>
                </li>
                <li class="list_icons--item">
                  <a href="#" class="icons_item--link">
                    <i class="bi bi-instagram"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </v-col>
        <v-col lg="3" md="4" cols="12">
          <div class="footer_infor--2">
            <h4 class="footer_infor--title">Help & Information</h4>
            <ul class="footer_infor--list">
              <li>
                <a href="" title="Pagination" class="infor_list--link"></a
                >Pagination
              </li>
              <li>
                <a
                  href=""
                  title="Terms & Conditions"
                  class="infor_list--link"
                ></a
                >Terms & Conditions
              </li>
              <li>
                <a href="" title="Contact" class="infor_list--link"></a>Contact
              </li>
              <li>
                <a href="" title="Accessories" class="infor_list--link"></a
                >Accessories
              </li>
              <li>
                <a href="" title="Term of use" class="infor_list--link"></a>Term
                of use
              </li>
            </ul>
          </div>
        </v-col>
        <v-col lg="3" md="4" cols="12">
          <div class="footer_infor--2">
            <h4 class="footer_infor--title">About Us</h4>
            <ul class="footer_infor--list">
              <li>
                <a href="" title="Help Center" class="infor_list--link"></a>Help
                Center
              </li>
              <li>
                <a href="" title="Address Store" class="infor_list--link"></a
                >Address Store
              </li>
              <li>
                <a href="" title="Privacy Policy" class="infor_list--link"></a
                >Privacy Policy
              </li>
              <li>
                <a
                  href=""
                  title="Receivers & Amplifiers"
                  class="infor_list--link"
                ></a
                >Receivers & Amplifiers
              </li>
              <li>
                <a href="" title="FruitbeeStore" class="infor_list--link"></a
                >FruitbeeStore
              </li>
            </ul>
          </div>
        </v-col>
        <v-col lg="3" md="4" cols="12">
          <div class="footer_infor--2">
            <h4 class="footer_infor--title">Categories</h4>
            <ul class="footer_infor--list">
              <li>
                <a
                  href=""
                  title="Cherries, Fresh, Large"
                  class="infor_list--link"
                ></a
                >Cherries, Fresh, Large
              </li>
              <li>
                <a href="" title="Raspberries" class="infor_list--link"></a
                >Raspberries
              </li>
              <li>
                <a
                  href=""
                  title="Grapefruit, Ruby x Each"
                  class="infor_list--link"
                ></a
                >Grapefruit, Ruby x Each
              </li>
              <li>
                <a href="" title="Dragon Fruit " class="infor_list--link"></a
                >Dragon Fruit
              </li>
              <li>
                <a
                  href=""
                  title="Physalis x punnet"
                  class="infor_list--link"
                ></a
                >Physalis x punnet
              </li>
            </ul>
          </div>
        </v-col>
      </v-row>

      <div class="footer_bot">
        <div class="row">
          <div class="col-lg-6 col-md-6 text-start">
            <div class="footer_bot--text">
              © Copyright 2021 |
              <a href="#" class="fruitbeeStore"> FruitbeeStore </a>
              By
              <a href="#" class="themeOcean"> ThemeOcean. </a>
              <a href="#" class="power"> Powered by Shopify. </a>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 text-end">
            <img src="/src/image/pay.webp" alt="" />
          </div>
        </div>
      </div>
    </v-container>
  </div>
</template>

<script>
export default {
  name: "footer",
};
</script>

<style lang="scss" scoped>
@import "../../assets/scss/mixin";
@import "../../assets/scss/variables";
// @import "../../assets/css/reset.css";
.footer {
  font-family: "roboto", sans-serif;
  border-top: 1px solid #ddd;
  padding-top: 30px;
  .container-v4 {
    max-width: 1440px;
  }
  .row {
    display: flex;
  }
  .footer_infor--1 {
    .footer_logo {
      margin-bottom: 20px;
      width: 100%;
      a {
        img {
          max-width: 100%;
          height: auto;
          object-fit: cover;
        }
      }
    }
    .footer_para {
      font-weight: 400;
      margin-top: 23px;
      font-size: 17px;
      line-height: 30px;
    }
    .footer_list {
      .footer_list--icons {
        display: flex;
        margin-top: 20px;
        .list_icons--item {
          margin-right: 0.5rem;
          .icons_item--link {
            display: inline-block;
            color: #111111;
            font-size: 16px;
            border-radius: 50%;
            margin: 0 5px 0 5px;
            position: relative;
          }
        }
      }
    }
  }
  .footer_infor--2 {
    .footer_infor--title {
      font-size: 18px;
      font-weight: 600;
      &::after {
        content: "";
        display: block;
        height: 1px;
        width: 30px;
        margin-top: 20px;
        background-color: #111111;
      }
    }

    .footer_infor--list {
      margin: 20px 0;
      li {
        transition: all 0.4s ease-in-out;
        &:hover {
          color: $mainColor;
          padding-left: 10px;
          transition: all 0.4s ease-in-out;
          cursor: pointer;
        }
        .infor_list--link {
          font-weight: 400;
          line-height: 40px;
          color: #111111;
          text-decoration: none;
          transition: all 0.4s ease-in-out;
          font-size: 15px;
        }
      }
    }
  }
  .footer_bot {
    border-top: 1px solid #eee;
    padding: 26px 0;
    .footer_bot--text {
      .fruitbeeStore,
      .themeOcean,
      .power {
        position: relative;
        display: inline-block;
        color: black;
        &:hover {
          opacity: 0.8;
          &::after {
            width: 100%;
          }
        }
        &::after {
          content: "";
          overflow: hidden;
          position: absolute;
          left: 0;
          bottom: -1px;
          display: block;
          width: 0;
          height: 1px;
          background-color: #83b735;
          transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.075);
        }
      }
    }
  }
}
</style>