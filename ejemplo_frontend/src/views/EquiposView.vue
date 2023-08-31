<template>
  <!--llama los componentes-->
  <div class="Home">
    <div class="components">
      <FormularioEquipos @escucharF="puente" ref="componenteF"/>
      <TablaEquipos ref="componente" @ById="idcodigo"/>
    </div>
  </div>
</template>
    
<script>
//se importa los componentes
import FormularioEquipos from '@/components/FormularioEquipos.vue';
import TablaEquipos from '@/components/TablaEquipos.vue';
 //se usa  los componentes 
export default {
  name:'EquiposView',
  components: {
    FormularioEquipos,
    TablaEquipos
  },
  methods:{
    puente(){
      this.$refs.componente.obtenerEquipos();  
    },
    idcodigo(value){
      this.$refs.componenteF.consultarT(value);
    },
  }
}
</script>