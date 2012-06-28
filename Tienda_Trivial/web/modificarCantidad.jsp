<%-- 
    Document   : modificarCantidad
    Created on : Jun 28, 2012, 1:59:14 AM
    Author     : Erasmo E. Leal
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String idcarrito=request.getParameter("idcarrito");
   String upc=request.getParameter("upc");
   int cantidad=Integer.parseInt(request.getParameter("cantidad"));
   Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/tiendatrivial", "root", "root");
    Statement stmt = con.createStatement();
    String params = "UPDATE Carrito SET cantidad="+cantidad+" WHERE idcarrito='"+idcarrito+"' AND upc='"+upc+"'";
    if(stmt.executeUpdate(params)==1){
        params = "SELECT (precio*Carrito.cantidad) AS subtotal FROM Carrito, Producto "+
                "WHERE Carrito.upc=Producto.upc AND idcarrito='"+idcarrito+"' AND Carrito.upc='"+upc+"'";
        ResultSet resultado = stmt.executeQuery(params);
        resultado.next();
        out.println(resultado.getDouble(1));
    }%>