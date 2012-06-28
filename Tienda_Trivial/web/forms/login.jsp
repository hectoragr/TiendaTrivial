<script type="text/javascript"> 
        function checkUser(str){
        if (str==""){
        document.getElementById("triesCon").innerHTML="";
        return;
        } 
        if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
        }else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        
        xmlhttp.onreadystatechange=function(){ 
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                document.getElementById("triesCon").innerHTML=xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET","forms/userCheck.jsp?l="+str,true);
        xmlhttp.send();
    }
</script>
<p style="font-size:2em;">Bienvenido al sistema de Tienda Trivial</p>
<p><span class="firstLetter">I</span>nicia sesión para poder acceder a las diferentes
herramientas.</p>
<form id="formaLogin" name="formaLogin" method="post" action="login" style="width:550px; display:block;">
<span>Usuario:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="usuarioLog" name="usuarioLog"/>

<%if(session.getAttribute("intentosfallidos")!=null){%>
    <span id="triesCon" style="color:red; font-size: 12px; font-family: console;">Has intentado conectarte sin exito a tu cuenta,
        al 3er intento la cuenta se bloquea.</span>  
<%}%>

<br/>
<span>Contraseña:</span>&nbsp;<input type="password" name="passLog"/><br/>
<span style="font-size:9px; margin-left: auto; margin-right:auto; text-align: center;"><a href="mailto:admin@example.org">¿Olvidaste tu contraseña o login?</a></span><br/>
<input type="submit" value="Iniciar sesión"/>
</form>