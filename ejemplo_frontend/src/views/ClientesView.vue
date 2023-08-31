<template>
  <!--llama los componentes-->
  <div class="Home">
    <div class="components">
      <FormularioClientes @escucharF="puente" ref="componenteF"/>
      <TablaClientes ref="componente" @ById="idcodigo"/>
    </div>
  </div>
</template>
  
<script>
//se importa los componentes
import FormularioClientes from '@/components/FormularioClientes.vue';
import TablaClientes from '@/components/TablaClientes.vue';
//se usa  los componentes  
export default {
  name:'ClientesView',
  components: {
    FormularioClientes,
    TablaClientes
  },
  methods:{
    puente(){
      this.$refs.componente.obtenerClientes();  
    },
    idcodigo(value){
      this.$refs.componenteF.consultarT(value);
    },
  }
}
</script>