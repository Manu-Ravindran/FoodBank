<%-- 
    Document   : userRcv
    Created on : 8 Dec, 2018, 6:04:52 AM
    Author     : Sajid
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        Class.forName("org.apache.derby.jdbc.ClientDriver");  
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
        PreparedStatement ps=conn.prepareStatement("INSERT INTO FDA.IDEN (NIL) VALUES ('gen')"); 
        
        int rss=ps.executeUpdate();    
        
        RequestDispatcher rs=request.getRequestDispatcher("userRcv1a.jsp");
        rs.forward(request, response);
    %>
    </body>
</html>
