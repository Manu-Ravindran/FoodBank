<%-- 
    Document   : indexSend
    Created on : 22 Dec, 2018, 5:15:02 AM
    Author     : Sajid
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
            Calendar cal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
            
            
            String tel=request.getParameter("ph");
            String name=request.getParameter("nm");
            String msg=request.getParameter("msg");
            
            String sender=request.getParameter("eml");;
            
            
            
             int rs=0;
             int r=0;
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("INSERT INTO FDA.INBOX (SENDER, RECEIVER, RDATE, RTIME, MSG,SUB) VALUES (?, ?, ?, ?, ?, ?)");
                    st.setString(1, sender);
                    st.setString(2, "admin");
                    st.setDate(3, sqlDate);
                    st.setString(4, sdf.format(cal.getTime()));
                    st.setString(5, msg);
                    st.setString(6,"Customer Name : "+name+" ,Phone: "+tel);
                    rs = st.executeUpdate(); 
                    
                    PreparedStatement s = connection.prepareStatement("INSERT INTO FDA.SEND (SENDER, RECEIVER, SDATE, STIME, MSG,SUB)VALUES (?, ?, ?, ?, ?, ?)");
                    s.setString(1, sender);
                    s.setString(2, "admin");
                    s.setDate(3, sqlDate);
                    s.setString(4, sdf.format(cal.getTime()));
                    s.setString(5, msg);
                    s.setString(6,"Customer Name : "+name+" ,Phone: "+tel);
                    r = s.executeUpdate();

                    if(rs>0&&r>0)
                    {
                         RequestDispatcher q=request.getRequestDispatcher("index.html");
                         q.forward(request, response);
                    }
            }
            catch(Exception e)
            {
                out.println(e);
            }
            
            
        %>
    </body>
</html>
