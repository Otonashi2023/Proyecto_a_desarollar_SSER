<template>
  <!--llama los componentes-->
  <div class="Home">
    <div class="components">
      <FormularioEmpleados @escucharF="puente" ref="componenteF"/>
      <TablaEmpleados ref="componente" @ById="idcodigo"/>
    </div>
  </div>
</template>
    
<script>
  //se importa los componentes
import FormularioEmpleados from '@/components/FormularioEmpleados.vue';
import TablaEmpleados from '@/components/TablaEmpleados.vue';
  //se usa  los componentes
  export default {
    name:'EmpleadosView',
    components: {
    FormularioEmpleados,
    TablaEmpleados
  },
  methods:{
    puente(){
      this.$refs.componente.obtenerEmpleados();
    },
    idcodigo(value){
      this.$refs.componenteF.consultarT(value);
    },
  }
}
</script>