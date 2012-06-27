<%-- 
    Document   : devolucion
    Created on : 21-jun-2012, 17:18:26
    Author     : hectorgomez
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!

%>
<!DOCTYPE html>
<html>
<head>
<title>Tienda trivial - Devoluciones</title>
<link rel="stylesheet" type="text/css" href="estilo/style.css"/>
<link rel="shortcut icon" href="estilo/favicon.ico">
</head>
<body>
    <script type="text/javascript">
	var bisiesto=0;
        var l_anho=0;
        var l_mes=0;
        function llenarMes(){
            var htmlMes="<option>- Mes -</option>";
            for(var i=1;i<=12;i++){
                htmlMes+="<option value="+i+">"+numMes(i)+"</option>";
            }
            document.getElementById("devolucion_mes").innerHTML = htmlMes;
        }
        function numMes(i){
            switch (i){
                case 1: return "Enero"; break;
                case 2: return "Febrero"; break;
                case 3: return "Marzo"; break;
                case 4: return "Abril"; break;
                case 5: return "Mayo"; break;
                case 6: return "Junio"; break;
                case 7: return "Julio"; break;
                case 8: return "Agosto"; break;
                case 9: return "Septiembre"; break;
                case 10: return "Octubre"; break;
                case 11: return "Noviembre"; break;
                default: return "Diciembre"; break;
            }
        }
        
	function ajustarFeb(anho){
		l_anho=anho;
                if (anho % 4 != 0) {
    		bisiesto=0;
  		} else if (anho % 400 == 0) {
    		bisiesto=1;
  		} else if (anho % 100 == 0) {
    		bisiesto=0;
  		} else {
    		bisiesto=1;
  		}
	}
        
	function llenarDias(mes){
        l_mes=mes;
        ajustarFeb(l_anho);
	var i=1;
	var top=0;
	var dias_txt="<option> - D&iacute;a - </option>";
	if ((mes==1)||(mes==3)||(mes==5)||(mes==7)||(mes==8)||(mes==10)||(mes==12)){
		top=31;
	}else if((mes==2)&&(bisiesto==1)){
		top=29;
	}else if((mes==2)&&(bisiesto==0)){
		top=28;
	}else{
		top=30;
	}
	for(i=1;i<=top;i++){
		dias_txt+="<option>"+i+"</option>";
	}
		document.getElementById("devolucion_dia").innerHTML = dias_txt;
	}
	
	function llenarAnhos(){
		var i = 0;
		var fecha = new Date();
		anhos_txt="<option> - A&ntilde;o - </option>";
		for(i=fecha.getFullYear();i>fecha.getFullYear()-5;i--){
			anhos_txt+="<option value=\""+i+"\">"+i+"</option>";
		}
		document.getElementById("devolucion_anho").innerHTML = anhos_txt;
	}
    </script>
	<div id="navegacion">
	<ul id="nav">
		<li><a href="index.jsp">Inicio</a></li>
		<li><a href="venta.jsp">Hacer venta</a></li>
		<li class="current"><a href="devolucion.jsp">Devoluciones</a></li>
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
                    <label>Cliente:<input type="text" name="devolucion_cliente" style="width:100px;"/></label>
                    <label>No. Venta:<input type="text" name="devolucion_idventa" style="width:50px;"/></label>
                    <label>Fecha:
                        <select name="devolucion_anho" id="devolucion_anho" onchange="ajustarFeb(this.value);llenarMes();">
                            <script>llenarAnhos();</script>
                        </select>
                        <select name="devolucion_mes" id="devolucion_mes" onchange="llenarDias(this.value)">
                            <script>llenarMes();</script>
                        </select>
                        <select name="devolucion_dia" id="devolucion_dia">
                            <option>- Día -</option>
                        </select>
                    </label>
                </form>
                </div>
                <div id="botonSubmit">
                    <input type="submit" name="buscarDev" id="buscarInventario" value="Buscar" style="width:auto;" />
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