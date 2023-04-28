// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  typescript: {
    tsConfig: {
      "extends": "../../../tsconfig.base.json"
    }
  },
  css: [
    "~/assets/css/reset.css",
    "~/assets/scss/main.scss",
    "vuetify/styles/main.css",
    'material-design-icons-iconfont/dist/material-design-icons.css',
  ],
  build: {
    transpile: ["vuetify"],
  },
  modules: [
    ['@nuxtjs/google-fonts', {
      families: {
        'Sofia Sans Semi Condensed': true,
        download: true,
        inject: true
      }
    }]
  ],
  
});
