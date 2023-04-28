import { createRouter, createWebHashHistory } from 'vue-router'
import DashBoard from '../views/DashBoard.vue'
import profile from '../views/Profile.vue'
import Products from '../views/Products.vue'
import Setting from '../views/Setting.vue'
import Order from '../views/Order.vue'

const routes = [
  {
    path: '/',
    name: 'dashboard',
    component: DashBoard
  },
  {
    path: '/profile',
    name: 'profile',
    component: profile
  },
  {
    path: '/products',
    name: 'products',
    component: Products
  },
  {
    path: '/setting',
    name: 'Setting',
    component: Setting
  },
  {
    path: '/order',
    name: 'Order',
    component: Order
  },
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
