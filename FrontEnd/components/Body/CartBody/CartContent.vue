<template>
  <div class="cartContent">
    <div class="cartBody_nav">
      <a href="#!" title="Back to the Home"
        >Home
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="16"
          height="16"
          fill="currentColor"
          class="bi bi-chevron-right"
          viewBox="0 0 16 16"
        >
          <path
            fill-rule="evenodd"
            d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"
          />
        </svg>
      </a>
      <strong> Your Shopping Cart </strong>
    </div>
    <div class="cartBody_page">
      <div class="content_page">
        <div class="container container-v2">
          <div class="cartBody_main">
            <form action="/cart">
              <table class="table-responsive shop_table cart table">
                <thead>
                  <tr class="cart-title">
                    <th colspan="2" class="product-thumbnail">Product name</th>
                    <th class="product-price">Price</th>
                    <th class="product-quantity">Quantity</th>
                    <th class="product-remove"></th>
                  </tr>
                </thead>
                <tbody id="mycart">
                  <tr
                    v-for="item in cartItems"
                    :key="item.id"
                    class="cart-item"
                  >
                    <td data-label="Product Name" class="product-thumbnail">
                      <a href="">
                        <img :src="item.link_image" alt="" />
                      </a>
                    </td>
                    <td class="product-name-thumb" data-title="Product">
                      <a href="#!">{{ item.name }}</a>
                    </td>
                    <td
                      data-label="Product Price"
                      class="product-price"
                      data-title="Price"
                    >
                      <span class="amount">${{ item.price }}.00</span>
                    </td>
                    <td
                      data-label="Quantity"
                      class="product-quantity"
                      data-title="Quantity"
                    >
                      <div class="input-group">
                        <span class="input-group-btn minus">
                          <button
                            @click="addItem(item, '-')"
                            type="button"
                            class="btn btn-default"
                          >
                            -
                          </button> </span
                        ><input
                          type="text"
                          step="1"
                          max="10"
                          :value="item.quantity"
                          name="quantity"
                          class="quantity-field text-center"
                          style="text-align: center"
                        /><span class="input-group-btn plus">
                          <button
                            @click="addItem(item, '+')"
                            type="button"
                            class="btn btn-default"
                          >
                            +
                          </button></span
                        >
                      </div>
                    </td>
                    <td class="product-remove" @click="removeItem(item)">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-trash"
                        viewBox="0 0 16 16"
                      >
                        <path
                          d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"
                        />
                        <path
                          fill-rule="evenodd"
                          d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"
                        />
                      </svg>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div class="cart_totals">
                <div class="continue-shopping-1">
                  <a href="/src/html/shop.html">Continue Shopping</a>
                </div>
                <div class="cart-check">
                  <h2 class="cart-title">CART TOTALS</h2>
                  <table class="total-checkout">
                    <tbody>
                      <tr>
                        <th class="cart-label"><span>Total</span></th>
                        <td class="cart-amount">
                          <span
                            ><strong
                              ><span id="amountPrs"
                                >$ {{ totalPrice }}.00</span
                              ></strong
                            >
                          </span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="proceed-to-checkout clearfix">
                    <!-- <a
                      class="checkout-button button alt wc-forward bg-color"
                      href="chekcout.html"
                      >Proceed to checkout</a
                    > -->
                    <v-btn @click="createOrder">Checkout</v-btn>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "cartContent",
  computed: {
    cartItems() {
      // console.log("cartItems", this.$store.state.cartItems[0].quantity);
      return this.$store.state.cartItems;
    },
    totalPrice() {
      let price = 0;
      this.$store.state.cartItems.map((el) => {
        price += el["quantity"] * el["price"];
      });
      return price;
    },
  },
  created() {
    this.test();
  },
  methods: {
    addItem(item, key) {
      if (key == "-") {
        item.quantity -= 2;
        alert("Your cart have been updated");
        this.$store.dispatch("addtoCart", item);
      } else {
        alert("Your cart have been updated");
        this.$store.dispatch("addtoCart", item);
      }
    },
    removeItem(item) {
      alert("Your cart have been updated");
      this.cartItems.splice(this.cartItems.indexOf(item), 1);
    },
    createOrder() {
      let arrr = this.$store.state.cartItems;
      let product = [];
      arrr.map((res) => {
        let tmp = {
          id: "",
          quantity: 0,
        };
        (tmp.id = res.id), (tmp.quantity = res.quantity);
        product.push(tmp);
      });
      let body = {
        products: product,
        user_id: JSON.parse(localStorage.getItem("user")).id,
      };
      console.log("body", body);
      axios.post("http://localhost:2828/order/create", body).then((res) => {
        console.log("res111s", res.data);
      });
      return;
    },
    test() {
      console.log();
    },
  },
};
</script>

<style lang="scss" scoped>
@import "../../../assets/scss/mixin";
@import "../../../assets/scss/variables";
@import "../../../assets/css/reset.css";
a {
  text-decoration: none;
}
.cartContent {
  margin-top: 100px;
  font-family: "roboto", sans-serif;

  .cartBody_nav {
    padding: 10px 0;

    a {
      font-size: 16px;
      font-weight: 400;
      color: #111111;

      &:hover {
        color: $mainColor;
      }
    }

    strong {
      font-size: 16px;
      font-weight: 600;
      color: #83b735;
      letter-spacing: 0.5px;
    }
  }

  .cartBody_page {
    padding: 50px 0;

    .product-price,
    .product-quantity,
    .product-subtotal,
    .product-remove {
      text-align: center;
    }

    table {
      border: 1px solid #dee2e6;

      .container {
        padding-right: 10px;
        padding-left: 10px;
      }

      thead {
        th {
          border-bottom: 0;
          font-weight: 500;
          font-size: 12px;
          letter-spacing: 0.2em;
          text-transform: uppercase;
          color: #111111;
          padding: 15px 20px;
          border-left: 1px solid #dee2e6;
        }
      }

      tbody {
        border-top: 1px solid #dee2e6;

        td {
          vertical-align: middle;
        }

        .cart-item {
          .product-thumbnail {
            width: 120px;

            img {
              width: 100%;
              height: 100%;
              object-fit: cover;
            }
          }
          .product-remove {
            cursor: pointer;
          }
          .product-name-thumb,
          .product-remove {
            a {
              color: black;
            }
          }
          .product-name-thumb,
          .product-price,
          .product-subtotal {
            font-size: 14px;
            color: #a8a8a8 !important;
            line-height: 1.6;
            font-weight: 400;
          }

          .product-quantity {
            text-align: center;

            .input-group {
              width: auto;
              justify-content: center;
              .minus {
                transform: translateX(-25px);
              }
              .input-group-btn {
                display: inline-block;

                .btn-default {
                  border-radius: 0px;
                }
              }
            }

            .quantity-field {
              border: 1px solid #e7e7e7 !important;
              width: 45px;
              text-align: center;
              font-size: 20px;
              color: #111111;
              border-right: 1px solid #ddd;
              border-radius: 0;
              color: $mainColor;
            }
          }
        }
      }
    }

    .cart_totals {
      .cart-update {
        margin: 20px 10px 20px 0;
        display: inline-block;
        .buttonUpdate {
          cursor: pointer;
          display: inline-block;
          color: #fff;
          text-transform: uppercase;
          padding: 18px 65px;
          border: none;
          background-color: #111111;
          font-size: 14px;
          text-align: center;
          line-height: 24px;
          letter-spacing: 0.2em;
          font-weight: 500;
          position: relative;
          border-radius: 0;
          transition: 0.3s;

          &:hover {
            transition: 0.3s;
            background-color: $mainColor;
          }
        }
      }

      .continue-shopping-1 {
        margin: 20px 0 20px 10px;
        display: inline-block;

        a {
          @include buttonCart;
        }
      }

      .cart-check {
        border: 1px solid #e3e3e3;
        padding: 40px 20px;
        overflow: hidden;
        margin: 30px 0;

        table {
          width: 100%;
          border: none;
        }

        h2 {
          font-weight: 600;
          font-size: 12px;
          line-height: 30px;
          color: #111111;
          letter-spacing: 0.2em;
          text-transform: uppercase;
          margin-bottom: 0;
          padding: 17px 20px 17px 0;
        }

        .total-checkout {
          .cart-label,
          .cart-amount {
            padding: 17px 0;
            font-size: 16px;
            line-height: 30px;
            color: #111111;
            font-weight: 400;
          }

          .cart-amount {
            font-weight: 600;
          }
        }

        .proceed-to-checkout {
          .checkout-button {
            @include buttonCart;
          }
        }
      }
    }
  }
}

@media only screen and (max-width: 990px) {
  .cartBody_page {
    .table-responsive {
      .product-thumbnail {
        width: 100% !important;
      }
      td {
        clear: both;
        float: left;
        width: 100%;
      }
      .cart-title {
        display: none;
      }
      #mycart {
        td {
          padding: 10px;

          a {
            img {
              display: block;
              float: right;
              max-width: 100%;
            }
          }
          &::before {
            content: attr(data-label);
            float: left;
            text-align: center;
            font-size: 12px;
            padding-right: 10px;
          }
        }
        .cart-item {
          span,
          .removeProduct {
            float: right;
          }

          .product-quantity {
            .input-group--main {
              float: right;
            }
          }
        }
      }
    }
  }
}
</style>