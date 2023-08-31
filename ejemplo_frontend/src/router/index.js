import { createRouter, createWebHashHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'
import RegistrarseView from '../views/RegistrarseView.vue'
import ClientesView from '../views/ClientesView.vue'
import UsuariosView from '../views/UsuariosView.vue'
import CargosView from '../views/CargosView.vue'
import EmpleadosView from '../views/EmpleadosView.vue'
import EquiposView from '../views/EquiposView.vue'
import OrdenesRView from '../views/OrdenesRView.vue'
import PerfilView from "../views/PerfilView.vue"

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },

  {
    path: '/login',
    name: 'login',
    component: LoginView
  },

  {
    path: '/registrarse',
    name: 'registrarse',
    component: RegistrarseView
  },

  {
    path: '/clientes',
    name: 'clientes',
    component: ClientesView
  },

  {
    path: '/usuarios',
    name: 'usuarios',
    component: UsuariosView
  },

  {
    path: '/cargos',
    name: 'cargos',
    component: CargosView
  },

  {
    path: '/empleados',
    name: 'empleados',
    component: EmpleadosView
  },

  {
    path: '/equipos',
    name: 'equipos',
    component: EquiposView
  },

  {
    path: '/ordenesr',
    name: 'ordenesr',
    component: OrdenesRView
  },

  {
    path: '/perfil',
    name: 'perfil',
    component: PerfilView
  },
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
