<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registrar inventario</title>
<link rel="stylesheet" type="text/css" href="estilo/agregar.css" />
<script type="text/javascript">
function validateForm(){
    var ret = true
    var x;
    x=document.forms.agregarCliente.nombre;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lnombre").className="invalid";
        ret = false;
  	} else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lnombre").className="valid";
          }
        
    x=document.forms.agregarCliente.apellido;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lapellido").className="invalid";
        ret = false;
  	} else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lapellido").className="valid";
          }
        
    x=document.forms.agregarCliente.dia;
	if (x.value =="escoger"){
            document.getElementById("lfechaNacimiento").className="invalid";
        ret = false;
	}else{
            x.style.backgroundColor="#FFFFFF";           
            document.getElementById("lfechaNacimiento").className="valid";
          }
        
    x=document.forms.agregarCliente.correo;
       if (x.value==null|| x.value==""){
           x.style.backgroundColor="#FFFF99";
           document.getElementById("lcorreo").className="invalid";
       ret = false;
       }else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lcorreo").className="valid";
        }
            
    x=document.forms.agregarCliente.direccion;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("ldireccion").className="invalid";
        ret = false;
  	}else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("ldireccion").className="valid";
          }
          
    x=document.forms.agregarCliente.colonia;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lcolonia").className="invalid";
        ret = false;
  	}else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lcolonia").className="valid";
          }
          
    x=document.forms.agregarCliente.cp;
	if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lcp").className="invalid";
	ret = false;
  	}
	else 
            if (isNaN(parseInt(x.value))){
  		x.style.backgroundColor="#FFFF99";
		document.getElementById("lcp").className="invalid";
		document.getElementById("scp").innerHTML="Introducir nÃºmeros";
            ret = false;
            }else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lcp").className="valid";
            document.getElementById("scp").innerHTML="";
             }    
             
    x=document.forms.agregarCliente.ciudad;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lciudad").className="invalid";
        ret = false;
  	}else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lciudad").className="valid";
         }
         
    x=document.forms.agregarCliente.estado;
	if (x.value =="escoger"){
            document.getElementById("lestado").className="invalid";
        ret = false;
	}else{
            document.getElementById("lestado").className="valid";
         }
         
    x=document.forms.agregarCliente.telefono;
	if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("ltelefono").className="invalid";
	ret = false;
  	}
	else 
            if (isNaN(parseInt(x.value))){
		x.style.backgroundColor="#FFFF99";
		document.getElementById("ltelefono").className="invalid";
		document.getElementById("stelefono").innerHTML="Introducir números";
            ret = false;
            }
	else 
            if (x.value<9999999){
		x.style.backgroundColor="#FFFF99";
		document.getElementById("ltelefono").className="invalid";
		document.getElementById("stelefono").innerHTML="Mínimo 8 digitos";
            ret = false;
            }else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("ltelefono").className="valid";
            document.getElementById("stelefono").innerHTML="";
            }
    
    return ret;
    }

</script>
<form id="agregarProducto" name="agregarProducto" method="get" enctype="multipart/form-data" action="agregarProducto" onsubmit="return validateForm(this)">
  <table width="500" border="1" cellspacing="5" cellpadding="1" align="center">
    <tr>
    <td><label for="cantidad" id="lcantidad">Cantidad<span class="asterisco">*</span>:</label><br/>
        <input type="text" name="cantidad" id="cantidad" size="17" style="width:auto;" /><br/>
        <span id="scantidad" class="invalid"></span></td>
              
    <td><label for="upc" id="lupc">UPC<span class="asterisco">*</span>:</label><br/>
        <input type="text" name="upc" id="upc" size="5" style="width:auto;"/><br/>
        <span id="supc" class="invalid"></span></td>
    
    <td><label for="tipo" id="ltipo">Tipo de zapato<span class="asterisco">*</span>:</label><br/>
        <select name="tipo" id="tipo">
            <option value="">Elige tipo</option>
            <option value="Tenis">Tenis</option>
            <option value="Sandalia">Sandalia</option>
            <option value="Zapato">Zapato</option>
        </select></td>
    </tr>
    <tr>
      
    <td><label for="marca" id="lmarca">Marca<span class="asterisco">*</span>:</label><br/>
      <select name="marca" id="marca">
         <option value="">Elige marca</option>
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
       </select></td>
            
    <td><label for="talla" id="ltalla">Talla<span class="asterisco">*</span>:</label><br/>
        <select name="talla" id="talla">
          <option value="">Elige talla</option>
          <option value="3">3</option>
          <option value="3.5">3.5</option>
          <option value="4">4</option>
          <option value="4.5">4.5</option>
          <option value="5">5</option>
          <option value="5.5">5.5</option>
          <option value="6">6</option>
          <option value="6.5">6.5</option>
          <option value="7">7</option>
          <option value="7.5">7.5</option>
          <option value="8">8</option>
          <option value="8.5">8.5</option>
          <option value="9">9</option>
          <option value="9.5">9.5</option>
          <option value="10">10</option>
          
      </select></td>
     <td><label for="descripcion" id="ldescripcion">Descripción<span class="asterisco">*</span>:</label><br/>
         <textarea name="descripcion" rows="2" cols="20"></textarea></td>
    </tr>
    <tr>
     
    <td><label for="costo" id="lcosto">Costo<span class="asterisco">*</span>:</label><br/>
        <input type="text" name="costo" id="costo" size="5" style="width:auto;" /><br/>
        <span id="scosto" class="invalid"></span></td>
    
    <td><label for="precio" id="lprecio">Precio<span class="asterisco">*</span>:</label><br/>
        <input type="text" name="precio" id="precio" size="5" style="width:auto;" /></td>
   
    <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" align="left"><label for="imagen" id="limagen">Agregar imagen</label><br/>
      <input type="file" name="imagen" id="imagen" /></td>
    </tr>
    <tr>
      <td colspan="3" align="center"><input style="width:auto;" type="submit" name="agregarArticulo" id="sagregarArticulo" value="Agregar artículo" /></td>
    </tr>
  </table>
</form>
</body>
</html>