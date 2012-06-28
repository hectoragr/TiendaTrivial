<%-- 
    Document   : carrito
    Created on : Jun 27, 2012, 8:42:53 PM
    Author     : Erasmo E. Leal
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>-->
        <h2>Carrito</h2>
        <table id="tablaProd" style="color:white; font-size:14px; font-family:console; padding: 5px;">
            <tr>
                <th>UPC</th>
                <th>Descripción</th>
                <th>Tipo</th>
                <th>Marca</th>
                <th>Talla</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Subtotal</th>
                <th></th>
            </tr>
<%
    String idusuario = (String) session.getAttribute("idusuario");
    
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/tiendatrivial", "root", "root");
        Statement stmt = con.createStatement();
        String params = "SELECT idcarrito, Carrito.upc, descripcion, tipo, marca, talla, Carrito.cantidad, precio, (Carrito.cantidad*precio) AS subtotal"+
                " FROM Carrito, Producto WHERE Carrito.upc=Producto.upc AND idusuario='"+idusuario+"'";
        ResultSet resultado = stmt.executeQuery(params);
        while(resultado.next()){%>
            <tr>
                <td><%=resultado.getString("upc")%></td>
                <td style="width: 150px;"><%=resultado.getString("descripcion")%></td>
                <td><%=resultado.getString("tipo")%></td>
                <td style="width:70px;"><%=resultado.getString("marca")%></td>
                <td><%=resultado.getDouble("talla")%></td>
                <td onclick="modificar(this, <%=resultado.getString("idcarrito")%>, <%=resultado.getString("upc")%>)"><%=resultado.getInt("cantidad")%></td>
                <td><%=resultado.getDouble("precio")%></td>
                <td><%=resultado.getDouble("subtotal")%></td>
                <td><input type="button" value="Quitar" onclick="procesar(<%=resultado.getString("upc")%>)" style="width: 70px;"></td>
            </tr>
        <%}%>
        </table>
  <!--  </body>
</html> -->
