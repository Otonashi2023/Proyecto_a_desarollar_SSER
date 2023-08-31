<template>
<!--Tabla que lista todos los registros de la entidad-->
    <div class="container" id="scroll">
      <h1>Tabla Equipos</h1>
      <table>
        <thead>
          <tr>
            <th>Código</th>
            <th>Tipo</th>
            <th>Marca</th>
            <th>Modelo</th>
            <th>No. Serial</th>
          </tr>
        </thead>
        <tbody>
          <tr id="fila" v-for="equipo in equipos" :key="equipo.codigo" @click="consultarbyId(equipo.codigo)">
            <td>{{ equipo.codigo }}</td>
            <td>{{ equipo.tipo }}</td>
            <td>{{ equipo.marca }}</td>
            <td>{{ equipo.modelo }}</td>
            <td>{{ equipo.serial }}</td>
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
        equipos:[],
        id:"",
      }
    },
    methods: {
      obtenerEquipos(){
        // Método para obtener la lista de equipos
        axios.get("http://localhost:8080/api/equipo/listar")
        .then((response)=>{
          this.equipos= response.data;
        })
        .catch((error)=>{
          console.error("Error al obtener eqiopos: ", error);
        })
      },
      consultarbyId(valor){
        this.id=valor;
        this.$emit('ById',this.id);
      },
    },
    mounted(){
      //Llamar al método para obtener la lista de equipos al cargar el componente
      this.obtenerEquipos();
      
    },
  }
  </script>