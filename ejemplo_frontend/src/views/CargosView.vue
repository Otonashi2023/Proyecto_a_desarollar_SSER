<template>
  <!--llama los componentes-->
  <div class="Home">
    <div class="components">
      <FormularioCargos @escucharF="puente" ref="componenteF"/>
      <TablaCargos ref="componente" @ById="idcodigo"/>
     </div>
  </div>
</template>
    
<script>
//Se inporta los componentes
import FormularioCargos from '@/components/FormularioCargos.vue';
import TablaCargos from '@/components/TablaCargos.vue';
//se usa  los componentes
export default {
  name:'CargosView',
  components: {
    FormularioCargos,
    TablaCargos
  },
  methods:{
    puente(){
      this.$refs.componente.obtenerCargos();  
    },
    idcodigo(value){
      this.$refs.componenteF.consultarT(value);
    },
  }
}
</script>