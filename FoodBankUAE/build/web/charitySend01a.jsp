<%-- 
    Document   : charitySend01a
    Created on : 15 Dec, 2018, 9:04:43 PM
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
            
            
            String rcv=request.getParameter("send");
            String[] spl = rcv.split(",");
            String sub=request.getParameter("sub");
            String time=request.getParameter("time");
            String date=request.getParameter("date");
            String msg=request.getParameter("msg");
            
            String sender=(String)session.getAttribute("cname");
            
            for (int i = 0; i < spl.length; i++) {
            
             int rs=0;
             int r=0;
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("INSERT INTO FDA.INBOX (SENDER, RECEIVER, RDATE, RTIME, MSG,SUB) VALUES (?, ?, ?, ?, ?, ?)");
                    st.setString(1, sender);
                    st.setString(2, spl[i]);
                    st.setString(3, date);
                    st.setString(4, time);
                    st.setString(5, msg);
                    st.setString(6, sub);
                    rs = st.executeUpdate(); 
                    
                    PreparedStatement s = connection.prepareStatement("INSERT INTO FDA.SEND (SENDER, RECEIVER, SDATE, STIME, MSG,SUB)VALUES (?, ?, ?, ?, ?, ?)");
                    s.setString(1, sender);
                    s.setString(2, spl[i]);
                    s.setString(3, date);
                    s.setString(4, time);
                    s.setString(5, msg);
                    s.setString(6, sub);
                    r = s.executeUpdate();

                    if(rs>0&&r>0)
                    {
                         
                    }
            }
            catch(Exception e)
            {
                out.println(e);
            }
            }
            RequestDispatcher q=request.getRequestDispatcher("charityMail.jsp");
                         q.forward(request, response);
        %>
    </body>
</html>
