<template>
<!--Tabla que lista todos los registros de la entidad-->
    <div class="container" id="scroll">
      <h1>Tabla Cargos</h1>
      <table>
        <thead>
          <tr>
            <th>Código</th>
            <th>Cargo</th>
          </tr>
        </thead>
        <tbody>
          <tr id="fila" v-for="cargo in cargos" :key="cargo.codigo" @click="consultarbyId(cargo.codigo)">
            <td>{{ cargo.codigo }}</td>
            <td>{{ cargo.nombre }}</td>
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
        cargos:[],
        id: "",
      }
    },
    methods: {
      obtenerCargos(){
        // Método para obtener la lista de cargos
        axios.get("http://localhost:8080/api/cargo/listar")
        .then((response)=>{
          this.cargos= response.data;
        })
        .catch((error)=>{
          console.error("Error al obtener cargos: ", error);
        })
      },
      consultarbyId(valor){
        this.id=valor;
        this.$emit('ById',this.id);
      },
    },
    mounted(){
      //Llamar al método para obtener la lista de cargos al cargar el componente
      this.obtenerCargos();
    },
  }
  </script>