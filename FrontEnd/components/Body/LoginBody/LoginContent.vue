<template>
  <div class="loginContent">
    <v-container>
      <v-row class="justify-center">
        <v-col class="form_content--login" lg="5">
          <h2 class="login_title text-center">LOGIN</h2>
          <form class="login_form" @submit="confirm">
            <v-row class="form-group align-center">
              <v-col sm="3">
                <label for="username" class="col-form-label form_group--label"
                  >Username</label
                >
              </v-col>
              <v-col sm="9">
                <input
                  type="text"
                  class="form-control form_group--input"
                  placeholder="Email address"
                  v-model.trim="formLogin.username"
                />
              </v-col>
            </v-row>
            <v-row class="form-group align-center">
              <v-col sm="3">
                <label for="Password" class="col-form-label form_group--label"
                  >Password</label
                >
              </v-col>
              <v-col sm="9">
                <input
                  type="password"
                  class="form-control form_group--input"
                  placeholder="Password"
                  v-model.trim="formLogin.password"
                  required
                />
              </v-col>
            </v-row>
            <v-col class="text-center form_content--btn">
              <button
                class="btn-main btn-dark"
                value="Log in"
                type="submit"
                @click="alert()"
              >
                Log in
              </button>
            </v-col>
          </form>
          <div class="forgot_pass_form mt-4 d-flex justify-center">
            <div class="forgot_pass--left">
              <router-link class="link" to="/shop">
                Return to Store
              </router-link>
            </div>
          </div>
        </v-col>
        <!-- Register -->
      </v-row>
    </v-container>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "loginContent",

  data() {
    return {
      formLogin: {
        username: "",
        password: "",
      },
    };
  },
  methods: {
    confirm(e) {
      e.preventDefault();
      localStorage.clear();
      let body = {
        username: this.formLogin.username,
        password: this.formLogin.password,
      };
      console.log(body);
      axios.post(`http://localhost:2828/user/login`, body).then((res) => {
        // console.log("res111s", res.data.result.data);
        console.log("res222", res.data.result[0]);
        if (res.data.result[0]) {
          let user = res.data.result[0];
          console.log("user", user);
          alert("Login success");
          this.$router.push(`/`);
          localStorage.setItem("user", JSON.stringify(user));
          console.log(this);
        } else {
          alert("Sai tên đăng nhập hoặc mật khẩu");
        }
      });
    },
  },
};
</script>

<style lang="scss" scoped>
@import "../../../assets/scss/mixin";
@import "../../../assets/scss/variables";
.loginContent {
  input {
    padding: 10px;
  }
  a {
    text-decoration: none;
    color: black;
  }
  border-bottom: 1px solid #e7e7e7;
  font-family: "roboto", sans-serif;

  .form_content--login,
  .form_content--register {
    margin: 10px 0;
    .login_title,
    .form-group {
      margin-bottom: 1rem;
      .form_group--label {
        font-size: 16px;
        font-weight: 500;
      }
      .form_group--input {
        width: 100%;
        border: none;
        border-bottom: 1px solid #ccc;
        border-radius: 0;
      }
    }
    .form_content--btn {
      .btn-main {
        border-radius: 0;
        padding: 12px 40px;
        background-color: #111111;
        text-transform: uppercase;
        color: #fff;
        position: relative;
        overflow: hidden;
        border: none;
        letter-spacing: 0.2em;
        font-size: 14px;
        border: 1px solid black;
        transition: 0.3s all ease;

        &:hover {
          transition: 0.3s all ease;
          background-color: #fff;
          color: $mainColor;
          border: 1px solid $mainColor;
        }
      }
    }
    .forgot_pass_form {
      a {
        font-size: 14px;
        transition: 0.3s all ease;
        &:hover {
          transition: 0.3s all ease;
          color: $mainColor;
        }
      }
      .forgot_pass--left {
        padding-right: 15px;
      }
    }
  }
}
</style>