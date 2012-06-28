<%-- 
    Document   : removerCarrito
    Created on : Jun 27, 2012, 10:51:47 PM
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
            String idusuario = (String) session.getAttribute("idusuario");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/tiendatrivial", "root", "root");
            Statement stmt = con.createStatement();
            String params = "DELETE FROM Carrito WHERE idusuario='"+idusuario+"' AND upc='"+upc+"'";
            if(stmt.executeUpdate(params)==1){%>
                <h1>Borrado Exitoso</h1>
                <jsp:include page="carrito.jsp"/>
            <%} else {%>
            <h1>Error</h1>
        <%} %>
    </body>
</html>
