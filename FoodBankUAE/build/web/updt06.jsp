<%-- 
    Document   : updt06
    Created on : 14 Dec, 2018, 6:36:30 PM
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
            
            Integer rid = (Integer)session.getAttribute("ids");
            String pass=(String)session.getAttribute("pass");
             int rs=0;
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.USERS SET PASSWORD= ? WHERE ID = ?");
                    
                    st.setString(1, pass);
                    st.setInt(2, rid);
                    rs = st.executeUpdate();  

                    if(rs>0)
                    {
                        RequestDispatcher rv=request.getRequestDispatcher("updtAcc2.jsp");
                         rv.forward(request, response);
                    }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
    </body>
</html>