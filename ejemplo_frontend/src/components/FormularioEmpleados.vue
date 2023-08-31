<template>
  <!--componente para usar formulario-->
    <div class="container" id="form">
      <h1>Formulario Empleados</h1> 
      <form id="empl-form" @submit.prevent="guardar">
        <div class="form-group">
          <label for="codigo">Código:</label>
          <input type="text" name="codigo" id="codigo" required v-model="codigo">
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
        <div class="form-group">
          <label for="salario">Salario:</label>
          <input type="number" name="salario" id="salario" required v-model="salario">
        </div>
        <div class="form-group">
          <label for="cargo">Cargo:</label>
          <input type="number" name="cargo" id="cargo" required v-model="cargo" placeholder="Id cargo">
        </div>
        <div class="form-group">
          <label for="usuario">Usuario:</label>
          <input type="number" name="usuario" id="usuario" required v-model="usuario" placeholder="Id usuario">
        </div>
        <br>
        
        <button id="guardar" type="submit" name="guardar">Guardar</button>
        <button id="consultar" type="button" name="cosultar" @click="consultar(),showModal=true">Conlsultar</button>
        <button id="actualizar" type="button" name="actualizar" @click="actualizar">Actualizar</button>
        <button id="eliminar" type="button" name="eliminar" @click="eliminar">Eliminar</button>
        <p>{{$store.getters.alerta}}</p><!--praticando el viux-->
      </form>    
    </div>
  <transition name ="fade">
    <div class="modal-overlay" v-if="showModal"></div>
  </transition>
  <transition name ="fade">
    <div class="modal"  v-if="showModal">
      <div class="container2" id="scroll" >
        <h1>Empleado</h1>
        <br>
        <table>
              <tr><td>Código:</td>    <td>{{ empleados.codigo }}</td></tr>
              <tr><td>Nombre:</td>    <td>{{ empleados.nombre }}</td></tr>
              <tr><td>Apellido:</td>  <td>{{ empleados.apellido }}</td></tr>
              <tr><td>Cédula:</td>    <td>{{ empleados.cedula }}</td></tr>
              <tr><td>Teléfono:</td>  <td>{{ empleados.telefono }}</td></tr>
              <tr><td>Dirección:</td> <td>{{ empleados.direccion }}</td></tr>
              <tr><td>Correo:</td>    <td>{{ empleados.correo }}</td></tr>
              <tr><td>Salario:</td>   <td>{{ empleados.salario }}</td></tr>
              <tr><td>Cargo:</td>     <td><tr v-for="(carg, index) in empleados.cargo"
                                            :key="index">
                                            {{ index }} : {{ carg }}</tr></td></tr>
              <tr><td>Usuario:</td>   <td><tr v-for="(usuar, index) in empleados.usuario"
                                            :key="index">
                                            {{ index }} : {{ usuar }}</tr></td></tr>
        </table>
    </div>
      <button class="boton" @click="showModal=false" >Cerrar modal</button>
    </div>
  </transition>
</template>
    
  <script>
  import axios from "axios";
  //contructor de las variables npm 
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
        salario: "",
        cargo: "",
        usuario: "",
        showModal: false,
        empleados: []
      };
    },
    //metodos CRUD
    methods:{
      guardar(){
  
        axios
        .post('http://localhost:8080/api/empleado',{
          codigo: this.codigo,
          nombre: this.nombre,
          apellido: this.apellido,
          cedula: this.cedula,
          telefono: this.telefono,
          direccion: this.direccion,
          correo: this.correo,
          salario: this.salario,
          cargo: this.cargo,
          usuario: this.usuario,
        })
        .then((response)=>{
          console.log("Empleado registrado con exito", response.data);
          alert("Empleado registrado con exito");
          this.codigo = '';
          this.nombre = '';
          this.apellido = '';
          this.cedula = '';
          this.telefono = '';
          this.direccion = '';
          this.correo = '';
          this.salario = '';
          this.cargo = '';
          this.usuario = '';
          this.$emit('escucharF');
        })
        .catch((error)=>{
          console.error("Error al registrar Empleado:", error);
        });
      },
      
      consultar(){
  
        axios
          .get('http://localhost:8080/api/empleado/'+this.codigo)
          .then((response)=>{
            //actualiza los campos del formulario con los datos del estudiante consultado
            this.nombre = response.data.nombre;
            this.apellido = response.data.apellido;
            this.cedula = response.data.cedula;
            this.telefono = response.data.telefono;
            this.direccion = response.data.direccion;
            this.correo = response.data.correo;
            this.salario= response.data.salario;
            this.cargo =(response.data.cargo.codigo);
            this.usuario =(response.data.usuario.id);
            this.empleados = response.data;
          })
          .catch((error) =>{
                      console.error("Error al consultar cliente: ", error);
          });
      },
      consultarT(value){
        this.codigo=value;
        axios
          .get('http://localhost:8080/api/empleado/'+this.codigo)
          .then((response)=>{
            //actualiza los campos del formulario con los datos del estudiante consultado
            this.nombre = response.data.nombre;
            this.apellido = response.data.apellido;
            this.cedula = response.data.cedula;
            this.telefono = response.data.telefono;
            this.direccion = response.data.direccion;
            this.correo = response.data.correo;
            this.salario= response.data.salario;
            this.cargo=(response.data.cargo.codigo);
            this.usuario=(response.data.usuario.id);
          })
          .catch((error) =>{
                      console.error("Error al consultar cliente: ", error);
          });
      },
  
      actualizar(){
        axios
          .put('http://localhost:8080/api/empleado/actualizar/'+this.codigo,{
            codigo: this.codigo,
            nombre: this.nombre,
            apellido: this.apellido,
            cedula: this.cedula,
            telefono: this.telefono,
            direccion: this.direccion,
            correo: this.correo,
            salario: this.salario,
            cargo: this.cargo,
            usuario: this.usuario,
        })
        .then((response)=>{
          console.log("Empleado actualizado con exito", response.data);
          this.codigo = '';
          this.nombre = '';
          this.apellido = '';
          this.cedula = '';
          this.telefono = '';
          this.direccion = '';
          this.correo = '';
          this.salario = '';
          this.cargo = '';
          this.usuario = '';
          this.$emit('escucharF');
        })
        .catch((error)=>{
          console.error("Error al actualizar empleado", error);
        });
      },
  
      eliminar(){
        this.id=this.usuario;
        axios
          .delete('http://localhost:8080/api/usuario/'+this.id)
          .then(()=>{
            console.log(this.codigo)
            //Limpiar los campos del formulario despues de eliminar          
            this.codigo = '';
            this.nombre = '';
            this.apellido = '';
            this.cedula = '';
            this.telefono = '';
            this.direccion = '';
            this.correo = '';
            this.salario ='';
            this.cargo = '';
            this.usuario = '';  
            this.$emit('escucharF');    
          })
          .catch((error)=>{
            console.log("Error al eliminar empleado", error);
          });
      },
    },
  };
  </script>