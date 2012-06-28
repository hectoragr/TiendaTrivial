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
<link type="text/javascript" src="scripts/general.js">
<link rel="shortcut icon" href="estilo/favicon.ico">
<script type="text/javascript">
var y=document.getElementById('text-content');

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

    	var bisiesto=0;
        var l_anho=0;
        var l_mes=0;
        function llenarMes(){
            var htmlMes="<option>- Mes -</option>";
            for(var i=1;i<=12;i++){
                htmlMes+="<option value="+i+">"+numMes(i)+"</option>";
            }
            document.getElementById("mes").innerHTML = htmlMes;
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
		document.getElementById("dia").innerHTML = dias_txt;
	}
	
	function llenarAnhos(){
		var i = 0;
		var fecha = new Date();
		anhos_txt="<option> - A&ntilde;o - </option>";
		for(i=fecha.getFullYear();i>fecha.getFullYear()-5;i--){
			anhos_txt+="<option value=\""+i+"\">"+i+"</option>";
		}
		document.getElementById("ano").innerHTML = anhos_txt;
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
                    <% 
                    if(session.getAttribute("nivelacceso")!=null){
                        
                    String nombre=(String)session.getAttribute("nombre");
                    String apellido=(String)session.getAttribute("apellido");
                    int nivel=(Integer)session.getAttribute("nivelacceso");
                    if(nivel==1){              
                    %>
                    <jsp:include page="forms/opcionesAdmin.jsp" />
                    <%}else if(nivel==2){%>
                    <h2 style="margin:auto; width:550px;padding-top:20px;">Bienvenido Gerente Inventario</h2>
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