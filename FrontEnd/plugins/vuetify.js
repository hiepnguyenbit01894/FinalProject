import { createVuetify } from "vuetify/lib/framework.mjs";
import * as components from "vuetify/components";
import * as directives from "vuetify/directives";
//  Icon
import '@mdi/font/css/materialdesignicons.css'
// Vue paginate
import VuePaginate from 'vue-paginate'

export default defineNuxtPlugin((nuxt) => {
  const vuetify = createVuetify({
    ssr: true,
    components,
    directives,
    icons: {
      defaultSet: 'mdi', // This is already the default value - only for display purposes
    },
  });
  
  nuxt.vueApp.use(vuetify,VuePaginate);
});
