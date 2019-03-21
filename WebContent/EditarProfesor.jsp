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




	<%
		String nom = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String acron = request.getParameter("acronimo");
		String correo = request.getParameter("correo");
		String grupo = request.getParameter("grupo");
		String dedicacion = request.getParameter("dedicacion");
		String plaza = request.getParameter("plaza");
		String[] dedicacionlista = {"1h","2h","3h","4h","5h","6h","7h","8h","9h","10h","11h","12h"};
		
		String id = request.getParameter("id");
	%>

	<h2>Editar docente</h2>

<form action="EditarProfesorServlet">
    
	<input type="hidden" value="<%=id%>" name="id">
    
	<p>Nombre: <input type="text"name="nombre" value="<%=nom%>"></p>

	<p>Apellidos: <input type="text" name="apellidos" value="<%=apellidos%>"></p>
    <p>Acronimo: <input type="text" name="acronimo" value="<%=acron%>"></p>
    <p>Correo: <input type="text" name="correo" value="<%=correo%>"></p>
    
    <p>Grupo de investigación: 
			
    <select name="grupo">
		<c:forEach items="${grupos}" var="grupo">
			<c:choose>
         		<c:when test ="${grupo.nombre} == <%=grupo%>">
					<option value="${grupo.nombre}" selected >${grupo.acronimo}  </option>
         		</c:when>
         
         		<c:otherwise>
            		<option value="${grupo.nombre}"  >${grupo.acronimo} </option>
        		 </c:otherwise>
          	</c:choose>
         </c:forEach>
	</select>
    </p>
    
    <p>Dedicacion: 
			
    <select name="dedicacion">
    <option value="">Seleccionar</option>
		<c:forEach items="<%=dedicacionlista%>" var="dedicacion1">
			<c:choose>
         		<c:when test ="${dedicacion1} == <%=dedicacion%>">
					<option value="${dedicacion1}" selected >${dedicacion1}  </option>
         		</c:when>
         
         		<c:otherwise>
            		<option value="${dedicacion1}"  >${dedicacion1} </option>
        		 </c:otherwise>
          	</c:choose>
         </c:forEach>
	</select>
    </p>
    
    
    
    <p>Plaza: 
			
    <select name="plaza">
		<c:forEach items="${plazas}" var="plaza">
			<c:choose>
         		<c:when test ="${plaza.plaza} == <%=plaza%>">
					<option value="${plaza.id}" selected >${plaza.plaza}  </option>
         		</c:when>
         
         		<c:otherwise>
            		<option value="${plaza.id}"  >${plaza.plaza} </option>
        		 </c:otherwise>
          	</c:choose>
         </c:forEach>
	</select>
    </p>
  

 <input type="submit" value="Editar">

</form>




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
</html>