<template>
<!--Tabla que lista todos los registros de la entidad-->
  <div class="container" id="scroll">
    <h1>Tabla Clientes</h1>
    <table>
      <thead>
        <tr>
          <th>Código</th>
          <th>Nombre</th>
          <th>Apellido</th>
          <th>Cédula</th>
          <th>Teléfono</th>
          <th>Dirección</th>
          <th>Correo</th>
        </tr>
      </thead>
      <tbody>
        <tr id="fila" v-for="cliente in clientes" :key="cliente.codigo" @click="consultarbyId(cliente.codigo)">
          <td>{{ cliente.codigo }}</td>
          <td>{{ cliente.nombre }}</td>
          <td>{{ cliente.apellido }}</td>
          <td>{{ cliente.cedula }}</td>
          <td>{{ cliente.telefono }}</td>
          <td>{{ cliente.direccion }}</td>
          <td>{{ cliente.correo }}</td>
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
      clientes:[],
      id:"",
    }
  },
  methods: {
    obtenerClientes(){
      // Método para obtener la lista de clientes
      axios.get("http://localhost:8080/api/cliente/listar")
      .then((response)=>{
        this.clientes= response.data;
      })
      .catch((error)=>{
        console.error("Error al obtener clientes: ", error);
      })
    },
    consultarbyId(valor){
        this.id=valor;
        this.$emit('ById',this.id);
    },
  },
  mounted(){
    //Llamar al método para obtener la lista de clientes al cargar el componente
    this.obtenerClientes();
    
  },
}
</script>