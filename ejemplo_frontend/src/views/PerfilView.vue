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
            <nav id="ajust">
                <router-link to="/">Cerrar sesion</router-link>

            </nav>
            <router-view/> 
        </header>
        
        <div class="contenidos">
            <aside>
                <p>{{ msg }}</p>
                <ul>
                    <li @click="evento()"> Inicio</li>
                    <li @click="evento(),event0()">Cargos</li>
                    <li @click="evento(),event1()">Usuarios</li>
                    <li @click="evento(),event2()">Empleados</li>
                    <li @click="evento(),event3()">Clientes</li>
                    <li @click="evento(),event4()">Equipos</li>
                    <li @click="evento(),event5()">Orden de Reparación</li>    
                </ul>

            </aside>
            <section>
                <div v-if="acceder[0]"><CargosView/></div>
                <div v-if="acceder[1]"><UsuariosView/></div>
                <div v-if="acceder[2]"><EmpleadosView/></div>
                <div v-if="acceder[3]"><ClientesView/></div>
                <div v-if="acceder[4]"><EquiposView/></div>
                <div v-if="acceder[5]"><OrdenesRView/></div>     
            </section>
        </div>

        <footer id="image">@2023</footer>
    </div>
</template>

<script>
import CargosView from './CargosView.vue';
import UsuariosView from './UsuariosView.vue';
import EmpleadosView from './EmpleadosView.vue';
import ClientesView from './ClientesView.vue';
import EquiposView from './EquiposView.vue';
import OrdenesRView from './OrdenesRView.vue';

export default{
    data(){
        return{
            msg: "Menu",
            acceder: new Array(5),
        }
    },
    components:{
    OrdenesRView,
    ClientesView,
    EquiposView,
    UsuariosView,
    CargosView,
    EmpleadosView
},
    methods:{
        evento(){
            for ( let i = 0; i < this.acceder.length; i++) {
                this.acceder[i]=false;
            }
            this.msg="Menu"
        },
        event0(){
            this.acceder[0]=true
            this.msg="Cargos"
        },
        event1(){
            this.acceder[1]=true
            this.msg="Usuarios"
        },
        event2(){
            this.acceder[2]=true
            this.msg="Empleados"
        },
        event3(){
            this.acceder[3]=true
            this.msg="Clientes"
        },
        event4(){
            this.acceder[4]=true
            this.msg="Equipos"
        },
        event5(){
            this.acceder[5]=true
            this.msg="Ordenes de reparacion"
        },
    }
}
</script>