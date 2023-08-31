<template> 
<!--Tabla que lista todos los registros de la entidad-->
  <div class="container" id="scroll">
    <h1>Tabla Empleados</h1>
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
          <th>Salario</th>
          <th>Cargo</th>
          <th>Usuario</th>
        </tr>
      </thead>
      <tbody>
        <tr id="fila" v-for="empleado in empleados" :key="empleado.codigo" @click="consultarbyId(empleado.codigo)">
          <td>{{ empleado.codigo }}</td>
          <td>{{ empleado.nombre }}</td>
          <td>{{ empleado.apellido }}</td>
          <td>{{ empleado.cedula }}</td>
          <td>{{ empleado.telefono }}</td>
          <td>{{ empleado.direccion }}</td>
          <td>{{ empleado.correo }}</td>
          <td>{{ empleado.salario }}</td>
          <td>
            <tr v-for="(carg, indice) in empleado.cargo" :key="indice">
              {{ indice }} : {{ carg }}              
            </tr>
          </td>
            <td>
              <tr v-for="(usuar, indice) in empleado.usuario" :key="indice">
                {{ indice }} : {{ usuar }}
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
      empleados:[],
      id:"",
    }
  },
  methods: {
    obtenerEmpleados(){
      // Método para obtener la lista de empleados
      axios.get("http://localhost:8080/api/empleado/listar")
      .then((response)=>{
        this.empleados=response.data;
      })
      .catch((error)=>{
        console.error("Error al obtener empleados: ", error);
      })
    },
    consultarbyId(valor){
        this.id=valor;
        this.$emit('ById',this.id);
    },
  },
      //Llamar al método para obtener la lista de empleados al cargar el componente
  mounted(){
    //Llamar al método para obtener la lista de empleados al cargar el componente
    this.obtenerEmpleados();
  }
}
</script>