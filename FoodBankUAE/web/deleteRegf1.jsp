<%-- 
    Document   : deleteRegf1
    Created on : 13 Dec, 2018, 8:59:40 AM
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
            String[] id = request.getParameterValues("idValue");
            
            for (int i = 0; i < id.length; i++) {
            
                int no=Integer.parseInt(id[i]);
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("DELETE FROM FDA.fridge WHERE ID = ?");
                    
                    st.setInt(1, no);
                    int rs = st.executeUpdate();  

                    if(rs>0)
                    {
                         System.out.println("Success");
                    }
                    
            
            }
            
            RequestDispatcher rv=request.getRequestDispatcher("deleteRegf.jsp");
            rv.forward(request, response);
            
        %>
    </body>
</html>
