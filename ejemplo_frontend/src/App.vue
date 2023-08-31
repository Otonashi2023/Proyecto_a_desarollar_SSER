<template>
  <router-view/>
</template>

<!--CSS de todo el proyecto se encuentra aqui-->
<style>
body{
  max-width: 1246px;
  font-family: Arial, sans-serif;
  background-color: #2b0f79;
  margin: auto;
  padding: 1%;
}
.cuerpo{
  background-color: #3a14a2;
  margin: auto;
  padding: 1%;

}
header{
  border-radius: 15px;
  display: grid;
  grid-template-columns: 1fr 4fr 1fr;
}

.titulo{
  display: grid;
  grid-template-columns: 1fr 2.5fr;
}

header img{
  padding-top: 8px;
  max-height:50px;

}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  font-weight: bold;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: white;
}

nav {
  padding-right: 5px;
  padding-top: 5px;
  text-decoration: underline;
  }

nav a {
  font-weight: bold;
  color: white;
}

nav a.router-link-exact-active {
  color: #0CA502;
}
.contenidos{
  display: grid;
  grid-column-gap: .1rem;
  grid-row-gap: .5rem;
  grid-template-columns: 1fr 5fr;
  grid-auto-rows: 1fr;
  min-height: 70vh;
}

aside{
  min-width: 100px;
  margin: 1%;
  padding: 1%;
  text-align: center;
}
aside ul{
  zoom:90%;
  list-style-type: none;
  cursor: pointer;
  margin:0%;
  padding: 0%;
  text-decoration: none;
  color: black;
}

aside ul li{
  border: solid rgb(166, 191, 249);
  border-radius: 10px;
  background-color:#ddd;
  margin:1.5%;
  padding: 2%;
}

aside ul li:hover{
  background-color: #1b0d69;
  color: white;
}

section{
  margin-top: 1%;
  padding: 1%;
}

.Home{
  zoom: 80%;
  display: inline-block;
  position:relative;
  color: #2b0f79;
  margin-left: 1rem;
  margin-right: 1rem;
}

.components{
  display: grid;
  grid-gap: 1rem;
  grid-template-columns: 1fr 2.5fr;
  zoom: 95%;
}

.container{
  border-radius: 15px;
  box-shadow: 0 0 10px rgba(76, 92, 164, 1);
  background-color: rgb(250, 250, 250);
  padding-left: 1rem;
  padding-right: 1rem;
}
#form{
  width: 340px;
  height: 700px;
}
 
h1 {
  text-align: center;
  margin-bottom: 20px;
}

.form-group {
  display: grid;
  grid-template-columns: 1fr 2fr;
  margin-bottom: 10px;
  grid-gap: 10px;
}

label {
  display: block;
  font-weight: bold;
  text-align: right;
  padding: 5px;
}

input{
  padding: 5px;
  margin-right: 50px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

button{
  display: block;
  padding: 8px;
  margin-bottom: 20px;
  margin-left: 30%;
  margin-right: 30%;
  background-color: #5318c1;
  border-radius: 5px;
  color:white;
  border: none;
  width: 40%;
  cursor: pointer;  
}

button:hover {
  background-color: #7741da;
  box-shadow: 3px 3px rgba(0, 0, 0, 0.6);

}

table{
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 20px;
}

th, td{
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

thead{
  background-color: #5f0df7;
  color: white;
  
}

tr:hover td:nth-of-type(1n+1) {
  background-color: #f5f5f5;
}

#scroll{
  margin-bottom: 0;
  overflow-x: auto;
  overflow-y: auto;
  max-height:700px;
  min-width: 670px;
  white-space: nowrap;
}
#ancho{
  white-space: break-spaces;
}
#fila{
  cursor:pointer;
}

footer{
  border-radius: 15px;
  text-align: center;
  padding: 1%;
  margin: 1%;
  width: auto;
}
.modal{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-70%,-60%);
  background: rgb(10, 10, 10);
  padding: 20px; 
  border-radius: 15px;
  box-shadow: 5px 5px rgba(0, 0, 0, 0.4);
  z-index: 102;
  color: rgb(10, 180, 10);
  max-width: 900px;
  max-height: 740px;
}

.modal-overlay{
  position: absolute;
  top: 0;
  left:0;
  bottom: 0;
  right: 0;
  z-index: 101;
  background: rgba(0,0,0,0.4);
}
.boton:hover{
  box-shadow: 4px 4px rgba(255, 255, 255, 0.4)
}

.boton{
  margin-left: 285px;
  width: 100px;
}
</style>
