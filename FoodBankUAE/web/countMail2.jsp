<%-- 
    Document   : countMail2
    Created on : 15 Dec, 2018, 8:17:51 PM
    Author     : Sajid
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
               String usr=(String)session.getAttribute("sname");
                    Class.forName("org.apache.derby.jdbc.ClientDriver");

                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                        
                    PreparedStatement ps = conn.prepareStatement("SELECT count(*) FROM FDA.INBOX  where RECEIVER='"+usr+"' and status='unread'");

                    

                 ResultSet rs = ps.executeQuery();   
                if(rs.next())
                 {
                       out.println("<a href='#'> YOU HAVE "+rs.getInt("1")+" UNREAD MESSAGES</a>");
                  }
                 

            
            
    conn.close();  
   
        %>
    </body>
</html>
