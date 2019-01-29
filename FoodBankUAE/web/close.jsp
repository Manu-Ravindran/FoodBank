<%-- 
    Document   : close
    Created on : 16 Dec, 2018, 12:13:28 AM
    Author     : Sajid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate(); 

    RequestDispatcher s1=request.getRequestDispatcher("index.html");
             s1.forward(request, response);
%>
    
