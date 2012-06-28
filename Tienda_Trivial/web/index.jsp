<%-- 
    Document   : index
    Created on : 21-jun-2012, 16:59:02
    Author     : hectorgomez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Tienda trivial - Inicio</title>
<link rel="stylesheet" type="text/css" href="estilo/agregar.css">
<link rel="stylesheet" type="text/css" href="estilo/style.css">
<script type="text/javascript" src="scripts/modificacion.js"> </script>
<link rel="shortcut icon" href="estilo/favicon.ico">
</head>
<body>
	<div id="navegacion">
	<ul id="nav">
		<li class="current"><a href="index.jsp">Inicio</a></li>
		<li><a href="venta.jsp">Hacer venta</a></li>
		<li><a href="devolucion.jsp">Devoluciones</a></li>
		<li><a href="inventario.jsp">Inventario</a></li>
		<li><a href="reportes.jsp">Reportes</a></li>
		<li><a href="adminusers.jsp">Admin Usuarios</a></li>
	</ul>
	</div>
        <div id="outter-contenido">
            <div id="contenido">
                <div id="text-content">
                    <%@page import="java.sql.*"%>
                    <% 
                    if(session.getAttribute("nivelacceso")!=null){
                        
                    String nombre=(String)session.getAttribute("nombre");
                    String apellido=(String)session.getAttribute("apellido");
                    int nivel=(Integer)session.getAttribute("nivelacceso");
                    if(nivel==1){              
                    %>
                    <jsp:include page="forms/opcionesAdmin.jsp" />
                    <%}else if(nivel==2){%>
                    <jsp:include page="forms/opcionesGerInv.jsp" />
                    <%}else if(nivel==3){%>
                    <h2 style="margin:auto; width:550px;padding-top:20px;">Bienvenido Gerente de Ventas</h2>
                    <%}else if(nivel==4){%>
                    <jsp:include page="forms/opcionesVendedor.jsp" />
                    <%} %>
                    <div id="botonSubmit">
                        <form action="logout">
                            <input type="submit" name="salir" id="salir" value="Salir <%= nombre %> <%=apellido%>" style="width:auto;" />
                        </form>
                    </div>
                    <%
                                      }else{%>
                        <jsp:include page="forms/login.jsp" />             
                        <%
                                      }
                    %>
                </div>
            </div>
        </div>
</body>
</html>