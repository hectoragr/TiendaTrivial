<%@page import="java.sql.*"%>
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
    if(request.getParameter("q")!=null){
                System.out.println("Llego q:"+request.getParameter("q"));
                String queryLog="SELECT idusuario FROM Usuario WHERE idusuario='"+request.getParameter("q")+"'";
                System.out.println(queryLog);
                rst=stmt.executeQuery(queryLog);
			if(rst.next()){
                            System.out.println("Usuario:" + rst.getString("idusuario"));
          %>
          <%="Usuario ya utilizado"%>
	  <%    
			}
      
             rst.close();
             stmt.close();
             con.close();
           }
	  %>