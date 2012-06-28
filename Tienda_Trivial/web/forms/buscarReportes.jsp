<%@page import="java.sql.*"%>
<link type="text/javascript" href="scripts/general.js">
    <%
        String driver = "org.gjt.mm.mysql.Driver";
        Class.forName(driver).newInstance();


        Connection con=null;
	ResultSet rst=null;
		
	Statement stmt=null;

        try{
            String url="jdbc:mysql://localhost:8889/tiendatrivial?user=root&password=root";	
            con=DriverManager.getConnection(url);
            stmt=con.createStatement();
	}catch(Exception e){
            System.out.println(e.getMessage());
        }
    %>
    <form name="buscarRep" method="GET" action="reportes.jsp">
    <div class="search_options">
    <label>Cliente:<input type="text" name="cliente" style="width:100px;"/></label>
    <label>No. Venta:<input type="text" name="idventa" style="width:50px;"/></label>
    <label>Fecha:
    <select name="ano" id="ano" onchange="ajustarFeb(this.value);llenarMes();">
            <option value="">- Año -</option>    
          <%for(int i=2012;i>2008;i--){ 
          %>
          <option value="<%=i%>"><%=i%></option>
          <%}%>
    </select>
    <select name="mes" id="mes" onchange="llenarDias(this.value)">
    <script>llenarMes();</script>
    </select>
    <select name="dia" id="dia" style="width: 50px;">
    <option value="">Día</option>
    </select>
    </label>
    <br/>
    <label>
        <input type="radio" name="transaccion" value="venta" checked/> Ventas
    </label>
    <label>
        <input type="radio" name="transaccion" value="devolucion"/> Devoluciones
    </label>
    </div>
    <div id="botonSubmit">
    <input type="submit" name="buscarRep" id="buscarReporte" value="Buscar" style="width:auto;" />
    </div>
</form>
<div id="productos_query">
        <%
                if(request.getParameter("buscarRep")!=null){
                System.out.println("Llego a los parametros");
                int tipo,params;
                tipo=params=0;
                String cliente,venta,ano,mes,dia,queryRep;
                cliente=venta=ano=mes=dia=queryRep="";
                if(request.getParameter("transaccion").equals("venta")){
                    queryRep="SELECT * FROM Venta";
                }else if(request.getParameter("transaccion").equals("devolucion")){
                    queryRep="SELECT * FROM Devolucion";
                    tipo=1;
                }
                if(!request.getParameter("cliente").equals("")){
                    cliente = (String)request.getParameter("cliente");
                    queryRep+=" WHERE idcliente='"+cliente+"'";
                    params++;
                }
                if(!request.getParameter("idventa").equals("")){
                    venta = request.getParameter("idventa");
                    if(params<1){
                        queryRep+=" WHERE idventa='"+venta+"'";
                    }else{
                    queryRep+=" AND idventa='"+venta+"'";
                    }
                    params++;
                }
                if(!request.getParameter("ano").equals("")){
                    ano = request.getParameter("ano");
                }
                if(!request.getParameter("mes").equals("")){
                    mes = "-"+request.getParameter("mes");
                }
                if(!request.getParameter("dia").equals("")){
                    dia = "-"+request.getParameter("dia");
                }
                if(params<1){
                    queryRep+=" WHERE fecha"+request.getParameter("transaccion")+" LIKE '%"+ano+mes+dia+"%'";
                }
                else{
                    queryRep+=" AND fecha"+request.getParameter("transaccion")+" LIKE '%"+ano+mes+dia+"%'";
                }
                
                rst=stmt.executeQuery(queryRep);
                %>
                <table id="tablaProd" border="1" cellspacing="0" cellpadding="5px;">
      
                   <tr><td><b>Tipo</b></td><td style="width:100px;"><b>Cliente</b></td><td style="width:75px;"><b>UPC</b></td><td style="width:60px;"><b>Cantidad</b></td>
                       <td><b>Fecha</b></td><td><b>Hora</b></td>
                   </tr>
	  <%
			while(rst.next()){  
          %>
                    <tr><td><%=request.getParameter("transaccion")%></td><td><%=rst.getString("idcliente")%></td><td style="text-align: center;"><%=rst.getString("upc")%></td><td><%=rst.getString("cantidad")%></td>
                        <td><%=rst.getString("fecha"+request.getParameter("transaccion"))%></td><td><%=rst.getString("hora"+request.getParameter("transaccion"))%></td>
                   </tr>
	  <%    
			}%>
                </table>
                        <%
      
             rst.close();
             stmt.close();
             con.close();
           }
		%>
</div>
