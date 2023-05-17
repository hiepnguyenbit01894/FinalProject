<template>
  <div class="RegisterContent">
    <v-container>
      <v-row class="justify-center">
        <v-col class="form_content--register" lg="6">
          <h1 class="register_title text-center">Register</h1>
          <form @submit.prevent="submit">
            <!-- name -->
            <v-text-field
              v-model="name.value.value"
              :counter="10"
              :error-messages="name.errorMessage.value"
              label="Username"
            ></v-text-field>
            <!-- Password -->
            <v-text-field
              v-model="password.value.value"
              :type="show1 ? 'text' : 'password'"
              :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
              :counter="8"
              :error-messages="password.errorMessage.value"
              @click:append="show1 = !show1"
              label="Password"
            ></v-text-field>
            <!-- firstname -->
            <v-text-field
              v-model="firstname.value.value"
              :error-messages="firstname.errorMessage.value"
              label="First Name"
            ></v-text-field>
            <!-- lastname -->
            <v-text-field
              v-model="lastname.value.value"
              :error-messages="lastname.errorMessage.value"
              label="Last Name"
            ></v-text-field>
            <!-- lastname -->
            <v-text-field
              v-model="phone.value.value"
              :counter="10"
              :error-messages="phone.errorMessage.value"
              label="phone(+84)"
            ></v-text-field>
            <!-- address -->
            <v-text-field
              v-model="address.value.value"
              :error-messages="address.errorMessage.value"
              label="address"
            ></v-text-field>

            <!-- email -->
            <v-text-field
              v-model="email.value.value"
              :error-messages="email.errorMessage.value"
              label="E-mail"
            ></v-text-field>
            <v-btn class="me-4" type="submit"> submit </v-btn>
            <v-btn @click="handleReset"> clear </v-btn>
          </form>
          <div class="forgot_pass_form mt-4 d-flex justify-center">
            <div class="forgot_pass--left">
              <router-link class="link" to="/shop">
                Return to Store
              </router-link>
            </div>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import axios from "axios";
import { useField, useForm } from "vee-validate";

export default {
  name: "Register",
  data() {
    return {
      show1: false,
    };
  },
  setup() {
    let globals = getCurrentInstance().appContext.config.globalProperties;
    const { handleSubmit, handleReset } = useForm({
      validationSchema: {
        name(value) {
          if (value?.length >= 2) return true;

          return "Name needs to be at least 2 characters.";
        },
        password(value) {
          if (value?.length >= 8) return true;

          return "Password needs to be at least 8 characters.";
        },
        firstname(value) {
          if (/[^0-9]/.test(value) && value?.length > 0) return true;

          return "First name can not contain digits.";
        },
        lastname(value) {
          if (/[^0-9]/.test(value) && value?.length > 0) return true;

          return "Last name can not contain digits.";
        },
        phone(value) {
          if (value?.length > 9 && /(84|0[3|5|7|8|9])+([0-9]{8})\b/.test(value)) return true;

          return "Phone number needs to be at least 9 digits.";
        },
        address(value) {
          if (value?.length > 0) return true;

          return "Value is Required";
        },
        email(value) {
          if (/^[a-z.-]+@[a-z.-]+\.[a-z]+$/i.test(value)) return true;
          return "Must be a valid e-mail.";
        },
      },
    });
    const name = useField("name");
    const password = useField("password");
    const firstname = useField("firstname");
    const lastname = useField("lastname");
    const phone = useField("phone");
    const address = useField("address");

    const email = useField("email");

    const submit = handleSubmit((values) => {
      let body = {
        firstname: values.firstname,
        lastname: values.lastname,
        username: values.name,
        password: values.password,
        email: values.email,
        phone: values.phone,
        address: values.address,
      };
      console.log(body);
      axios.post(`http://localhost:2828/user/resgister`, body).then((res) => {
        console.log("res111s", res.data);
        alert("Register success");
        globals.$router.push("/login");
      });
    });

    return {
      name,
      password,
      firstname,
      lastname,
      phone,
      address,
      email,
      submit,
      handleReset,
    };
  },
};
</script>

<style lang="scss" scoped>
@import "../../../assets/scss/mixin";
@import "../../../assets/scss/variables";
h1 {
  font-size: 18px;
  text-transform: uppercase;
  font-weight: 600;
  padding-bottom: 50px;
  letter-spacing: 1.5px;
}
a {
  font-size: 16px;
  transition: 0.3s all ease;
  color: black;
  text-decoration: none;
  &:hover {
    transition: 0.3s all ease;
    color: $mainColor;
  }
}
</style>