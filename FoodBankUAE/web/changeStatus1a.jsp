<%-- 
    Document   : changeStatus1a
    Created on : 13 Dec, 2018, 12:35:57 PM
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
            String a=request.getParameter("fid");
            HttpSession v=request.getSession();
            v.setAttribute("f_id", a);
            
            RequestDispatcher q=request.getRequestDispatcher("changeStatusA.jsp");
            q.forward(request, response);
        %>
    </body>
</html>
