<%-- 
    Document   : table009
    Created on : 6 Dec, 2018, 10:38:53 AM
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
        <form action="table009a.jsp">
        <div class="flex">
            <label> FROM YEAR </label> <input type="date" name="date1">
            <label> TO YEAR </label> <input type="date" name="date2">
            <input type="submit" value="GO">
        </div>
        </form>
    </body>
</html>
