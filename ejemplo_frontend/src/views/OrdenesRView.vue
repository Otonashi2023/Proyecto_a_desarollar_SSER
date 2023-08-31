<template>
  <!--Se usa los componentes-->
  <div class="Home">
    <div class="components">
      <FormularioOrdenesR @escucharF="puente" ref="componenteF"/>
      <TablaOrdenesR ref="componente" @ById="idcodigo"/>
    </div>
  </div>
</template>
    
<script>
//se importa los componentes
import FormularioOrdenesR from '@/components/FormularioOrdenesR.vue';
import TablaOrdenesR from '@/components/TablaOrdenesR.vue';
  //se define  los componentes
  export default {
    name:'OrdenesRView',
    components: {
    FormularioOrdenesR,
    TablaOrdenesR,
  },
  methods:{
    puente(){
      this.$refs.componente.obtenerOrdenes();  
    },
    idcodigo(value){
      this.$refs.componenteF.consultarT(value);
    },
  }
}
  </script>