<%-- 
    Document   : drv4
    Created on : 6 Dec, 2018, 6:20:00 AM
    Author     : Sajid
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
               input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 50%;
    opacity: 0.9;
}

input[type=submit]:hover {
    opacity: 1;
}
        </style>
    </head>
    <body>
        <form action="forDrv" method="post" enctype="multipart/form-data">
            <%
            
Calendar cal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
out.println("<input type='hidden'  name='time' value='"+sdf.format(cal.getTime())+"'>");

java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
out.println("<input type='hidden'  name='date' value='"+sqlDate+"'>");
%>
        
        <div class="flex">
            <label> DESTINATION </label> <input type="text" placeholder="Enter the place for donation" name="nm">
            <label> UPLOAD IMAGE </label> <input type="file" name="file">
            <input type="submit" value="SUBMIT">
        </div>
        </form>
    </body>
</html>