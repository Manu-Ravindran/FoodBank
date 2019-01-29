<%-- 
    Document   : userRcv1a
    Created on : 8 Dec, 2018, 6:06:04 AM
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
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = con.createStatement();
	 
	ResultSet r2 = st.executeQuery("SELECT max(id) as x FROM FDA.IDEN");
        
        while(r2.next())
        {
        int num=r2.getInt("x");
        HttpSession q=request.getSession();
        q.setAttribute("idnm", num);
        }  
        
        RequestDispatcher rs=request.getRequestDispatcher("userRcv1b.jsp");
        rs.forward(request, response);
    %>
    </body>
</html>
