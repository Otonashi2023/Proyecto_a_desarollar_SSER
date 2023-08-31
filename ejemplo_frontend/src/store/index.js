import { createStore } from 'vuex'

export default createStore({
  state: {
    msg:"Para eliminar ingresar la id_usuario"
  },
  getters: {
    alerta(state){
      return state.msg;
    }
  },
  mutations: {
  },
  actions: {
  }, 
  modules: {
  }
})
