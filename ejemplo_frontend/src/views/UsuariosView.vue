<template>
  <!--Se usa los componentes-->
  <div class="Home">
    <div class="components">
      <FormularioUsuarios @escucharF="puente" ref="componenteF"/>
      <TablasUsuarios ref="componente" @ById="idcodigo"/>
    </div>
  </div>
</template>
    
<script>
//se importa los componentes
import FormularioUsuarios from '@/components/FormularioUsuarios.vue';
import TablasUsuarios from '@/components/TablasUsuarios.vue';
  //se definen  los componentes
  export default {
    name:'UsuariosView',
    components: {
    FormularioUsuarios,
    TablasUsuarios,
},
  methods:{
    puente(){
      this.$refs.componente.obtenerUsuarios();
    },
    idcodigo(value){
      this.$refs.componenteF.consultarT(value);
    },
  }
}
 </script>