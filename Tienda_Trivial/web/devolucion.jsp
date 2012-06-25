<%-- 
    Document   : devolucion
    Created on : 21-jun-2012, 17:18:26
    Author     : hectorgomez
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
Date date = new Date();
String anhoOptions=llenarAnho();
String mesOptions=llenarMes();
String diasOptions="";
public String llenarAnho(){
    String htmlAnho="";
    for(int i=(2012-5);i<=2012;i++){
        htmlAnho+="<option value=\""+i+"\">"+i+"</option>";
    }
    return htmlAnho;
}

public String llenarMes(){
    String htmlMes="";
    for(int i=1;i<=12;i++){
        htmlMes+="<option value=\""+i+"\">"+numMes(i)+"</option>";
    }
    return htmlMes;
}

public String numMes(int dia){
    String mes="error";
    switch (dia){
       case 1: mes="Enero"; break;
       case 2: mes="Febrero"; break;
       case 3: mes="Marzo"; break;
       case 4: mes="Abril"; break;
       case 5: mes="Mayo"; break;
       case 6: mes="Junio"; break;
       case 7: mes="Julio"; break;
       case 8: mes="Agosto"; break;
       case 9: mes="Septiembre"; break;
       case 10: mes="Octubre"; break;
       case 11: mes="Noviembre"; break;
       case 12: mes="Diciembre"; break;                              
       default: break;
    }
    return mes;
}

public String diasOptions(int mes, int anho){
    short bis=0;
    if((anho%400)==0){
        bis=1;
    }else if((anho%100)==0){
        bis=0;
    }else if((anho%4)==0){
        bis=0;
    }else{
        bis=0;
    }

}
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
        function llenarMes(){
            var htmlMes="";
            for(var i=1;i<=12;i++){
                htmlMes+="<option value="+i+">"+numMes(i)+"</option>";
            }
            return htmlMes;
        }
        function 
	function ajustarFeb(anho){
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
		document.getElementById("dias_").innerHTML = dias_txt;
	}
	
	function llenarAnhos(){
		var i = 0;
		var fecha = new Date();
		anhos_txt="<option> - A&ntilde;o - </option>";
		for(i=fecha.getFullYear()-18;i>fecha.getFullYear()-65;i--){
			anhos_txt+="<option value=\""+i+"\">"+i+"</option>";
		}
		document.getElementById("anho_").innerHTML = anhos_txt;
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
                        <select name="devolucion_anho">
                            <option>- Año -</option>
                            <%=anhoOptions%>
                        </select>
                        <select name="devolucion_mes">
                            <option>- Mes -</option>
                            <%=mesOptions%>
                        </select>
                        <select name="devolucion_dia">
                            <option>- Día -</option>
                            
                        </select>
                    </label>
                </form>
                </div>
                <br/>
                <br/>
                <div id="productos_query">
                    <h1 style="color:black;">Aquí saldrían los productos para vender</h1>        
                </div>
                </div>
            </div>
        </div>
</body>
</html>