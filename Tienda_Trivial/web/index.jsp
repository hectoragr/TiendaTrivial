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
<link rel="stylesheet" type="text/css" href="estilo/agregar.css"/>
<link rel="stylesheet" type="text/css" href="estilo/style.css"/>
<link rel="shortcut icon" href="estilo/favicon.ico">
<script type="text/javascript">
   <%/* session.setAttribute("nivel",4);*/%>
    var conectado=<%=session.getAttribute("nivelacceso")%>;
    var x=document.getElementById('text-content');
    function cargarHTMLUsuario(usuario){
        var x=document.getElementById('text-content');
        switch (parseInt(usuario)){
            case 4: x.innerHTML="<H1>Eres un vendedor</H1>"; break;
            case 3: x.innerHTML="<H1>Eres un gerente de ventas</H1>"; break;
            case 2: x.innerHTML="<H1>Eres un gerente de inventario</H1>"; break;
            case 1: x.innerHTML="<H1>Eres un admin</H1>"; break;
            default: break;
        }
    }
    function ahah(url, target) {
  document.getElementById(target).innerHTML = ' Fetching data...';
  if (window.XMLHttpRequest) {
    req = new XMLHttpRequest();
  } else if (window.ActiveXObject) {
    req = new ActiveXObject("Microsoft.XMLHTTP");
  }
  if (req != undefined) {
    req.onreadystatechange = function() {ahahDone(url, target);};
    req.open("GET", url, true);
    req.send("");
  }
}  

function ahahDone(url, target) {
  if (req.readyState == 4) { // only if req is "loaded"
    if (req.status == 200) { // only if "OK"
      document.getElementById(target).innerHTML = req.responseText;
    } else {
      document.getElementById(target).innerHTML=" AHAH Error:\n"+ req.status + "\n" +req.statusText;
    }
  }
}

function load(name, div) {
	ahah(name,div);
	return false;
}
</script>
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
                    <form id="formaLogin" name="formaLogin" method="post" action="login" style="width:220px; display:block;">
                        <span>Usuario:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="usuarioLog" name="usuarioLog"/><br/>
                        <span>Contraseña:</span>&nbsp;<input type="password" name="passLog"/><br/>
                        <span style="font-size:9px; margin-left: auto; margin-right:auto; text-align: center;"><a href="mailto:admin@example.org">¿Olvidaste tu contraseña o login?</a></span><br/>
                        <input type="submit" value="Iniciar sesión"/>
                    </form>
                </div>
            </div>
        </div>
    <script>cargarHTMLUsuario(conectado);</script>
</body>
</html>