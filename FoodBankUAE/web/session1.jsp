<%-- 
    Document   : session1
    Created on : 28 Nov, 2018, 5:09:35 AM
    Author     : Sajid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           String b=request.getParameter("bloc");
           String c=request.getParameter("fbloc");
           HttpSession u=request.getSession();
            u.setAttribute("bloc",b);
            u.setAttribute("fbloc1",c);
            
            RequestDispatcher rs=request.getRequestDispatcher("DriverBt3.jsp");
            rs.forward(request, response);
       %>
    </body>
</html>
