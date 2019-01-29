<%-- 
    Document   : showMail2
    Created on : 15 Dec, 2018, 8:52:27 PM
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
                String no=request.getParameter("count");
                 int n=Integer.parseInt(no);
                    Class.forName("org.apache.derby.jdbc.ClientDriver");

                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                        
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM FDA.inbox  where id="+n+" ");

                    

                 ResultSet rs = ps.executeQuery();   
                while(rs.next())
                 {
                        out.println("<table>");
                        out.println("<tr>");
                          out.println("<th>MAIL</th>");
                        out.println("</tr>");
                       out.println("<tr>");
                       out.println("<td>"+rs.getString("msg")+"</td>");
                       out.println("</tr>");
                        out.println("</table>");
                     
                             
                 }
                
                PreparedStatement ps1 = conn.prepareStatement("update FDA.inbox set status='read'  where id="+n+" ");

                    

                 int rs1 = ps1.executeUpdate();  

            
            
    conn.close();  
   
        %>
    </body>
</html>
