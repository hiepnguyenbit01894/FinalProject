<template>
  <div class="loginContent">
    <v-container>
      <v-row class="justify-space-between">
        <!-- Login -->
        <v-col class="form_content--login" lg="5">
          <h2 class="login_title text-center">LOGIN</h2>
          <form class="login_form" @submit="confirm">
            <v-row class="form-group">
              <v-col sm="3">
                <label for="Email" class="col-form-label form_group--label"
                  >Email address</label
                >
              </v-col>
              <v-col sm="9">
                <input
                  type="email"
                  class="form-control form_group--input"
                  placeholder="Email address"
                  required
                />
              </v-col>
            </v-row>
            <v-row class="form-group">
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
                  required
                />
              </v-col>
            </v-row>
            <v-col class="text-center form_content--btn">
              <button class="btn-main btn-dark" value="Log in" type="submit">
                Log in
              </button>
            </v-col>
          </form>
          <div class="forgot_pass_form mt-4 d-flex justify-center">
            <div class="forgot_pass--left">
              <a href="#">Return to Store</a>
            </div>
            <div class="forgot_pass--right">
              <a href="#">Forgot your password?</a>
            </div>
          </div>
        </v-col>
        <!-- Register -->
        <v-col class="form_content--register" lg="5">
          <h1 class="register_title text-center">Register</h1>
          <form class="register_form" @submit="onSubmit">
            <v-row class="form-group">
              <v-col sm="3">
                <label for="firstname" class="col-form-label form_group--label"
                  >First Name</label
                >
              </v-col>

              <v-col sm="9">
                <input
                  type="text"
                  class="form-control form_group--input"
                  placeholder="First Name"
                  required
                  v-model.trim="form.first_name"
                  @input="setTouched('first_name')"
                  :class="v$.form.first_name.$error ? 'is-invalid' : ''"
                />
                <div
                  v-for="error of v$.form.first_name.$errors"
                  class="invalid-feedback"
                  :key="error.$uid"
                >
                  {{ error.$message }}
                </div>
              </v-col>
            </v-row>
            <v-row class="form-group">
              <v-col sm="3">
                <label for="lastname" class="col-form-label form_group--label"
                  >Last Name</label
                >
              </v-col>
              <v-col sm="9">
                <input
                  type="text"
                  class="form-control form_group--input"
                  placeholder="Last Name"
                  required
                  v-model.trim="form.last_name"
                  @input="setTouched('last_name')"
                  :class="v$.form.last_name.$error ? 'is-invalid' : ''"
                />
                <div
                  v-for="error of v$.form.last_name.$errors"
                  class="invalid-feedback"
                  :key="error.$uid"
                >
                  {{ error.$message }}
                </div>
              </v-col>
            </v-row>
            <v-row class="form-group">
              <v-col sm="3">
                <label for="address" class="col-form-label form_group--label"
                  >Address</label
                >
              </v-col>
              <v-col sm="9">
                <div class="col-sm-9">
                  <input
                    type="text"
                    class="form-control form_group--input"
                    placeholder="Address"
                    required
                    v-model.trim="form.address"
                    @input="setTouched('address')"
                    :class="v$.form.address.$error ? 'is-invalid' : ''"
                  />
                </div>
              </v-col>
            </v-row>
            <v-row class="form-group">
              <v-col sm="3">
                <label for="Email" class="col-form-label form_group--label"
                  >Email
                </label>
              </v-col>
              <v-col sm="9">
                <div class="col-sm-9">
                  <input
                    type="email"
                    class="form-control form_group--input"
                    placeholder="Email address"
                    required
                    v-model.trim="form.email"
                    @input="setTouched('email')"
                    :class="v$.form.email.$error ? 'is-invalid' : ''"
                  />
                </div>
              </v-col>
            </v-row>
            <v-row class="form-group">
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
                  required
                  v-model.trim="form.password"
                  @input="setTouched('password')"
                  :class="v$.form.password.$error ? 'is-invalid' : ''"
                />
                <div
                  v-for="error of v$.form.password.$errors"
                  class="invalid-feedback"
                  :key="error.$uid"
                >
                  {{ error.$message }}
                </div>
              </v-col>
            </v-row>
            <v-row class="form-group">
              <v-col sm="3">
                <label for="Password" class="col-form-label form_group--label"
                  >Password</label
                >
              </v-col>
              <v-col sm="9">
                <input
                  type="password"
                  class="form-control form_group--input"
                  placeholder="Confirm Password"
                  required
                  v-model.trim="form.confirmPassword"
                  @input="setTouched('confirmPassword')"
                  :class="v$.form.confirmPassword.$error ? 'is-invalid' : ''"
                />
                <div
                  v-for="error of v$.form.confirmPassword.$errors"
                  class="invalid-feedback"
                  :key="error.$uid"
                >
                  {{ error.$message }}
                </div>
              </v-col>
            </v-row>
            <div class="text-center mt-5 form_content--btn">
              <button class="btn-main btn-dark" value="Log in" type="submit">
                Register
              </button>
            </div>
          </form>
          <div class="forgot_pass_form mt-4 d-flex justify-center">
            <div class="forgot_pass--left">
              <a href="#">Return to Store</a>
            </div>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import useVuelidate from "@vuelidate/core";
import {
  required,
  email,
  sameAs,
  alpha,
  helpers,
  minLength,
  maxLength,
} from "@vuelidate/validators";
export default {
  name: "loginContent",
  setup() {
    return {
      v$: useVuelidate(),
    };
  },
  data() {
    return {
      form: {
        // login
        emailLog: "",
        passLog: "",
        // register
        first_name: "",
        last_name: "",
        address: "",
        email: "",
        password: "",
        confirmPassword: "",
      },
    };
  },
  validations() {
    return {
      form: {
        first_name: {
          required,
          alpha: helpers.withMessage(
            "You Have a number in your first name?",
            alpha
          ),
          minLength: minLength(3),
          maxLength: maxLength(15),
        },
        last_name: {
          required,
          alpha: helpers.withMessage(
            "You Have a number in your last name?",
            alpha
          ),
        },
        email: {
          required,
          email,
        },
        address: {
          required,
        },
        password: {
          required,
          minLength: minLength(8),
        },
        confirmPassword: {
          required,
          confirmPassword: helpers.withMessage(
            "It must be qual to your password",
            sameAs(this.form.password)
          ),
        },
      },
    };
  },
  methods: {
    setTouched(theModel) {
      if (theModel == "first_name" || theModel == "all") {
        this.v$.form.first_name.$touch();
      }
      if (theModel == "last_name" || theModel == "all") {
        this.v$.form.last_name.$touch();
      }
      if (theModel == "email" || theModel == "all") {
        this.v$.form.email.$touch();
      }
      if (theModel == "address" || theModel == "all") {
        this.v$.form.address.$touch();
      }
      if (theModel == "password" || theModel == "all") {
        this.v$.form.password.$touch();
      }
      if (theModel == "confirmPassword" || theModel == "all") {
        this.v$.form.confirmPassword.$touch();
      }
    },
    onSubmit(e) {
      e.preventDefault();
      this.setTouched("all");
      if (!this.v$.$invalid) {
        alert("Register Success");
      }
    },
    confirm(e) {
      e.preventDefault();
      alert("You email or password is Incorrect!!");
    },
  },
};
</script>

<style lang="scss" scoped>
@import "../../../assets/scss/mixin";
@import "../../../assets/scss/variables";
.loginContent {
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
    .register_title {
      font-size: 18px;
      text-transform: uppercase;
      font-weight: 600;
      padding-bottom: 50px;
      letter-spacing: 1.5px;
    }
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