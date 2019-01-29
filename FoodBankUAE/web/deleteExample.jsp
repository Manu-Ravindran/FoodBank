<%-- 
    Document   : deleteExample
    Created on : 30 Nov, 2018, 7:00:54 PM
    Author     : Sajid
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
        String[] rid = request.getParameterValues("idValue");
        for (int i = 0; i < rid.length; i++) {
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("delete from FDA.receive where id=?  ");
	st.setString(1, rid[i]);
	int rs = st.executeUpdate();  
        }
        RequestDispatcher rs=request.getRequestDispatcher("printExample.jsp");
        rs.forward(request, response);
        %>
    </body>
</html>
