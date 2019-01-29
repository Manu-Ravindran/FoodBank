<%-- 
    Document   : addProduct
    Created on : 5 Dec, 2018, 2:27:07 AM
    Author     : Sajid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
               label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}
               input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 20%;
    opacity: 0.9;
}
input[type=submit],button:hover {
    opacity: 1;
}
        </style>
    </head>
    <body>
        <form action="addFBa.jsp">
        <div class="flex">
            <label><b>FB NAME</b></label> <input type="text" name="nm">
            <label><b>LOCATION</label> </b><input type="text" name="loc"></br>
            <input type="submit" value="SUBMIT">
        </div>
        </form>
    </body>
</html>

