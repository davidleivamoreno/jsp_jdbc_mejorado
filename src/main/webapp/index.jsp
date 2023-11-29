<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<br>
<a href="listadoSocios.jsp">Listado de Socios</a>
<br>
<a href="formularioSocio.jsp">Fomulario de Socio Nuevo</a>
<br>
<a href="pideNumeroSocio.jsp">Listado de Socios</a>
<br>
<a href="listadoEntrenamiento.jsp">Listado Entrenamiento </a>
<form method="post" action="detalleSocio.jsp">
    <label >Introduzca ID de Socio</label>
    <input type="text" name="socioID" >
    <input type="submit" value="Enviar">
</form>
</body>
</html>