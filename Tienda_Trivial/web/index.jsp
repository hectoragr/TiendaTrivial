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
<link rel="stylesheet" type="text/css" href="estilo/style.css"/>
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
                    <p style="font-size:2em;">Bienvenido al sistema de Tienda Trivial</p>
                    <p><span class="firstLetter">I</span>nicia sesión para poder acceder a las diferentes
                    herramientas.</p>
                    <form id="formaLogin" style="width:220px; display:block;">
                        <span>Usuario:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="usuarioLog"/><br/>
                        <span>Contraseña:</span>&nbsp;<input type="password" name="passLog"/><br/>
                        <span style="font-size:9px; margin-left: auto; margin-right:auto; text-align: center;"><a href="mailto:admin@example.org">¿Olvidaste tu contraseña o login?</a></span><br/>
                        <input type="button" action="validarLog" value="Iniciar sesión"/>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>