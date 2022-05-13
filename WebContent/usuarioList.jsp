<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aplicacion Gestion de usuarios</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<header> 
		<nav class="navbar navbar-expand-md navbar-dark" style="background-color: grey">
			<div>
				<a href="#" class="navbar-brand" >Gestion de Usuarios </a>
			</div>
			<ul class="navbar-nav">
			<li><a href="<%=request.getContextPath()%>/list" class="nav-link">Usuarios</a></li>
			</ul>
		</nav>
	</header>
<br>

	<div class="container">
		<h3 class="text-center">Listado de Usuarios</h3>
		<hr>
		<div class="container text-left">
		<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Agregar Nuevo Usuario</a>
		</div>
		<br>
		<table class="table table-border">
		<thead>
			<tr>
				<th>Id</th>
				<th>Nombre</th>
				<th>Email</th>
				<th>Pais</th>
				<th>Acciones</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="usuario" items="${listUsuarios}">
		
			<tr>
			<td>
			
				<c:out value="${usuario.id}"/>
			</td>
			<td>
				<c:out value="${usuario.nombre}"/>
			</td>
			<td>
				<c:out value="${usuario.email}"/>
			</td>
			<td>
				<c:out value="${usuario.pais}"/>
			</td>
			<td>
				<a href="edit?id=<c:out value='${usuario.id}' />" >Editar</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="delete?id=<c:out value='${usuario.id}'/>" >Eliminar</a>
			</td>
			
			
			</tr>
		
		</c:forEach>
		
		
		</tbody>
		</table>
		
		
	</div>

</body>
</html>