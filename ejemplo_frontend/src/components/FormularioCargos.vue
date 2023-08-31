<template>
  <!--componente para usar formulario-->
    <div class="container" id="form">
      <h1>Formulario Cargos</h1> 
      <form id="cargo-form" @submit.prevent="guardar()" >
        <div class="form-group">
          <label for="codigo">Código:</label>
          <input type="number" name="codigo" id="codigo" required v-model="codigo">
        </div>
        <div class="form-group">
          <label for="cargo">Cargo:</label>
          <input type="text" name="nombre" id="nombre" required v-model="nombre">
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
        <h1>Cargo</h1>
          <br>
          <table>
            <tr id="fila"  v-for="(cargo,index) in cargos" :key="index">
              <td>{{ index }} :</td>
              <td>{{ cargo }}</td>
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
      cargos:[],
      showModal: false,
    };
  },
//metodos CRUD
  methods:{
    guardar(){

      axios
      .post('http://localhost:8080/api/cargo',{
        codigo: this.codigo,
        nombre: this.nombre,
      })
      .then((response)=>{
        console.log("Cargo registrado con exito", response.data);
        alert("Cargo registrado con exito");
        this.codigo = '';
        this.nombre = '';
        this.$emit('escucharF');
      })
      .catch((error)=>{
        console.error("Error al registrar cargo:", error);
      });
    },
    
    consultar(){
      axios
        .get('http://localhost:8080/api/cargo/'+this.codigo)
        .then((response)=>{
          //actualiza los campos del formulario con los datos del cargo consultado
          this.nombre = response.data.nombre;
          this.cargos=response.data;

        })
        .catch((error) =>{
          console.error("Error al consultar cargo: ", error);
        });
    },
    consultarT(value){
      this.codigo=value;
      axios
        .get('http://localhost:8080/api/cargo/'+this.codigo)
        .then((response)=>{
          //actualiza los campos del formulario con los datos del cargo consultado
          this.nombre = response.data.nombre;

        })
        .catch((error) =>{
          console.error("Error al consultar cargo: ", error);
        });
    },

    actualizar(){
      axios
        .put('http://localhost:8080/api/cargo/actualizar/'+this.codigo,{
          codigo: this.codigo,
          nombre: this.nombre,
      })
      .then((response)=>{
        console.log("Cargo actualizado con exito", response.data);
        this.codigo= '';
        this.nombre = '';
        this.$emit('escucharF');
      })
      .catch((error)=>{
        console.error("Error al actualizar cargo", error);
      });
    },

    eliminar(){

      axios
        .delete('http://localhost:8080/api/cargo/'+this.codigo)
        .then(()=>{
          console.log("Cargo eliminado con exito");
          //Limpiar los campos del formulario despues de eliminar          
          this.codigo = '';
          this.nombre = '';
          this.$emit('escucharF');
        })
        .catch((error)=>{
          console.log("Error al eliminar cargo", error);
        });
    },
  },
};
</script>