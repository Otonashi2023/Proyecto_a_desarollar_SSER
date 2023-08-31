<template> 
<!--Tabla que lista todos los registros de la entidad-->
    <div class="container" id="scroll">
      <h1>Tabla Ordenes de reparación</h1>
      <table>
        <thead>
          <tr>
            <th>Código</th>
            <th>Estado</th>
            <th>Servicio</th>
            <th>Observacón</th>
            <th>Cliente</th>
            <th>Equipo</th>
            <th>Empleado</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="orden in ordenes" :key="orden.codigo" @click="consultarbyId(orden.codigo)">
            <td>{{ orden.codigo }}</td>
            <td>{{ orden.estado }}</td>
            <td>{{ orden.servicio }}</td>
            <td id="ancho">{{ orden.observacion }}</td>
            <td>
              <tr v-for="(client, indice) in orden.cliente" :key="indice">
                <td>{{ indice }} : {{ client }}</td>         
              </tr>
            </td>
            <td>
              <tr v-for="(equip, indice) in orden.equipo" :key="indice">
                <td>{{ indice }} : {{ equip }}</td>             
              </tr>
            </td>
            <td>
              <tr v-for="(emplead, indice) in orden.empleado" :key="indice">
                  <td>{{ indice }} : {{ emplead }}</td>              
              </tr>
            </td>    
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
        ordenes:[],
        id:"",
      }
    },
    methods: {
      obtenerOrdenes(){
        // Método para obtener la lista de ordenes de reparación
        axios.get("http://localhost:8080/api/ordenr/listar")
        .then((response)=>{
          this.ordenes= response.data;
        })
        .catch((error)=>{
          console.error("Error al obtener las ordenes de reparación: ", error);
        })
      },
      consultarbyId(valor){
        this.id=valor;
        this.$emit('ById',this.id);
      },
    },
    mounted(){
      //Llamar al método para obtener la lista de ordenes de reparación al cargar el componente
      this.obtenerOrdenes();
      
    },
 }

  </script>