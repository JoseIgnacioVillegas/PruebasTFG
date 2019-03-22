<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style>
html {
  min-height: 100%;
  position: relative;
}
body {
  margin: 0;
  margin-bottom: 40px;
}
footer {
  background-color: black;
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 200px;
  color: white;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Gestion de departamento</title>
<link rel="icon" type="image/gif" href="./img/ditupm.gif"/>
</head>



<body id="myPage">


<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align">
  
  <form action="VistaInicial.jsp"><button class="w3-bar-item w3-button w3-teal"><i class="fa fa-home w3-margin-right"></i>Inicio</button></form>
  

  <shiro:hasRole name="profesor">
  <form action="ProfesorServlet"><button class="w3-bar-item w3-button w3-hide-small w3-hover-white">Profesor</button></form>
  </shiro:hasRole>
  
  <shiro:hasRole name="coordinador">
  <form action="CoordinadorServlet"><button class="w3-bar-item w3-button w3-hide-small w3-hover-white">Coordinador</button></form>
  </shiro:hasRole>

   <shiro:hasAnyRoles name="administrador,gestiondocencia,gestionusuarios,gestiondatos">
  
  <form action="PasoGestorServlet"><button class="w3-bar-item w3-button w3-hide-small w3-hover-white">Gestor</button></form>
  
  </shiro:hasAnyRoles>
  
  <form action="LogoutServlet"><button class="w3-bar-item w3-button w3-hide-small w3-hover-white w3-right">Logout</button></form>
 </div>
</div>






<!-- Team Container -->
<div class="w3-container w3-padding-64 w3-center" id="team">
<br>
<h1>Bienvenido a la aplicación web para la gestión del</h1>
<h1>Departamento de Ingeniería de Sistemas Telemáticos</h1>

<p>${usuario.nombre }</p>
<p style="color:#FF0000">${mensaje}</p>
</div>


<div class="w3-display-container w3-animate-opacity" style="text-align:center;">
  <img src="./img/ditupm.gif" alt="icono" style="width:20%;height:20%;" >
</div>




<!-- Footer -->
<footer class="w3-padding-32 w3-center" >
  <h4>Enlaces de interés</h4>
  <a class="w3-button w3-large w3-teal" href="https://www.dit.upm.es/" title="DIT"><img src="./img/ditupm.gif" style="width:30px;height:30px;"></a>
  <a class="w3-button w3-large w3-teal" href="http://www.etsit.upm.es/" title="ETSIT"><img src="./img/etsit.gif" style="width:30px;height:30px;"></a>
  <a class="w3-button w3-large w3-teal" href="https://moodle.upm.es/" title="MOODLE"><img src="./img/moodle.gif" style="width:30px;height:30px;"></a>
  <a class="w3-button w3-large w3-teal" href="http://www.upm.es/" title="UPM"><img src="./img/upm.gif" style="width:30px;height:30px;"></a>
  <p>TFG Gestión docente - 2019</p>
  <!--  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>  -->
</footer>

</body>
</html>
