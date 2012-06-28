<form id="modificarProducto" name="modificarProducto" method="get" enctype="multipart/form-data" action="agregarProducto" onsubmit="return validateform3(this)">
  <table width="500" border="1" cellspacing="5" cellpadding="1" align="center">
    <tr>
    <td><label for="cantidad" id="lcantidad">Cantidad<span class="asterisco">*</span>:</label><br/>
        <input type="text" name="cantidad" id="cantidad" size="17" style="width:auto;" /><br/>
        <span id="scantidad" class="invalid"></span></td>
              
    <td><label for="upc" id="lupc">UPC<span class="asterisco">*</span>:</label><br/>
        <input type="text" name="upc" id="upc" size="5" style="width:auto;"/><br/>
        <span id="supc" class="invalid"></span></td>
    
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
      <td colspan="3" align="center"><input style="width:auto;" type="submit" name="modificarArticulo" id="modificarArticulo" value="Modificar artículo" /></td>
    </tr>
  </table>
</form>