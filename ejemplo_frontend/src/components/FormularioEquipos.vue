<template>
  <!--componente para usar formulario-->
    <div class="container" id="form">
      <h1>Formulario Equipos</h1> 
      <form id="equip-form" @submit.prevent="guardar">
        <div class="form-group">
          <label for="codigo">Código:</label>
          <input type="number" name="codigo" id="codigo" required v-model="codigo">
        </div>
        <div class="form-group">
          <label for="tipo">Tipo:</label>
          <input type="text" name="tipo" id="tipo" required v-model="tipo">
        </div>
        <div class="form-group">
          <label for="marca">Marca:</label>
          <input type="text" name="marca" id="marca" required v-model="marca">
        </div>
        <div class="form-group">
          <label for="modelo">Modelo:</label>
          <input type="text" name="modelo" id="modelo" required v-model="modelo">
        </div>
        <div class="form-group">
          <label for="serial">SN:</label>
          <input type="number" name="serial" id="serial" required v-model="serial">
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
        <h1>Equipo</h1>
        <br>
        <table>
          <tr id="fila"  v-for="(equipo,index) in equipos" :key="index">
            <td>{{ index }} :</td>
            <td>{{ equipo }}</td>
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
        tipo: "",
        marca: "",
        modelo: "",
        serial: "",
        showModal: false,
        equipos: []
      };
    },
    //metodos CRUD
    methods:{
      guardar(){
  
        axios
        .post('http://localhost:8080/api/equipo',{
          codigo: this.codigo,
          tipo: this.tipo,
          marca: this.marca,
          modelo: this.modelo,
          serial: this.serial,
        })
        .then((response)=>{
          console.log("Equipo registrado con exito", response.data);
          alert("Equipo registrado con exito");
          this.codigo = '';
          this.tipo = '';
          this.marca = '';
          this.modelo = '';
          this.serial = '';
          this.$emit('escucharF');
        })
        .catch((error)=>{
          console.error("Error al registrar equipo:", error);
        });
      },
      
      consultar(){
  
        axios
          .get('http://localhost:8080/api/equipo/'+this.codigo)
          .then((response)=>{
            //actualiza los campos del formulario con los datos del equipo consultado
            this.tipo = response.data.tipo;
            this.marca = response.data.marca;
            this.modelo = response.data.modelo;
            this.serial = response.data.serial;
            this.equipos = response.data;
          })
          .catch((error) =>{
                      console.error("Error al consultar equipo: ", error);
          });
      },
      consultarT(value){
        this.codigo=value;
        axios
          .get('http://localhost:8080/api/equipo/'+this.codigo)
          .then((response)=>{
          //actualiza los campos del formulario con los datos del equipo consultado
            this.tipo = response.data.tipo;
            this.marca = response.data.marca;
            this.modelo = response.data.modelo;
            this.serial = response.data.serial;
          })
          .catch((error) =>{
            console.error("Error al consultar equipo: ", error);
          });
      },
  
      actualizar(){
        axios
          .put('http://localhost:8080/api/equipo/actualizar/'+this.codigo,{
            codigo: this.codigo,
            tipo: this.tipo,
            marca: this.marca,
            modelo: this.modelo,
            serial: this.serial,
        })
        .then((response)=>{
          console.log("Equipo actualizado con exito", response.data);
          this.codigo = '';
          this.tipo = '';
          this.marca = '';
          this.modelo = '';
          this.serial = '';
          this.$emit('escucharF');
        })
        .catch((error)=>{
          console.error("Error al actualizar equipo", error);
        });
      },
  
      eliminar(){
  
        axios
          .delete('http://localhost:8080/api/equipo/'+this.codigo)
          .then(()=>{
            console.log("Equipo eliminado con exito");
            //Limpiar los campos del formulario despues de eliminar          
            this.codigo = '';
            this.tipo = '';
            this.marca = '';
            this.modelo = '';
            this.serial = '';
            this.$emit('escucharF');
          })
          .catch((error)=>{
            console.log("Error al eliminar equipo", error);
          });
      },
    },
  };
  </script>