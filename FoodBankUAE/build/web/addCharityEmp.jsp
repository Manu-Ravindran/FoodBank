<%-- 
    Document   : addCharityEmp
    Created on : 6 Dec, 2018, 12:50:10 AM
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
            String nm1=request.getParameter("nm1");
            String nm2=request.getParameter("nm2");
            String dob=request.getParameter("dob");
            String tel=request.getParameter("tel");
            String email=request.getParameter("email");
            String cname=request.getParameter("cname");
            String pass1=request.getParameter("psw");
            String pass2=request.getParameter("psw2");
        if(pass1.equals(pass2))
        {
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("INSERT INTO FDA.USERS (FIRSTNAME, LASTNAME, DOB, TEL, EMAIL, COMPANY, USERNAME, PASSWORD, SCOPE) VALUES (?, ?,?,?,?,?,?, ?, 'charity')");
	st.setString(1, nm1);
        st.setString(2, nm2);
        st.setString(3, dob);
        st.setString(4, tel);
        st.setString(5, email);
        st.setString(6, cname);
        st.setString(7, email);
        st.setString(8, pass1);
	int rs = st.executeUpdate();  

        if(rs>0)
        {
            out.println("SUCCESS");
        }
        }
        else
        {
            out.println("UNMATCHED PASSWORD ENTERED ");
        }
        %>
    </body>
</html>

