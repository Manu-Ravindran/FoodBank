<%-- 
    Document   : addRegf1
    Created on : 13 Dec, 2018, 8:39:15 AM
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
            String id=request.getParameter("id");
            String loc=request.getParameter("loc");
            String asgn=request.getParameter("asn");
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("INSERT INTO FDA.FRIDGE (IDNO, LOC, USERID) VALUES (?, ?, ?) ");
	st.setString(1, id);
        st.setString(2, loc);
        st.setString(3, asgn);
	int rs = st.executeUpdate();  

        if(rs>0)
        {
            out.println("SUCCESS");
        }
        %>
    </body>
</html>
