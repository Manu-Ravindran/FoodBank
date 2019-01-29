<%-- 
    Document   : updt00003
    Created on : 14 Dec, 2018, 7:13:13 PM
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
            
            Integer rid = (Integer)session.getAttribute("id1");
            String dob=(String)session.getAttribute("dob");
             int rs=0;
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.USERS SET DOB= ? WHERE ID = ?");
                    
                    st.setString(1, dob);
                    st.setInt(2, rid);
                    rs = st.executeUpdate();  

                    if(rs>0)
                    {
                        RequestDispatcher rv=request.getRequestDispatcher("updtUser.jsp");
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