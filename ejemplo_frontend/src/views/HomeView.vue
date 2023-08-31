<template>
    <div class="cuerpo" id="fondo">
        <header id="image">
            <div>
                <img alt="Vue logo" src="../assets/logo_azul.png">
            </div>
            <div class="titulo">
                <p id="p1">SSER</p>
                <p id="p2"> SISTEMA DE SEGUIMIENTO DE EQUIPOS EN REPARACION</p>
            </div>
            <nav class="union">          
                <p id="log" @click="Actlog()">Login</p>
                <p>|</p>
                <p id="reg" @click="Actreg()">Register</p>
            </nav> 
        </header>
        
        <div class="contenido">
            <div></div>
            <section>
                <div v-if="mostrar1"><LoginView @escucharLog="Actreg2"/></div>
                <div v-if="mostrar2"><RegistrarseView @escucharReg="Actlog2"/></div>
            </section>
            <div></div>
        </div>

        <footer id="image">@2023</footer>
    </div>
</template>
    
<script>
import LoginView from './LoginView.vue';
import RegistrarseView from './RegistrarseView.vue';


export default{
    name: 'HomeView',
    components: { 
        LoginView,
        RegistrarseView
    },
    
    data(){
        return{
        mostrar1: false,
        mostrar2: false,  
        }
    },
    methods:{
        Actlog(){
            if(this.mostrar1==false){
                this.mostrar2=false;
                this.mostrar1=true;
            }
        },
        Actreg(){
            if(this.mostrar2==false){
                this.mostrar1=false;
                this.mostrar2=true;
            }
            
        },
        Actreg2(value){
            if((this.mostrar2=value)==true){
                this.mostrar1=false;
            }
        },
        Actlog2(value){
            if((this.mostrar1=value)==true){
                this.mostrar2=false;
            }
        }

    }

}

</script>

<style>
#image{
    background-image: url("../assets/banner3.png");
    background-color: transparent;
    width: auto;
}
#p1{
    width: auto;
    position: relative;
    text-align: right;
    font-size: 120%;
}
#p2{
    width: auto;
    position: relative;
    text-align: left;
    font-size: 80%;
    padding-left: 8px;
    padding-top: 1.8%;
}

.contenido{
  display: grid;
  grid-column-gap: .1rem;
  grid-row-gap: .5rem;
  grid-template-columns: 1fr 2fr 1fr;
  grid-auto-rows: 1fr;
  min-height: 70vh;
}
.union{
    display: grid;
    grid-template-columns: 1fr 0.1fr 1fr; 
}
#ajust{
        padding-top: 20px
    }
#log{
    cursor: pointer;
    width:auto;
    text-align: right;
    padding-right: 3px;
}
#reg{
    cursor: pointer;
    width:auto;
    text-align: left;
    padding-left: 3px;
}
#fondo{
    background-image: url("../assets/fondo.jpg");
  opacity: 0.85;
  border-radius: 15px;
  position: relative;

}
</style>

