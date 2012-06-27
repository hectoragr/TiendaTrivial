<%-- 
    Document   : reporteCategoria
    Created on : Jun 27, 2012, 12:27:14 AM
    Author     : Erasmo E. Leal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tiendatrivial", "root", "");
        Statement stmt = con.createStatement();
        String tipo = (String) request.getParameter("tipo");
        
        ResultSet resultado;
        String parametros = "SELECT upc, descripcion, precio, cantidad, tipo FROM Producto WHERE tipo='"
                + tipo + "'";
        resultado = stmt.executeQuery(parametros);
        %>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
            <th>upc</th>
            <th>descrpicion</th>
            <th>precio</th>
            <th>cantidad</th>
            <th>tipo</th>
            </tr>
            <%
        while(resultado.next()){
            %>
            <tr>
                <td><%=resultado.getString("upc")%></td>
                <td><%=resultado.getString("descripcion")%></td>
                <td><%=resultado.getDouble("precio")%></td>
                <td><%=resultado.getInt("cantidad")%></td>
                <td><%=resultado.getString("tipo")%></td>
            </tr>
            <%
        }
%>
        </table>
    </body>
</html>
