<form id="agregarProducto" name="agregarProducto" method="get" action="agregarProducto" onsubmit="return validateForm(this)">
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
            <option value="escoger">Elige tipo</option>
            <option value="bota">Bota</option>
            <option value="casual">Casual</option>
            <option value="deportivo">Deportivo</option>
            <option value="sandalia">Sandalia</option>
            <option value="zapatilla">Zapatilla</option>
        </select></td>
    </tr>
    <tr>
      
    <td><label for="marca" id="lmarca">Marca<span class="asterisco">*</span>:</label><br/>
      <select name="marca" id="marca">
         <option value="escoger">Elige marca</option>
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
       </select></td>
            
    <td><label for="talla" id="ltalla">Talla<span class="asterisco">*</span>:</label><br/>
        <select name="talla" id="talla">
          <option value="escoger">Elige talla</option>
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
        <input type="text" name="precio" id="precio" size="5" style="width:auto;"/></td>
   
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