<%-- 
    Document   : report001
    Created on : 28 Nov, 2018, 9:16:00 AM
    Author     : Sajid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .flex{
                    display: flex;
                    justify-content: center;
                    flex-flow: column;
                    align-items: center;
                    height: 100vh;
               }
        </style>
    </head>
    <body>
        <form action="report001a.jsp">
        <div class="flex">
            <label> FROM DATE </label> <input type="date" name="date1">
            <label> TO DATE </label> <input type="date" name="date2">
            <input type="submit" value="GO">
        </div>
        </form>
    </body>
</html>
