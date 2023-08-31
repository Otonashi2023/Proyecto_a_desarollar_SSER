<template>
   <!--ventana para iniciar sesion-->
  <div class="login">
    <h1>Login</h1>
    <form v-on:submit.prevent="login">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required v-model="username" >
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" required v-model="password">
      </div>
      <br>
      <button id="login" type="submit" name="login">Iniciar Sesion</button>
    </form>
    <p class="msg">
      ¿No tienes cuenta?
      <a id="enlace" @click="enviarAHome()">Registrarse</a>
    </p>
    <div class="alert-danger" role="alert" v-if="error">
        {{ error_msg }}
      </div>
  </div>
</template>

<script>
import axios from 'axios';
//constructor de las variables 
export default {
  data () {
    return{
      username: "",
      password: "",
      error: false,
      error_msg: "",
      boleano: false,      
    };
  },
  //se crea el metodo para el servicio (logear)
  methods: {
    login() {
      axios
      .post('http://localhost:8080/api/usuario/login',{
        username: this.username,
        password: this.password,
      })
      .then((response)=>{

        if(response.data =="inicio de sesion exitoso"){
          window.location.href='#/perfil'
          console.log("Bienvenido");
          alert("¡Bienvenido "+this.username+"! " )
        }
        else{
          this.error = true;
          this.error_msg=response.data;
          console.log(this.error_msg);
        }

        this.username = '';
        this.password = '';

      })
      .catch((error)=>{
        console.error("Error al iniciar sesion:", error);
      });
    },
    enviarAHome(){
      this.$emit('escucharLog', this.boleano=true);
    },
  }
};
</script>

<!--CSS para inicio de sesion y registrar usuario-->
<style>
.login{
  display: inline-block;
  position:relative;
  color: #2b0f79;
  margin-left: 1rem;
  margin-right: 1rem;
  border-radius: 15px;
  box-shadow: 0 0 10px rgba(76, 92, 164, 1);
  background-color: white;
  padding-left: 1rem;
  padding-right: 1rem;
  height: 300px;
  
}
#enlace{
  text-decoration: underline;
  cursor: pointer;
}
#enlace:hover{
  color:green
}

.alert-danger {
  margin: 1rem;
  color: #fc0303;
}

</style>