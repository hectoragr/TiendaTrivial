<%-- 
    Document   : venta
    Created on : 21-jun-2012, 17:17:15
    Author     : hectorgomez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Tienda trivial - Venta</title>
<link rel="stylesheet" type="text/css" href="estilo/style.css"/>
<link rel="shortcut icon" href="estilo/favicon.ico">
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
                <form>
                    <br/>
                    <br/>
                    <div class="search_options">
                    <label>UPC:<input type="text" name="venta_upc"/></label>
                    <label>Marca: <select name="venta_marca" id="marca">
                        <option value="escoger" style="margin-left:auto; margin-right:auto;">- Marca -</option>
                                <option value="aldoConti">Aldo Conti</option>
                                <option value="caterpillar">Caterpillar</option>
                                <option value="crocs">Crocs</option>
                                <option value="dione">Dione</option>
                                <option value="guess">Guess</option>
                                <option value="lacoste">Lacoste</option>
                                <option value="nike">Nike</option>
                                <option value="nineWest">Nine West</option>
                                <option value="puma">Puma</option>
                                <option value="tommyHilfiger">Tommy Hilfiger</option>
                            </select></label>
                    <label>Tipo: <select name="venta_tipo">
                        <option style="text-align:center;">- Tipo -</option>
                        <option>Tenis</option>
                        <option>Zapato</option>
                        <option>Sandalias</option>
                    </select></label>
                    <label>Talla: <select name="venta_talla">
                        <option style="text-align:center;">- Talla -</option>
                        <option>3</option>
                        <option>3 1/2</option>
                        <option>4</option>
                        <option>4 1/2</option>
                        <option>5</option>
                        <option>5 1/2</option>
                        <option>6</option>
                        <option>6 1/2</option>
                        <option>7</option>
                        <option>7 1/2</option>
                        <option>8</option>
                        <option>8 1/2</option>
                        <option>9</option>
                        <option>9 1/2</option>
                        <option>10</option>
                    </select></label>
                </form>
                </div>
                <div id="botonSubmit">
                    <input type="submit" name="buscarProd" id="buscarInventario" value="Buscar" style="width:auto;" />
                </div>
                <br/>
                <div id="productos_query">
                    <h1 style="color:black;">Aquí saldrían los productos para vender</h1>        
                </div>
                </div>
            </div>
        </div>
</body>
</html>