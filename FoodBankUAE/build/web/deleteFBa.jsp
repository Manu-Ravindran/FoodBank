<%-- 
    Document   : deleteSupplierA
    Created on : 5 Dec, 2018, 1:39:54 AM
    Author     : Sajid
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
	PreparedStatement st = connection.prepareStatement("DELETE FROM FDA.fbloc WHERE ID = ? ");
	st.setString(1, rid[i]);
	int rs = st.executeUpdate();  
        if(rs>0)
        {
        out.println("success");
        }
        }
        %>
    </body>
</html>
