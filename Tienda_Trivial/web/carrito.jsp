<%-- 
    Document   : carrito
    Created on : Jun 27, 2012, 8:42:53 PM
    Author     : Erasmo E. Leal
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="scripts/modificacion.js"></script>
    </head>
    <body>
        <h2>Carrito</h2>
        <table>
            <tr>
                <th>upc</th>
                <th>descripcion</th>
                <th>tipo</th>
                <th>marca</th>
                <th>talla</th>
                <th>cantidad</th>
                <th>precio</th>
                <th>subtotal</th>
                <th></th>
            </tr>
<%
    String idusuario = (String) session.getAttribute("idusuario");
    
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tiendatrivial", "root", "");
        Statement stmt = con.createStatement();
        String params = "SELECT idcarrito, Carrito.upc, descripcion, tipo, marca, talla, Carrito.cantidad, precio, (Carrito.cantidad*precio) AS subtotal"+
                " FROM Carrito, Producto WHERE Carrito.upc=Producto.upc AND idusuario='"+idusuario+"'";
        ResultSet resultado = stmt.executeQuery(params);
        while(resultado.next()){%>
            <tr>
                <td><%=resultado.getString("upc")%></td>
                <td><%=resultado.getString("descripcion")%></td>
                <td><%=resultado.getString("tipo")%></td>
                <td><%=resultado.getString("marca")%></td>
                <td><%=resultado.getDouble("talla")%></td>
                <td onclick="modificar(this, <%=resultado.getString("idcarrito")%>, <%=resultado.getString("upc")%>)"><%=resultado.getInt("cantidad")%></td>
                <td><%=resultado.getDouble("precio")%></td>
                <td><%=resultado.getDouble("subtotal")%></td>
                <td><input type="button" value="Quitar" onclick="procesar(<%=resultado.getString("upc")%>)"></td>
            </tr>
        <%}%>
        </table>
        <input type="button" value="Realizar Compra" onclick="comprar(0)" />
        <input type="button" value="Cancelar Compra" onclick="comprar(1)" />
    </body>
</html>
