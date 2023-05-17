// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  target: 'static',
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
  generate: {
    fallback: '404.html',
  },
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
    }],
    
  ],
  vue: {
    config: {
      productionTip: false,
      devtools: true,
    },
  },
  toast: {
    position: 'top-center',
    register: [ 
      {
        name: 'my-error',
        message: 'Oops...Something went wrong',
        options: {
          type: 'error'
        }
      }
    ]
  }
});
