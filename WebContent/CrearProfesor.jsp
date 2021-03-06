<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<!-- En este archivo .jsp esta definido el menu principal y la barra lateral -->
<%@ include file="menu.jsp" %> 




<!-- Team Container -->

<div class="w3-container w3-padding-64 w3-center" id="team">
	<p style="color:#FF0000";>${mensaje}</p>
	<h2>Crear Docente</h2>


	<p name="mensaje"></p>
	<div class="w3-row"><br>

		
		<form action="CrearProfesorServlet">
			
			<p>Nombre: <input type="text"name="nombre"></p>
			<p>Apellidos: <input type="text"name="apellidos"></p>
			<p>Acrónimo: <input type="text"name="acronimo"></p>
			<p>Correo: <input type="text"name="correo"></p>
			
			<p>Selecciona el grupo de investigación al que pertenece: 
		
<select name="grupo"id="grupo">
		<option value="" selected>Seleccionar</option>
		<c:forEach items="${grupos}" var="grupo">
			<option value="${grupo.nombre}">${grupo.acronimo}</option>

		</c:forEach>
</select></p>
<p>Selecciona la dedicación: 
	<select name="dedicacion" id="dedicacion">
		<option value="" selected>Seleccionar</option>
		<option value="1h">1h</option>
		<option value="2h">2h</option>
		<option value="3h">3h</option>
		<option value="4h">4h</option>
		<option value="5h">5h</option>
		<option value="6h">6h</option>
		<option value="7h">7h</option>
		<option value="8h">8h</option>
		<option value="9h">9h</option>
		<option value="10h">10h</option>
		<option value="11h">11h</option>
		<option value="12h">12h</option>
	</select></p>
	
	
	
	<p>Selecciona el tipo de plaza: 
	<select name="plaza" id="plaza">
	<option value="" selected>Seleccionar</option>
		<c:forEach items="${plazas}" var="plaza">
			<option value="${plaza.id}"> ${plaza.plaza} </option>

		</c:forEach>
</select></p>

	<p> Selecciona los permisos que le quieres dar a este profesor</p>
		<c:forEach items="${permisos}" var="permiso">
			${permiso.permiso} <input type="checkbox" value="${permiso.id}"> <br>
		</c:forEach>
		<br>
			<input type="submit" value="Crear">
		</form>
		
		
		
		
		
		
		
		
	
	</div>
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

<script>


function desplegarMenu(obj){ 	
   	if(obj.value == "gestUsuarios" && document.getElementById('gestUsuarios').style.display=="none" )	{
   		document.getElementById('gestUsuarios').style.display="";
   	}else if(obj.value == "gestUsuarios" && document.getElementById('gestUsuarios').style.display==""){
		document.getElementById('gestUsuarios').style.display="none";
   	}
   	
	if(obj.value == "gestDocencia" && document.getElementById('gestDocencia').style.display=="none"){
		document.getElementById('gestDocencia').style.display="";
   	}else if(obj.value == "gestDocencia" && document.getElementById('gestDocencia').style.display==""){
   		document.getElementById('gestDocencia').style.display="none";
   	}
} 


</script>


</body>

</html>