<%-- 
    Document   : transfer1a
    Created on : 5 Dec, 2018, 12:44:48 PM
    Author     : Sajid
--%>

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
            Integer id = (Integer) session.getAttribute("did");
             String id1=Integer.toString(id);
            String[] rid = request.getParameterValues("idVal2");
        for (int i = 0; i < rid.length; i++) {
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = connection.createStatement();
	int rs = st.executeUpdate("UPDATE FDA.RECEIVE SET DID = '"+id1+"' where F_ID='"+rid[i]+"'");  
        
        }
        RequestDispatcher rs=request.getRequestDispatcher("transfer1c.jsp");
        rs.forward(request, response);
        %>
    </body>
</html>
