<%-- 
    Document   : inboxDel4
    Created on : 15 Dec, 2018, 9:27:03 PM
    Author     : Sajid
--%>
<%-- 
    Document   : inboxDel3
    Created on : 15 Dec, 2018, 8:54:07 PM
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
            String[] id = request.getParameterValues("idVal");
            
            
            for (int i = 0; i < id.length; i++)
            {
                int no=Integer.parseInt(id[i]);     
            
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("DELETE FROM FDA.inbox WHERE ID = ?");
                    
                    st.setInt(1, no);
                    int rs = st.executeUpdate();  

                    if(rs>0)
                    {
                         
                    }
                
                
            
            }
            
            RequestDispatcher rv=request.getRequestDispatcher("adminInbox.jsp");
                         rv.forward(request, response);
            
            
        %>
    </body>
</html>
