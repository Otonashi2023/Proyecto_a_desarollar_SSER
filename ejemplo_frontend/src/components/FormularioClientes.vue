<template>
  <!--componente para usar formulario-->
  <div class="container" id="form">
    <h1>Formulario Clientes</h1> 
    <form id="client-form" @submit.prevent="guardar">
      <div class="form-group">
        <label for="codigo">Código:</label>
        <input type="number" name="codigo" id="codigo" required v-model="codigo">
      </div>
      <div class="form-group">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" id="nombre" required v-model="nombre">
      </div>
      <div class="form-group">
        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido" id="apellido" required v-model="apellido">
      </div>
      <div class="form-group">
        <label for="cedula">Cédula:</label>
        <input type="number" name="cedula" id="cedula" required v-model="cedula">
      </div>
      <div class="form-group">
        <label for="telefono">Teléfono:</label>
        <input type="tel" name="telefono" id="telefono" required v-model="telefono">
      </div>
      <div class="form-group">
        <label for="direccion">Dirección:</label>
        <input type="text" name="direccion" id="direccion" required v-model="direccion">
      </div>
      <div class="form-group">
        <label for="correo">Correo:</label>
        <input type="email" name="correo" id="correo" required v-model="correo">
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
        <h1>Cliente</h1>
        <br>
        <table>
          <tr id="fila"  v-for="(cliente,index) in clientes" :key="index">
            <td>{{ index }} :</td>
            <td>{{ cliente }}</td>
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
      codigo: "",
      nombre: "",
      apellido: "",
      cedula: "",
      telefono: "",
      direccion: "",
      correo: "",
      showModal: false,
      clientes: []
    };
  },
  //metodos CRUD
  methods:{
    guardar(){

      axios
      .post('http://localhost:8080/api/cliente',{
        codigo: this.codigo,
        nombre: this.nombre,
        apellido: this.apellido,
        cedula: this.cedula,
        telefono: this.telefono,
        direccion: this.direccion,
        correo: this.correo,
      })
      .then((response)=>{
        console.log("Cliente registrado con exito", response.data);
        alert("Cliente registrado con exito");
        this.codigo = '';
        this.nombre = '';
        this.apellido = '';
        this.cedula = '';
        this.telefono = '';
        this.direccion = '';
        this.correo = '';
        this.$emit('escucharF');
      })
      .catch((error)=>{
        console.error("Error al registrar cliente:", error);
      });
    },
    
    consultar(){

      axios
        .get('http://localhost:8080/api/cliente/'+this.codigo)
        .then((response)=>{
          //actualiza los campos del formulario con los datos del estudiante consultado
          this.nombre = response.data.nombre;
					this.apellido = response.data.apellido;
					this.cedula = response.data.cedula;
					this.telefono = response.data.telefono;
					this.direccion = response.data.direccion;
					this.correo = response.data.correo;
          this.clientes = response.data;
        })
        .catch((error) =>{
					console.error("Error al consultar cliente: ", error);
        });
    },
    consultarT(value){
      this.codigo=value;
      axios
        .get('http://localhost:8080/api/cliente/'+this.codigo)
        .then((response)=>{
          //actualiza los campos del formulario con los datos del cargo consultado
          this.nombre = response.data.nombre;
          this.apellido = response.data.apellido;
					this.cedula = response.data.cedula;
					this.telefono = response.data.telefono;
					this.direccion = response.data.direccion;
					this.correo = response.data.correo;
        })
        .catch((error) =>{
          console.error("Error al consultar cargo: ", error);
        });
    },

    actualizar(){
      axios
        .put('http://localhost:8080/api/cliente/actualizar/'+this.codigo,{
          codigo: this.codigo,
          nombre: this.nombre,
          apellido: this.apellido,
          cedula: this.cedula,
          telefono: this.telefono,
          direccion: this.direccion,
          correo: this.correo,
      })
      .then((response)=>{
        console.log("Cliente actualizado con exito", response.data);
        this.codigo = '';
        this.nombre = '';
        this.apellido = '';
        this.cedula = '';
        this.telefono = '';
        this.direccion = '';
        this.correo = '';
        this.$emit('escucharF');
      })
      .catch((error)=>{
        console.error("Error al actualizar cliente", error);
      });
    },

    eliminar(){

      axios
        .delete('http://localhost:8080/api/cliente/'+this.codigo)
        .then(()=>{
          console.log("Cliente eliminado con exito");
          //Limpiar los campos del formulario despues de eliminar          
          this.codigo = '';
          this.nombre = '';
          this.apellido = '';
          this.cedula = '';
          this.telefono = '';
          this.direccion = '';
          this.correo = '';
          this.$emit('escucharF');
        })
        .catch((error)=>{
          console.log("Error al eliminar cliente", error);
        });
    },
  },
};
</script>