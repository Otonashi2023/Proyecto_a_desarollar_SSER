<template>
  <!--ventana para registrar usuarios-->
  <div class="login">
    <h1>Registrar Usuario</h1>
    <form @submit.prevent="registrar(); irALogin()">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required v-model="username">
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" required v-model="password">
      </div>
      <br>
      <button id="registrar" type="submit" name="registrar">Registrar</button>
    </form>
  </div>
</template>

<script>
import axios from "axios";
//constructor de las variables 
export default {
  data () {
    return{
      username: "",
      password: "",
      boleano: false
    };
  },
//se crea los metodos para los servicios (crear )
  methods: {
    registrar() {
      axios
      .post('http://localhost:8080/api/usuario',{
        username: this.username,
        password: this.password,
      })
      .then((response)=>{
        console.log("Usuario registrado con exito", response.data);
        alert("Usuario registrado con exito");
        this.username = '';
        this.password = '';
      })
      .catch((error)=>{
        console.error("Error al registrar usuario:", error);
      });
    },
    irALogin(){
      this.$emit('escucharReg',this.boleano=true)
    }
  }
}
</script>