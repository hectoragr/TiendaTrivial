<%-- 
    Document   : bienvenido
    Created on : 26-jun-2012, 20:00:36
    Author     : hectorgomez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="Refresh" CONTENT="10;URL=index.jsp">
        <title>Bienvenida</title>
        <script LANGUAGE="JavaScript"><!--
        function redirect () { setTimeout("go_now()",10000); }
        function go_now ()   { window.location.href = "index.jsp"; }
//--></script>
    </head>
    <%
    String nombre=(String)session.getAttribute("nombre");
    String apellido=(String)session.getAttribute("apellido");
    %>
    <body onLoad="redirect()">
        <h1>Bienvenido, <%= nombre %> <%=apellido%></h1>
        <h4>En 5 segundos irás al Index, o presiona <a href="index.jsp">aquí</a> para ir ya</h4>
    </body>
</html>