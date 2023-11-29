<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detalle Socio</title>
</head>
<body>
<h1>Detalle Socio</h1>
<%

    //CÓDIGO DE VALIDACIÓN
    boolean valida = true;
    int socioID = -1;
    try {
        socioID = Integer.parseInt(request.getParameter("socioID"));
    } catch (Exception ex) {
        ex.printStackTrace();
        valida = false;
    }
    //FIN CÓDIGO DE VALIDACIÓN

    if (valida) {

        //CARGA DEL DRIVER Y PREPARACIÓN DE LA CONEXIÓN CON LA BBDD
        //						v---------UTILIZAMOS LA VERSIÓN MODERNA DE LLAMADA AL DRIVER, no deprecado
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "user", "user");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            //CARGA DEL DRIVER Y PREPARACIÓN DE LA CONEXIÓN CON LA BBDD
            //						v---------UTILIZAMOS LA VERSIÓN MODERNA DE LLAMADA AL DRIVER, no deprecado
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "user", "user");


//>>>>>>NO UTILIZAR STATEMENT EN QUERIES PARAMETRIZADAS
//       Statement s = conexion.createStatement();
//       String insercion = "INSERT INTO socio VALUES (" + Integer.valueOf(request.getParameter("numero"))
//                          + ", '" + request.getParameter("nombre")
//                          + "', " + Integer.valueOf(request.getParameter("estatura"))
//                          + ", " + Integer.valueOf(request.getParameter("edad"))
//                          + ", '" + request.getParameter("localidad") + "')";
//       s.execute(insercion);
//<<<<<<

            //
            String sql = "SELECT * FROM socio WHERE socioID = ?"; //socioID

            ps = conn.prepareStatement(sql);
            //int idx = 1;
            //ps.setInt(idx++, socioID);
            ps.setInt(1, socioID);


            rs = ps.executeQuery();

            if (rs.next()) {

                int numSocio = rs.getInt("socioID");
                String nombre = rs.getString("nombre");
                int estatura = rs.getInt("estatura");
                int edad = rs.getInt("edad");
                String localidad = rs.getString("localidad");

                //System.out.println();

%>

<table>
    <tr>
        <td>
            SocioID
        </td>
        <td>
            <%= numSocio%>
        </td>
    </tr>
    <tr>
        <td>
            Nombre
        </td>
        <td>
            <%= nombre%>
        </td>
    </tr>
</table>


<%

} else {

%>
<span>No existe socio con id <%=socioID %></span>
<%
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            //BLOQUE FINALLY PARA CERRAR LA CONEXIÓN CON PROTECCIÓN DE try-catch
            //SIEMPRE HAY QUE CERRAR LOS ELEMENTOS DE LA  CONEXIÓN DESPUÉS DE UTILIZARLOS
            try { rs.close(); } catch (Exception e) { /* Ignored */ }
            try {
                ps.close();
            } catch (Exception e) { /* Ignored */ }
            try {
                conn.close();
            } catch (Exception e) { /* Ignored */ }
        }


    } else {
        //NO HAY VALIDACIÓN
        out.println("Error de validación!");
    }

%>
</body>
</html>