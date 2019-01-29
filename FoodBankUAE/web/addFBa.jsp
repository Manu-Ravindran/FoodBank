<%-- 
    Document   : addProductA
    Created on : 5 Dec, 2018, 2:28:19 AM
    Author     : Sajid
--%>

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
            String nm=request.getParameter("nm");
            String loc=request.getParameter("loc");
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("INSERT INTO FDA.FBLOC (FB_NAME, FB_ADDRESS) VALUES (?, ?)");
	st.setString(1, nm);
        st.setString(2, loc);
	int rs = st.executeUpdate();  

        if(rs>0)
        {
            out.println("SUCCESS");
        }
        %>
    </body>
</html>
