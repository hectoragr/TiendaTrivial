
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<div id="productos_query">
    <%
        String driver = "org.gjt.mm.mysql.Driver";
	Class.forName(driver).newInstance();
	Connection con=null;
	ResultSet rst=null;
	Statement stmt=null;
        try{
            String url="jdbc:mysql://localhost:8889/tiendatrivial?user=root&password=root";	
            con=DriverManager.getConnection(url);
            stmt=con.createStatement();
	}catch(Exception e){
            System.out.println(e.getMessage());
        }
        String query="SELECT * FROM Producto WHERE cantidad<5";
        System.out.println(query);
        rst=stmt.executeQuery(query);
        %>
        <table id="tablaProd" border="1" cellspacing="0" cellpadding="5px;">
        <tr><td><b>UPC</b></td><td style="width:100px;"><b>Descripción</b></td><td style="width:75px;"><b>Tipo</b></td><td style="width:60px;"><b>Marca</b></td>
        <td><b>Precio</b></td><td><b>Talla</b></td>
        </tr>
	<%
            while(rst.next()){  
        %>
        <tr><td><%=rst.getString("upc")%></td><td><%=rst.getString("descripcion")%></td><td style="text-align: center;"><%=rst.getString("tipo")%></td><td><%=rst.getString("marca")%></td>
        <td><%=rst.getString("precio")%></td><td><%=rst.getString("talla")%></td>
        </tr>
	<%    
        }%>
        </table>
        <%
        rst.close();
        stmt.close();
        con.close();
	%>
</div>