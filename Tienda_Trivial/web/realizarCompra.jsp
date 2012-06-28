<%-- 
    Document   : realizarCompra
    Created on : Jun 27, 2012, 8:42:53 PM
    Author     : Erasmo E. Leal
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head><title></title></head>
    <body>
<%
    String idusuario = (String) session.getAttribute("idusuario");
    String idcliente = request.getParameter("idcliente");
    int cancelar = Integer.parseInt(request.getParameter("cancelar"));
    
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tiendatrivial", "root", "");
        Statement stmt = con.createStatement();
        String parameters= "SELECT MAX(idventa) FROM Venta";
        ResultSet res = stmt.executeQuery(parameters);
        res.next();
        int idventa = res.getInt(1)+1;
        String params = "SELECT idcarrito, Carrito.upc, descripcion, tipo, marca, talla, Carrito.cantidad, precio, (Carrito.cantidad*precio) AS subtotal"+
                " FROM Carrito, Producto WHERE Carrito.upc=Producto.upc AND idusuario='"+idusuario+"'";
        ResultSet resultado = stmt.executeQuery(params);
        Statement stmt2 = con.createStatement();
        while(resultado.next()){
            System.out.println(idventa+" "+idcliente+" "+idusuario);
            String upc = resultado.getString("upc");
            int cantidad = resultado.getInt("cantidad");
            parameters = "INSERT INTO Venta VALUE ('"+idventa+"', '"+idcliente+"', '"+upc+"', '"+
                                idusuario+"', "+cantidad+", CURDATE(), CURTIME(), "+cancelar+")";
            stmt2.executeUpdate(parameters);
            if(cancelar==0){
            parameters = "UPDATE Producto SET cantidad= cantidad - "+cantidad+" WHERE upc='"+upc+"'";
            stmt2.executeUpdate(parameters);
                       }
            }
            parameters = "DELETE FROM Carrito WHERE idusuario='"+idusuario+"'";
            stmt2.executeUpdate(parameters);
            if(cancelar==0){
            %>
            <h2>Compra Realizada</h2>
            <%} else {%>
            <h2>Cancelacion Realizada</h2>
            <% } %>
    </body>
</html>
