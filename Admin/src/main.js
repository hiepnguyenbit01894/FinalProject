import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
// Vuetify
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import '@mdi/font/css/materialdesignicons.css'
// Sweet Alert
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
// Chart 
import VueApexCharts from "vue3-apexcharts"
const vuetify = createVuetify({
  components,
  directives,
})

createApp(App).use(VueApexCharts).use(vuetify).use(store).use(VueSweetalert2).use(router).mount('#app')
