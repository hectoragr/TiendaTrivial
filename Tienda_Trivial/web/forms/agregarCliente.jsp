
    <!--- coment -->
<h3 style="margin: auto;padding-top:10px;width:140px;">Agregar cliente</h3>
<form  name="agregarCliente" method="get" action="agregarCliente" onsubmit="return validateForm(this)">
  <table width="600" border="1" cellspacing="5" cellpadding="1" align="center">
    <tr>
      <td><label for="nombre" id="lnombre"> Nombre <span class="asterisco">*</span>:</label><br/>
          <input type="text" name="nombre" id="nombre"/></td>
               
      <td><label for="apellido" id="lapellido"> Apellido <span class="asterisco">*</span>:</label><br/>
          <input type="text" name="apellido" id="apellido" /></td>
     </tr>
    <tr>
        <td><label for="sexo" id="lsexo"> Sexo <span class="asterisco">*</span>:</label><br/>
            <label for="mujer" id="lmujer"> Mujer </label> 
            <input type="radio" name="sexo" checked="checked" value="M" style="width:auto;"/><br/>
            <label for="hombre" id="lhombre"> Hombre </label>
            <input type="radio" name="sexo" value="H" style="width:auto;" /></td>
          
        <td><label for="fechaNacimiento" id="lfechaNacimiento"> Fecha de Nacimiento <span class="asterisco">*</span>:</label>
          <br/>
      <select name="ano" id="ano" onchange="ajustarFeb(this.value);llenarMes();">
          <%for(int i=2012;i>1950;i--){ 
          %>
          <option value="<%=i%>"><%=i%></option>
          <%}%>
      </select>
      <select name="mes" id="mes" onchange="llenarDias(this.value);">
          <script>llenarMes();</script>
      </select>
      <select name="dia" id="dia">
      </select>
      </td>
    </tr>
    <tr>
      <td><label for="correo" id="lcorreo"> Correo electrónico <span class="asterisco">*</span>:</label><br/>
          <input type="text" name="correo" id="correo" /></td>
      
      <td><label for="direccion" id="ldireccion">Dirección <span class="asterisco">*</span>:</label><br/>
          <textarea name="direccion" rows="2" cols="20"></textarea></td>
    </tr>
    <tr>
      <td><label for="colonia" id="lcolonia"> Colonia <span class="asterisco">*</span>:</label><br/>
          <input type="text" name="colonia" id="colonia" /></td>
      
      <td><label for="cp" id="lcp"> CP <span class="asterisco">*</span>:</label><br/>
          <input type="text" name="cp" id="cp" /><br/>
          <span id="scp" class="invalid"></span></td>
    </tr>
    <tr>
      <td><label for="ciudad" id="lciudad"> Ciudad/Municipio <span class="asterisco">*</span>:</label><br/>
          <input type="text" name="ciudad" id="ciudad" /></td>
      
      <td><label for="estado" id="lestado"> Estado <span class="asterisco">*</span>:</label>
      
        <select name="estado" id="estado">
           <option value="escoger">Escoger estado</option> 
           <option value="Aguascalientes">Aguascalientes</option>
           <option value="Baja California">Baja California</option>
           <option value="Baja California Sur">Baja California Sur</option>
           <option value="Campeche">Campeche</option>
           <option value="Coahuila">Coahuila</option>
           <option value="Colima">Colima</option>
           <option value="Chiapas">Chiapas</option>
           <option value="Chihuahua">Chihuahua</option>
           <option value="Distrito federal">Distrito Federal</option>
           <option value="Durango">Durango</option>
           <option value="Guanajuato">Guanajuato</option>
           <option value="Guerrero">Guerrero</option>
           <option value="Hidalgo">Hidalgo</option>
           <option value="Jalisco">Jalisco</option>
           <option value="México">México</option>
           <option value="Michoacán">Michoacán</option>
           <option value="Morelos">Morelos</option>
           <option value="Nayarit">Nayarit</option>
           <option value="Nuevo León">Nuevo León</option>
           <option value="Oaxaca">Oaxaca</option>
           <option value="Puebla">Puebla</option>
           <option value="Queretaro">Querétaro</option>
           <option value="Quintana Roo">Quintana roo</option>
           <option value="San Luis Potosí">San Luis Potosi</option>
           <option value="Sinaloa">Sinaloa</option>
           <option value="Sonora">Sonora</option>
           <option value="Tabasco">Tabasco</option>
           <option value="Tamaulipas">Tamaulipas</option>
           <option value="Tlaxcala">Tlaxcala</option>
           <option value="Veracruz">Veracruz</option>
           <option value="Yucatán">Yucatán</option>
           <option value="Zacatecas">Zacatecas</option>
       </select>
     
      </td>
    </tr>
    <tr>
      <td><label for="telefono" id="ltelefono"> Teléfono <span class="asterisco">*</span>:</label><br/>
           <input type="text" name="telefono" id="telefono" /><br/>
           <span id="stelefono" class="invalid"></span></td>
      
      <td><label for="celular" id="lcelular"> Celular </label><br/>
          <input type="text" name="celular" id="celular" /><br/>
          <span id="scelular" class="invalid"></span></td>
     </tr>
    <tr>
      <td colspan="2" align="center"><input style="width:auto;" type="submit" name="registrar" id="sregistrar" value="Registrar" /></td>
    </tr>
  </table>
</form>