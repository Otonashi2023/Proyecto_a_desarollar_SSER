<template>
  <!--componente para usar formulario-->
    <div class="container" id="form">
      <h1>F. Orden de reparacion</h1> 
      <form id="orden-form" @submit.prevent="guardar">
        <div class="form-group">
          <label for="codigo">Código:</label>
          <input type="number" name="codigo" id="codigo" required v-model="codigo">
        </div>
        <div class="form-group">
          <label for="estado">Estado:</label>
          <input type="text" name="estado" id="estado" required v-model="estado">
        </div>
        <div class="form-group">
          <label for="servicio">Servicio:</label>
          <input type="text" name="servicio" id="servicio" required v-model="servicio">
        </div>
        <div class="form-group">
          <label for="observacion">Observción:</label>
          <input type="text" name="observacion" id="observacion" required v-model="observacion" placeholder="Cuales la falla?">
        </div>
        <div class="form-group">
          <label for="cliente">Cliente:</label>
          <input type="number" name="cliente" id="cliente" required v-model="cliente" placeholder="Id cliente">
        </div>
        <div class="form-group">
          <label for="equipo">Equipo:</label>
          <input type="number" name="equipo" id="equipo" required v-model="equipo" placeholder="Id equipo">
        </div>
        <div class="form-group">
          <label for="empleado">Empleado:</label>
          <input type="number" name="empleado" id="empleado" required v-model="empleado" placeholder="Id empleado">
        </div>
        <br>        

        <button id="guardar" type="submit" name="guardar">Guardar</button>
        <button id="consultar" type="button" name="cosultar" @click="consultar(),showModal=true">Conlsultar</button>
        <!--el metodo de actualizar hace los cambios en la base de datos pero no los muestra, el problema esta en el backend, se deja el metodo guardar temporalmente -->
        <button id="actualizar" type="button" name="actualizar" @click="guardar">Actualizar</button>
        <button id="eliminar" type="button" name="eliminar" @click="eliminar">Eliminar</button>
      </form>    
    </div>
  <transition name ="fade">
    <div class="modal-overlay" v-if="showModal"></div>
  </transition>
  <transition name ="fade">
    <div class="modal"  v-if="showModal">
      <div class="container2" id="scroll" >
        <h1>Orden de reparacion</h1>
        <br>
        <table>
              <tr><td>Código:</td>    <td>{{ ordenes.codigo }}</td></tr>
              <tr><td>Nombre:</td>    <td>{{ ordenes.estado }}</td></tr>
              <tr><td>Apellido:</td>  <td>{{ ordenes.servicio }}</td></tr>
              <tr><td>Cédula:</td>    <td>{{ ordenes.observacion }}</td></tr>
              <tr><td>Cliente:</td>     <td><tr v-for="(client, index) in ordenes.cliente"
                                            :key="index">
                                            {{ index }} : {{ client }}</tr></td></tr>
              <tr><td>Equipo:</td>   <td><tr v-for="(equip, index) in ordenes.equipo"
                                            :key="index">
                                            {{ index }} : {{ equip }}</tr></td></tr>
              <tr><td>Empleado:</td>   <td><tr v-for="(emplead, index) in ordenes.empleado"
                                            :key="index">
                                            {{ index }} : {{ emplead }}</tr></td></tr>
        </table>
      </div>
      <br>
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
        codigo: "",
        estado: "",
        servicio: "",
        observacion: "",
        cliente: "",
        equipo: "",
        empleado: "",
        showModal: false,
        ordenes: []
      };
    },
    //metodos CRUD
    methods:{
      guardar(){
  
        axios
        .post('http://localhost:8080/api/ordenr',{
        codigo: this.codigo,
        estado: this.estado,
        servicio: this.servicio,
        observacion: this.observacion,
        cliente: this.cliente,
        equipo: this.equipo,
        empleado: this.empleado,
        })
        .then((response)=>{
          console.log(" Orden de reparación registrada con exito", response.data);
          this.codigo = '';
          this.estado = '';
          this.servicio = '';
          this.observacion = '';
          this.cliente = '';
          this.equipo = '';
          this.empleado = '';
          this.$emit('escucharF');
        })
        .catch((error)=>{
          console.error("Error al registrar la orden de reparación:", error);
        });
      },
      
      consultar(){
  
        axios
          .get('http://localhost:8080/api/ordenr/'+this.codigo)
          .then((response)=>{
            //actualiza los campos del formulario con los datos del estudiante consultado
            this.estado = response.data.estado;
            this.servicio = response.data.servicio;
            this.observacion= response.data.observacion;
            this.cliente = response.data.cliente.codigo;
            this.equipo= response.data.equipo.codigo;
            this.empleado =response.data.empleado.codigo;
            this.ordenes = response.data;
          })
          .catch((error) =>{
                      console.error("Error al consultar la orden de reparación: ", error);
          });
      },
      consultarT(value){
        this.codigo=value;
        axios
          .get('http://localhost:8080/api/ordenr/'+this.codigo)
          .then((response)=>{
            //actualiza los campos del formulario con los datos del estudiante consultado
            this.estado = response.data.estado;
            this.servicio = response.data.servicio;
            this.observacion= response.data.observacion;
            this.cliente = response.data.cliente.codigo;
            this.equipo= response.data.equipo.codigo;
            this.empleado =response.data.empleado.codigo;
          })
          .catch((error) =>{
            console.error("Error al consultar la orden de reparación: ", error);
          });
      },
  
      actualizar(){
        axios
          .put('http://localhost:8080/api/ordenr/actualizar/'+this.codigo,{
            codigo: this.codigo,
            estado: this.estado,
            servicio: this.servicio,
            observacion: this.observacion,
            cliente: this.cliente,
            equipo: this.equipo,
            empleado: this.empleado,
        })
        .then((response)=>{
          console.log(" Orden de reparación actualizado con exito", response.data);
          this.codigo = '';
          this.estado = '';
          this.servicio = '';
          this.observacion = '';
          this.cliente = '';
          this.equipo = '';
          this.empleado = '';
          this.$emit('escucharF');
        })
        .catch((error)=>{
          console.error("Error al actualizar la orden de reparación", error);
        });
      },
  
      eliminar(){
  
        axios
          .delete('http://localhost:8080/api/ordenr/'+this.codigo)
          .then(()=>{
            console.log("Orden de reparación eliminado con exito");
            //Limpiar los campos del formulario despues de eliminar          
            this.codigo = '';
            this.estado = '';
            this.servicio = '';
            this.observacion = '';
            this.cliente = '';
            this.equipo = '';
            this.empleado = '';
            this.$emit('escucharF');
          })
          .catch((error)=>{
            console.log("Error al eliminar la orden de reparación", error);
          });
      },
    },
  };
  </script>