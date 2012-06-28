<%-- 
    Document   : agregarCarrito
    Created on : Jun 27, 2012, 5:30:35 PM
    Author     : Erasmo E. Leal
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String upc = request.getParameter("upc");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            String idusuario = (String) session.getAttribute("idusuario");
            System.out.println(idusuario);
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/tiendatrivial", "root", "root");
            Statement stmt = con.createStatement();
            String params = "SELECT * FROM Carrito WHERE idusuario='" + idusuario + "'";
            ResultSet resultado = stmt.executeQuery(params);
            String idcarrito;
            if (resultado.next()) {
                idcarrito = resultado.getString("idcarrito");
                params += " AND upc='" + upc + "'";
                resultado = stmt.executeQuery(params);
                if (resultado.next()) {
                    int cantidadexistente = resultado.getInt("cantidad");
                    params = "UPDATE Carrito SET cantidad="
                            + (cantidadexistente + cantidad) + " WHERE idcarrito='" + idcarrito + "' AND upc='" + upc + "'";
                    if (stmt.executeUpdate(params) == 1) {%>
        <h1>Actualizaci&oacute;n exitosa</h1>
        <jsp:include page="carrito.jsp"/>
        <%                    } else {%>
        <h1>Error</h1>
        <%                            }
        } else {
            params = "INSERT INTO Carrito VALUES ('" + idcarrito + "', '" + upc + "', '" + idusuario + "', " + cantidad + ")";
                            if (stmt.executeUpdate(params) == 1) {%>
        <h1>Inserci&oacute;n exitosa</h1>
        <jsp:include page="carrito.jsp"/>
        <%                    } else {%>
        <h1>Error</h1>
        <%                                }

            }
        } else {
            params = "SELECT MAX(idcarrito) FROM Carrito";
            resultado = stmt.executeQuery(params);
            resultado.next();
            idcarrito = "" + (resultado.getInt(1) + 1);

            params = "INSERT INTO Carrito VALUES ('" + idcarrito + "', '" + upc + "', '" + idusuario + "', " + cantidad + ")";
                            if (stmt.executeUpdate(params) == 1) {%>
        <h1>Inserci&oacute;n exitosa</h1>
        <jsp:include page="carrito.jsp"/>
        <%         } else {%>
        <h1>Error</h1>
        <%                 }
            }
        %>


    </body>
</html>
