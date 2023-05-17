import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/Home.vue'
import DashBoard from '../views/DashBoard.vue'
import profile from '../views/Profile.vue'
import Products from '../views/Products.vue'
import Order from '../views/Order.vue'
import Login from '../views/Login.vue'
const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/Login',
    name: 'Login',
    component: Login
  },
  {
    path: '/dashboard',
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
