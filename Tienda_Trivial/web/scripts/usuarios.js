/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


var keylist="abcdefghijklmnopqrstuvwxyzñABCDEFGHIJKLMNOPQRSTUVWXYZÑ123456789"
    var temp=''
    
    function validateForm(){
    var ret = true
   
    
    var x=document.forms.crearUsuario.id;
	if (x.value==null || x.value==""){
            x.style.backgroundColor="#FFFF99";
            document.getElementById("lid").className="invalid";
	ret = false;
  	}
	else 
            if (isNaN(parseInt(x.value))){
  		x.style.backgroundColor="#FFFF99";
		document.getElementById("lid").className="invalid";
		document.getElementById("sid").innerHTML="Introducir números";
            ret = false;
            }
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
    temp=''
    for (i=0;i<maxlength;i++)
        temp+=keylist.charAt(Math.floor(Math.random()*keylist.length))
    return temp
    }

    function contra(enterlength){
    document.crearUsuario.contrasena.value=generaContrasena(enterlength)
    } 
