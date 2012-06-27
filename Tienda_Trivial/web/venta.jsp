<%-- 
    Document   : venta
    Created on : 21-jun-2012, 17:17:15
    Author     : hectorgomez
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Tienda trivial - Venta</title>
<!--<link rel="stylesheet" type="text/css" href="estilo/agregar.css"/>-->
<link rel="stylesheet" type="text/css" href="estilo/style.css"/>
<link rel="shortcut icon" href="estilo/favicon.ico">
<script type="text/javascript">
    function pedir(upc){
        var cantidad=prompt("¿Cuántos articulos del producto "+upc,"");
        alert("Quiere "+cantidad+" del producto del UPC: "+upc);
    }
</script>
</head>
<body>
	<div id="navegacion">
	<ul id="nav">
		<li><a href="index.jsp">Inicio</a></li>
		<li class="current"><a href="venta.jsp">Hacer venta</a></li>
		<li><a href="devolucion.jsp">Devoluciones</a></li>
		<li><a href="inventario.jsp">Inventario</a></li>
		<li><a href="reportes.jsp">Reportes</a></li>
		<li><a href="adminusers.jsp">Admin Usuarios</a></li>
	</ul>
	</div>
        <div id="outter-contenido">
            <div id="contenido">
                <div id="text-content">
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
           %>
          <form method="post" action="venta.jsp">
                    <br/>
                    <br/>
                    <div class="search_options">
                    <label>UPC:<input type="text" name="upc" style="width:100px;"/></label>
                    <label>Marca: <select name="marca" id="marca">
                        <option value="" style="margin-left:auto; margin-right:auto;">- Marca -</option>
                                <option value="Aldo Conti">Aldo Conti</option>
                                <option value="Caterpillar">Caterpillar</option>
                                <option value="Crocs">Crocs</option>
                                <option value="Dione">Dione</option>
                                <option value="Guess">Guess</option>
                                <option value="Lacoste">Lacoste</option>
                                <option value="Nike">Nike</option>
                                <option value="Nine West">Nine West</option>
                                <option value="Puma">Puma</option>
                                <option value="Tommy Hilfiger">Tommy Hilfiger</option>
                        </select></label>
                    <label>Tipo: <select name="tipo">
                        <option style="text-align:center;" value="">- Tipo -</option>
                        <option value="Tenis">Tenis</option>
                        <option value="Zapato">Zapato</option>
                        <option value="Sandalia">Sandalias</option>
                    </select></label>
                    <label>Talla: <select name="talla">
                        <option style="text-align:center;" value="">- Talla -</option>
                        <option value="3">3</option>
                        <option value="3.5">3 1/2</option>
                        <option value="4">4</option>
                        <option value="4.5">4 1/2</option>
                        <option value="5">5</option>
                        <option value="5.5">5 1/2</option>
                        <option value="6">6</option>
                        <option value="6.5">6 1/2</option>
                        <option value="7">7</option>
                        <option value="7.5">7 1/2</option>
                        <option value="8">8</option>
                        <option value="8.5">8 1/2</option>
                        <option value="9">9</option>
                        <option value="9.5">9 1/2</option>
                        <option value="10">10</option>
                    </select></label>
                    </div>
                    <div id="botonSubmit">
                    <input type="submit" name="buscarInventario" id="buscarInventario" value="Buscar" style="width:auto;" />
                    </div>
                </form>
               
                <br/>
                <div id="productos_query">
                <%
                if(request.getParameter("buscarInventario")!=null){
                System.out.println("Llego a los parametros");
                String busUpc,busDes,busMarca,busTipo,busFoto;
                String queryProd="SELECT upc, cantidad,descripcion,tipo,marca,talla,precio,foto FROM Producto";
                busDes=busUpc=busMarca=busTipo=busFoto="";
                int busCantidad,params;
                busCantidad=params=0;
                double busTalla,busCosto,busPrecio;
                busTalla=busCosto=busPrecio=0.0;
                
                if(!request.getParameter("upc").equals("")){
                    busUpc = (String)request.getParameter("upc");
                    if(params<1){
                        queryProd+=" WHERE upc='"+busUpc+"'";
                    }else{

                    }
                    params++;
                }
                
                if(!request.getParameter("marca").equals("")){
                    busMarca = request.getParameter("marca");
                    if(params<1){
                        queryProd+=" WHERE marca='"+busMarca+"'";
                    }else{
                    queryProd+=" AND marca='"+busMarca+"'";
                    }
                    params++;
                }
                
                if(!request.getParameter("talla").equals("")){
                    busTalla = Double.parseDouble(request.getParameter("talla"));
                    if(params<1){
                        queryProd+=" WHERE talla="+busTalla;
                    }else{
                    queryProd+=" AND talla="+busTalla;
                    }
                    params++;
                }
                
                if(!request.getParameter("tipo").equals("")){
                    busTipo = request.getParameter("tipo");
                    if(params<1){
                        queryProd+=" WHERE tipo='"+busTipo+"'";
                    }else{
                    queryProd+=" AND tipo='"+busTipo+"'";
                    }
                    params++;
                }
                rst=stmt.executeQuery(queryProd);
                %>
                <table id="tablaProd" border="1" cellspacing="0" cellpadding="5px;">
      
                   <tr><td><b>UPC</b></td><td style="width:100px;"><b>Descripción</b></td><td style="width:75px;"><b>Tipo</b></td><td style="width:60px;"><b>Marca</b></td>
                       <td><b>Precio</b></td><td><b>Talla</b></td><td><b>Cantidad</b></td>
                   </tr>
	  <%
			while(rst.next()){  
          %>
                    <tr><td onclick="pedir(<%=rst.getString("upc")%>)"><%=rst.getString("upc")%></td><td><%=rst.getString("descripcion")%></td><td style="text-align: center;"><%=rst.getString("tipo")%></td><td><%=rst.getString("marca")%></td>
                        <td><%=rst.getString("precio")%></td><td><%=rst.getString("talla")%></td><td><%=rst.getString("cantidad")%></td><td><a href="agregarCarrito?upc=<%=rst.getString("upc")%>&cantidad=<%=rst.getString("cantidad")%>">Agregar</a>
                   </tr>
	  <%    
			}
      
             rst.close();
             stmt.close();
             con.close();
           }
		%>
                </table>
                  <!--  <h1 style="color:black;">Aquí saldrían los productos disponibles, agotados o por agotarse</h1> -->       
                </div>
                </div>
            </div>
        </div>
</body>
</html>