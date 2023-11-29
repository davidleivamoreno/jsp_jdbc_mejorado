<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h2>Introduzca los datos del nuevo socio:</h2>
<form method="get" action="grabaEntrenamiento.jsp">
    entrenadorID <input type="text" name="entrenador"/></br>
    nombreentrenador <input type="text" name="nombre"/></br>
    tipoentrenamiento <input type="text" name="tipo"/></br>
    ubicacion <input type="text" name="ubicacion"/></br>
    fecha <input type="text" name="fecha"/></br>
    <input type="submit" value="Aceptar">
</form>
</body>
<%
    String error =(String) session.getAttribute("error");
    if(error!=null){
%>
<span style="color:red; background:yellow"><%= error %> </span>
<%
        session.removeAttribute("error");
    }
%>
</html>