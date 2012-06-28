


function trim(value) {
   var temp = value;
   var obj = /^(\s*)([\W\w]*)(\b\s*$)/;
   if (obj.test(temp)) { temp = temp.replace(obj, '$2');}
   var obj = /  /g;
   while (temp.match(obj)) { temp = temp.replace(obj, " ");}
   return temp;
}

//Funcion para calcular el largo en pixels det texto dado
function getTextWidth(texto)
{
	//Valor por default : 150 pixels
	var ancho = 150;

	if(trim(texto) == "")
	{
		return ancho;
	}

	//Creaci�n de un span escondido que se puedr� medir 
	var span = document.createElement("span");
	span.style.visibility = "hidden";
	span.style.position = "absolute";

	//Se agrega el texto al span y el span a la p�gina
	span.appendChild(document.createTextNode(texto));
	document.getElementsByTagName("body")[0].appendChild(span);

	//tama�o del texto
	ancho = span.offsetWidth;

	//Eliminaci�n del span
	document.getElementsByTagName("body")[0].removeChild(span);
	span = null;

	return ancho;
}

function procesar(upc){
    window.location = "/Tienda_Trivial/removerCarrito.jsp?upc="+upc;
}

//Funcion de modificacion del elemento seleccionado mediante doble-click
function modificar(obj, idcarrito, upc)
{ 
	//Objeto que sirve para editar el valor en la pagina 
	var input = null;

	input = document.createElement("input");


	//Asignar en la caja el valor de la casilla
	if (obj.innerText)
		input.value = obj.innerText;
	else
		input.value = obj.textContent;
	input.value = trim(input.value);

	//a la caja INPUT se la asigna un tama�o un poco mayor que el texto a modificar
	input.style.width  = getTextWidth(input.value) + 30 + "px";

	//Se remplaza el texto por el objeto INPUT
	obj.replaceChild(input, obj.firstChild);

	//Se selecciona el elemento y el texto a modificar
	input.focus();
	input.select();

	//Asignaci�n de los 2 eventos que provocar�n la escritura en la base de datos 

      //Salida de la INPUT
	input.onblur = function salir()
	{
		salvarMod(obj, input.value, idcarrito, upc);
		delete input;
	};

	//La tecla Enter
	input.onkeydown = function keyDown(event)
	{
		if(event.keyCode == 13)
        {
			salvarMod(obj, input.value, idcarrito, upc);
			delete input;
		}
	};
}


//Salvando las modificaciones
function salvarMod(obj, valor, idcarrito, upc)
{
obj.replaceChild(document.createTextNode(valor), obj.firstChild);
  request = getRequestObject();
  request.onreadystatechange = showResponseAlert;
  address = "modificarCantidad.jsp?idcarrito="+idcarrito+"&upc="+upc+"&cantidad="+valor;
  request.open("GET", address, true);
  request.send(null);
  
function showResponseAlert() {
if (request.readyState == 4) {
    obj.nextSibling.nextSibling.nextSibling.nextSibling.innerHTML=request.responseText;
}
}
}

function getRequestObject() {
  if (window.ActiveXObject) {
    return(new ActiveXObject("Microsoft.XMLHTTP"));
  } else if (window.XMLHttpRequest) {
    return(new XMLHttpRequest());
  } else {
    return(null);
  }
}

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
        
    function validateForm(){
    var ret = true    
    var x=document.forms.agregarProducto.cantidad;
	if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lcantidad").className="invalid";
	ret = false;
  	}
	else 
            if (isNaN(parseInt(x.value))){
  		x.style.backgroundColor="#FFFF99";
		document.getElementById("lcantidad").className="invalid";
		document.getElementById("scantidad").innerHTML="Introducir números";
            ret = false;
            }else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lcantidad").className="valid";
            document.getElementById("scantidad").innerHTML="";
             }    
             
    var x=document.forms.agregarProducto.upc;
	if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lupc").className="invalid";
	ret = false;
  	}
	else 
            if (isNaN(parseInt(x.value))){
  		x.style.backgroundColor="#FFFF99";
		document.getElementById("lupc").className="invalid";
		document.getElementById("supc").innerHTML="Introducir números";
            ret = false;
            }else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lupc").className="valid";
            document.getElementById("supc").innerHTML="";
             }    
             
     var x=document.forms.agregarProducto.tipo;
	if (x.value =="escoger"){
            document.getElementById("ltipo").className="invalid";
        ret = false;
	}else{
            document.getElementById("ltipo").className="valid";
         }
         
     var x=document.forms.agregarProducto.marca;
	if (x.value =="escoger"){
            document.getElementById("lmarca").className="invalid";
        ret = false;
	}else{
            document.getElementById("lmarca").className="valid";
         }
        
     var x=document.forms.agregarProducto.talla;
	if (x.value =="escoger"){
            document.getElementById("ltalla").className="invalid";
        ret = false;
	}else{
            document.getElementById("ltalla").className="valid";
         }
     var x=document.forms.agregarProducto.descripcion;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("ldescripcion").className="invalid";
        ret = false;
  	}else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("ldescripcion").className="valid";
          }
        
    var x=document.forms.agregarProducto.costo;
	if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lcosto").className="invalid";
	ret = false;
  	}
	else 
            if (isNaN(parseInt(x.value))){
  		x.style.backgroundColor="#FFFF99";
		document.getElementById("lcosto").className="invalid";
		document.getElementById("scosto").innerHTML="Introducir números";
            ret = false;
            }else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lcosto").className="valid";
            document.getElementById("scosto").innerHTML="";
             }    
   return ret;
   }
    
      function validateForm2(){
    var ret = true
    
    var x=document.forms.agregarCliente.nombre;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lnombre").className="invalid";
        ret = false;
  	} else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lnombre").className="valid";
          }
        
    var x=document.forms.agregarCliente.apellido;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lapellido").className="invalid";
        ret = false;
  	} else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lapellido").className="valid";
          }
        
    var x=document.forms.agregarCliente.dia;
	if (x.value =="escoger"){
            document.getElementById("lfechaNacimiento").className="invalid";
        ret = false;
	}else{
            x.style.backgroundColor="#FFFFFF";           
            document.getElementById("lfechaNacimiento").className="valid";
          }
        
    var x=document.forms.agregarCliente.correo;
       if (x.value==null|| x.value==""){
           x.style.backgroundColor="#FFFF99";
           document.getElementById("lcorreo").className="invalid";
       ret = false;
       }else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lcorreo").className="valid";
        }
            
     var x=document.forms.agregarCliente.direccion;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("ldireccion").className="invalid";
        ret = false;
  	}else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("ldireccion").className="valid";
          }
          
     var x=document.forms.agregarCliente.colonia;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lcolonia").className="invalid";
        ret = false;
  	}else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lcolonia").className="valid";
          }
          
     var x=document.forms.agregarCliente.cp;
	if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lcp").className="invalid";
	ret = false;
  	}
	else 
            if (isNaN(parseInt(x.value))){
  		x.style.backgroundColor="#FFFF99";
		document.getElementById("lcp").className="invalid";
		document.getElementById("scp").innerHTML="Introducir números";
            ret = false;
            }else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lcp").className="valid";
            document.getElementById("scp").innerHTML="";
             }    
             
    var x=document.forms.agregarCliente.ciudad;
        if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lciudad").className="invalid";
        ret = false;
  	}else{
            x.style.backgroundColor="#FFFFFF";
            document.getElementById("lciudad").className="valid";
         }
         
    var x=document.forms.agregarCliente.estado;
	if (x.value =="escoger"){
            document.getElementById("lestado").className="invalid";
        ret = false;
	}else{
            document.getElementById("lestado").className="valid";
         }
         
    var x=document.forms.agregarCliente.telefono;
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
function validateform3(){
    
    var x=document.getElementById("cantidad");
    if((x.value==null)||(x.value=="")){
        x.style.backgroundColor="#FFFF99";
        ret = false;
    }
    x=document.getElementById("upc");
    if((x.value==null)&&(x.value)){
        ret = false;
    }
}