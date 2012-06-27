<link type="text/javascript" href="scripts/general.js">
<form>
    <div class="search_options">
    <label>Cliente:<input type="text" name="cliente" style="width:100px;"/></label>
    <label>No. Venta:<input type="text" name="idventa" style="width:50px;"/></label>
    <label>Fecha:
    <select name="devolucion_anho" id="ano" onchange="ajustarFeb(this.value);llenarMes();">
            <option>- Año -</option>    
          <%for(int i=2012;i>2008;i--){ 
          %>
          <option value="<%=i%>"><%=i%></option>
          <%}%>
    </select>
    <select name="devolucion_mes" id="mes" onchange="llenarDias(this.value)">
    <script>llenarMes();</script>
    </select>
    <select name="devolucion_dia" id="dia" style="width: 50px;">
    <option>Día</option>
    </select>
    </label>
    <br/>
    <label>
        <input type="checkbox" value="ventas"/> Ventas
    </label>
    <label>
        <input type="checkbox" value="devoluciones"/> Devoluciones
    </label>
    </div>
</form>
<div id="botonSubmit">
    <input type="submit" name="buscarRep" id="buscarReporte" value="Buscar" style="width:auto;" />
</div>