<template>
  <div class="col-lg-2 currencies right">
    <div class="inner-currencies">
      <ul class="d-flex justify-end align-center">
        <li class="list-inline-item" @click="show = !show">
          <v-icon icon="mdi-magnify"></v-icon>
        </li>
        <li class="list-inline-item">
          <v-menu v-if="testLogin">
            <template v-slot:activator="{ props }">
              <v-icon
                size="25"
                v-bind="props"
                icon="mdi-account"
                class="authen"
                @click="checkLogin()"
              />
            </template>
            <v-list>
              <v-list-item>
               Hello, {{ testLogin.username }}
              </v-list-item>
              <v-list-item>
                <router-link class="link" to="/" @Click="Logout()">
                  Logout
                </router-link>
              </v-list-item>
            </v-list>
          </v-menu>
          <v-menu v-else>
            <template v-slot:activator="{ props }">
              <v-icon
                size="25"
                v-bind="props"
                icon="mdi-account"
                class="authen"
              />
            </template>
            <v-list>
              <v-list-item>
                <router-link class="link" to="/login"> Login </router-link>
              </v-list-item>
              <v-list-item>
                <router-link class="link" to="/register">
                  Register
                </router-link>
              </v-list-item>
            </v-list>
          </v-menu>
        </li>
        <li class="list-inline-item">
          <router-link class="link" to="/cart">
            <v-icon size="25" icon="mdi-cart" class="cart" />
          </router-link>
        </li>

        <SearchContent
          :class="{ open: show }"
          @toggle="show = false"
        ></SearchContent>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: "currencies",
  data() {
    return {
      show: true,
      testLogin: [],
    };
  },
  mounted() {
    this.checkLogin();
  },
  methods: {
    checkLogin() {
      this.testLogin = JSON.parse(localStorage.getItem("user"));
      console.log(this.testLogin);
    },
    Logout() {
      localStorage.removeItem("user");
      alert("Logout success");
      console.log(JSON.parse(localStorage.getItem("user")));
    },
  },
};
</script>

<style lang="scss" scoped>
@import "../../assets/scss/mixin";
@import "../../assets/scss/variables";
.link {
  color: black;
  text-decoration: none;
}
.currencies {
  li {
    cursor: pointer;
    font-size: 20px;
    &:hover {
      i {
        color: $mainColor;
        transition: 0.3s;
      }
    }
  }
  .list-inline-item {
    margin: 0px 5px;
  }
}
.search {
  position: absolute;
  bottom: -200px;
}
.open {
  display: none;
}
</style>