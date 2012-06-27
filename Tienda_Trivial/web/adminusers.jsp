<%-- 
    Document   : adminusers
    Created on : 21-jun-2012, 17:19:08
    Author     : hectorgomez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Tienda trivial - Administrar usuarios</title>
    <link rel="stylesheet" type="text/css" href="estilo/agregar.css" />
    <link rel="stylesheet" type="text/css" href="estilo/style.css"/>
    <link rel="shortcut icon" href="estilo/favicon.ico">
    <script type="text/javascript">
    var keylist="abcdefghijklmnopqrstuvwxyzñABCDEFGHIJKLMNOPQRSTUVWXYZÑ123456789";
    var temp='';
    
    function validateForm(){
    var ret = true;
   
    
    var x=document.forms.crearUsuario.id;
	if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lid").className="invalid";
	ret = false;
  	}
/*	else 
            if (isNaN(parseInt(x.value))){
  		x.style.backgroundColor="#FFFF99";
		document.getElementById("lid").className="invalid";
		document.getElementById("sid").innerHTML="Introducir números";
            ret = false;
            }*/
      var x=document.forms.crearUsuario.tipo;
	if (x.value =="escoger"){
            document.getElementById("ltipo").className="invalid";
        ret = false;
	}
        
    var x=document.forms.crearUsuario.nombre;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lnombre").className="invalid";
        ret = false;
  	}
     var x=document.forms.crearUsuario.apellido;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lapellido").className="invalid";
        ret = false;
  	}
     var x=document.forms.crearUsuario.correo;
       if (x.value==null|| x.value==""){
           x.style.backgroundColor="#FFFF99";
           document.getElementById("lcorreo").className="invalid";
       ret = false;
       }
       
    return ret;
    }
 

    function generaContrasena(maxlength){
    temp='';
    for (i=0;i<maxlength;i++)
        temp+=keylist.charAt(Math.floor(Math.random()*keylist.length));
    return temp;
    }

    function contra(enterlength){
    document.crearUsuario.contrasena.value=generaContrasena(enterlength);
    }

</script>
</head>
<body>
	<div id="navegacion">
	<ul id="nav">
		<li><a href="index.jsp">Inicio</a></li>
		<li><a href="venta.jsp">Hacer venta</a></li>
		<li><a href="devolucion.jsp">Devoluciones</a></li>
		<li><a href="inventario.jsp">Inventario</a></li>
		<li><a href="reportes.jsp">Reportes</a></li>
		<li class="current"><a href="adminusers.jsp">Admin Usuarios</a></li>
	</ul>
	</div>
        <div id="outter-contenido">
            <div id="contenido">
                <div id="text-content">
                    <br/>
                    <h3 style="margin:auto; width:150px;">Agregar Usuarios</h3>
                    <form id="crearUsuario" name="crearUsuario" method="get" action="agregarUsuario" onsubmit="return validateForm(this)">
                        <div id="columnasUser">
                            
                        <span id="leftSpan"><div>
                                <label for="id" id="lid">User id<label class="asterisco">*</label>:</label><br/>
                                <input type="text" name="id" id="id" size="17" style="width:auto;" /><br/>
                                <label id="sid" class="invalid"></label>
                              </div>
                            <div>
                                <label for="nombre" id="lnombre"> Nombre: <label class="asterisco">*</label></label><br/>
                                <input type="text" name="nombre" id="nombre"/>
                            </div>
                            <div>
                                <label for="apellido" id="lapellido"> Apellido: <label class="asterisco">*</label></label><br/>
                                <input type="text" name="apellido" id="apellido" />
                            </div>
                            <div>
                                <label for="correo" id="lcorreo">Correo electrónico:<label class="asterisco">*</label></label><br/>
                                <input type="text" name="correo" id="correo" />
                            </div>
                        </span>
                        <!-- Columna 2 -->
                        <span id="rightSpan">
                            <div>
                                <label for="tipo" id="ltipo">Tipo de usuario:<span class="asterisco">*</span></label><br/>
                                <select name="tipo" id="tipo">
                                    <option value="escoger"> Elige tipo</option>
                                    <option value="1">Administrador</option>
                                    <option value="2">Gerente de inventario</option>
                                    <option value="3">Gerente de ventas</option>
                                    <option value="4">Vendedor</option>
                                </select>
                            </div>
                            <div>
                               <label for="contrasena" id="lcontrasena"> Contraseña: <span class="asterisco">*</span></label>
                                <input type="hidden" name="thelength"  value="7" size=3 disabled="disabled"><br/>
                                <input type="text" name="contrasena" id="contrasena" size="17" style="width:auto;"/> 
                                <input type="button" name="generarContrasena" id="generarContrasena" value="Generar contraseña" style="width:auto;" onClick="contra(this.form.thelength.value)" />
                            </div>
                            <br/>
                           <!-- <div>
                                <input type="button" name="generarContrasena" id="generarContrasena" value="Generar contraseña" style="width:auto;" onClick="contra(this.form.thelength.value)" />
                            </div>
                           -->
                        </span>
                        </div>
                        <div id="botonSubmit">
                        <input type="submit" name="crearUsuario" id="crearUsuario" value="Crear usuario" style="width:auto;" />
                        </div>
                    <!--    
                    <table width="500" border="1" cellspacing="5" cellpadding="1" align="center">
                        <tr>
                        <td><label for="id" id="lid">User id<span class="asterisco">*</span>:</label><br/>
                            <input type="text" name="id" id="id" size="17" style="width:auto;" /><br/>
                            <span id="sid" class="invalid"></span></td>

                        <td><label for="tipo" id="ltipo">Tipo de usuario<span class="asterisco">*</span>:</label><br/>
                            <select name="tipo" id="tipo">
                                <option value="escoger"> Elige tipo</option>
                                <option value="administrador">Administrador</option>
                                <option value="gerenteInventario">Gerente de inventario</option>
                                <option value="gerenteVenta">Gerente de ventas</option>
                                <option value="vendedor">Vendedor</option>
                            </select></td>
                        </tr>
                        <tr>
                        <td><label for="nombre" id="lnombre"> Nombre <span class="asterisco">*</span>:</label><br/>
                            <input type="text" name="nombre" id="nombre"/></td>

                        <td><label for="contrasena" id="lcontrasena"> Contraseña <span class="asterisco">*</span>:</label>
                            <input type="hidden" name="thelength"  value="7" size=3 disabled="disabled"><br/>
                            <input type="text" name="contrasena" id="contrasena" value="1234" size="17" style="width:auto;" disabled="disabled"/></td>
                        </tr>

                        <tr>
                        <td><label for="apellido" id="lapellido"> Apellido <span class="asterisco">*</span>:</label><br/>
                            <input type="text" name="apellido" id="apellido" /></td>
                        <td><input type="button" name="generarContrasena" id="generarContrasena" value="Generar contraseña" style="width:auto;" onClick="contra(this.form.thelength.value)" /></td>
                    </tr>

                        <tr>
                        <td><label for="correo" id="lcorreo">Correo electrónico<span class="asterisco">*</span>:</label><br/>
                            <input type="text" name="correo" id="correo" /></td>
                        <td>&nbsp</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" name="crearUsuario" id="crearUsuario" value="Crear usuario" style="width:auto;" /></td>
                    </tr>
                    </table>
                    -->
                    </form>
                </div>
            </div>
        </div>
</body>
</html>