<%-- 
    Document   : signat
    Created on : 24 Nov, 2018, 1:55:40 AM
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
            
            
            String se=request.getParameter("signature-p");
            String id=request.getParameter("id");
            String name=request.getParameter("nm");
//            out.println("<img src=\""+se+"\"  height=\"200\" width=\"400\" />");
            
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.RECEIVE SET SIGNEE = ?,signature=? WHERE f_id= ?");
                    
                    
                    st.setString(1, name);
                    st.setString(2, se);
                    st.setString(3, id);
                   int rs = st.executeUpdate();  

                    if(rs>0)
                    {
                         out.println("Success");
                    }   
        %>
    </body>
</html>
