<template>
<!--Tabla que lista todos los registros de la entidad-->
    <div class="container" id="scroll">
      <h1>Tabla usuarios</h1>
      <table>
        <thead>
          <tr>
            <th>Código</th>
            <th>Usuario</th>
            <th>Contraseña</th>
          </tr>
        </thead>
        <tbody>
          <tr id="fila" v-for="usuario in usuarios" :key="usuario.id" @click="consultarbyId(usuario.id)">
            <td>{{ usuario.id }}</td>
            <td>{{ usuario.username }}</td>
            <td>{{ usuario.password }}</td>
          </tr>
  
          <router-view />
  
        </tbody>
      </table>
    </div>
  </template>
  
  <script>
  import axios from "axios";
  //contructor de las variables
  export default {
    data(){
      return{
        usuarios:[],
        id:"",
      }
    },
    methods: {
      obtenerUsuarios(){
        // Método para obtener la lista de usuarios
        axios.get("http://localhost:8080/api/usuario/listar")
        .then((response)=>{
          this.usuarios= response.data;
        })
        .catch((error)=>{
          console.error("Error al obtener usuarios: ", error);
        })
      },
      consultarbyId(valor){
        this.id=valor;
        this.$emit('ById',this.id);
    },
    },
    mounted(){
      //Llamar al método para obtener la lista de usuarios al cargar el componente
      this.obtenerUsuarios();
      
    },
  }
  </script>