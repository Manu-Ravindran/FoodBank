<%-- 
    Document   : session2
    Created on : 28 Nov, 2018, 5:18:37 AM
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
           
           String c=request.getParameter("fbloc");
           HttpSession u=request.getSession();
            u.setAttribute("fbloc2",c);
            
            RequestDispatcher rs=request.getRequestDispatcher("deliver003.jsp");
            rs.forward(request, response);
       %>
    </body>
</html>
