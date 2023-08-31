<template>
  <!--componente para usar formulario-->
    <div class="container" id="form">
      <h1>Formulario Usuarios</h1> 
      <form id="usu-form" @submit.prevent="guardar">
        <div class="form-group">
          <label for="codigo">Código:</label>
          <input type="number" name="codigo" id="codigo"  v-model="id" placeholder="AI">
        </div>
        <div class="form-group">
          <label for="username">Usuario:</label>
          <input type="text" name="username" id="username" required v-model="username">
        </div>
        <div class="form-group">
          <label for="password">Contraseña:</label>
          <input type="text" id="password" required v-model="password">
        </div>
        <br>
        
        <button id="guardar" type="submit" name="guardar">Guardar</button>
        <button id="consultar" type="button" name="cosultar" @click="consultar(),showModal=true">Conlsultar</button>
        <button id="actualizar" type="button" name="actualizar" @click="actualizar">Actualizar</button>
        <button id="eliminar" type="button" name="eliminar" @click="eliminar">Eliminar</button>
      </form>    
    </div>
  <transition name ="fade">
    <div class="modal-overlay" v-if="showModal"></div>
  </transition>
  <transition name ="fade">
    <div class="modal"  v-if="showModal">
      <div class="container2" id="scroll" >
        <h1>Usuario</h1>
        <br>
        <table>
          <tr id="fila"  v-for="(usuario,index) in usuarios" :key="index">
            <td>{{ index }} :</td>
            <td>{{ usuario }}</td>
          </tr>  
        </table>
      </div>
      <button class="boton" @click="showModal=false" >Cerrar modal</button>
    </div>
  </transition>
</template>
    
  <script>
  import axios from "axios";
  //contructor de las variables 
  export default {
    data() {
      return{
        id: "",
        username: "",
        password: "",
        showModal: false,
        usuarios: []
      };
    },
    //metodos CRUD
    methods:{
      guardar(){
  
        axios
        .post('http://localhost:8080/api/usuario',{
          id: this.id,
          username: this.username,
          password: this.password,
        })
        .then((response)=>{
          console.log("Usuario registrado con exito", response.data);
          alert("Usuario registrado con exito");
          this.id = '';
          this.username = '';
          this.password = '';
          this.$emit('escucharF');
        })
        .catch((error)=>{
          console.error("Error al registrar usuario:", error);
        });
      },
      
      consultar(){
  
        axios
          .get('http://localhost:8080/api/usuario/'+this.id)
          .then((response)=>{
            //actualiza los campos del formulario con los datos del estudiante consultado
            this.username = response.data.username;
            this.password = response.data.password;
            this.usuarios = response.data;
          })
          .catch((error) =>{
            console.error("Error al consultar usuario: ", error);
          });
      },
      consultarT(value){
        this.id=value;
        axios
        .get('http://localhost:8080/api/usuario/'+this.id)
        .then((response)=>{
          //actualiza los campos del formulario con los datos del estudiante consultado
          this.username = response.data.username;
          this.password = response.data.password;
        })
        .catch((error) =>{
          console.error("Error al consultar usuario: ", error);
        });
      },
  
      actualizar(){
        axios
          .put('http://localhost:8080/api/usuario/actualizar/'+this.id,{
            id: this.id,
            username: this.username,
            password: this.password,
        })
        .then((response)=>{
          console.log("Usuario actualizado con exito", response.data);
          this.id = '';
          this.username = '';
          this.password = '';
          this.$emit('escucharF');
        })
        .catch((error)=>{
          console.error("Error al actualizar usuario", error);
        });
      },
  
      eliminar(){
  
        axios
          .delete('http://localhost:8080/api/usuario/'+this.id)
          .then(()=>{
            console.log("Usuario eliminado con exito");
            //Limpiar los campos del formulario despues de eliminar          
            this.id = '';
            this.username = '';
            this.password = '';
            this.$emit('escucharF');
          })
          .catch((error)=>{
            console.log("Error al eliminar usuario", error);
          });
      },
    },
  };
  </script>