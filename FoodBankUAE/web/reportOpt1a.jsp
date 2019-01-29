<%-- 
    Document   : reportOpt1a
    Created on : 6 Dec, 2018, 5:11:42 PM
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

button{
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 50%;
    opacity: 0.9;
}
button:hover {
    opacity: 1;
}
        </style>
    </head>
    <body>
       
        <div class="flex">
            
            <button type="button" onclick="window.location.replace('report001.jsp')">CHARITY YEAR TOTAL</button></br>
            <button type="button" onclick="window.location.replace('report002.jsp')">EACH SUPPLIER YEAR TOTAL</button></br>
             <button type="button" onclick="window.location.replace('report003.jsp')">SUPPLIER YEAR TOTAL</button></br>
            <button type="button" onclick="window.location.replace('report004.jsp')">TOTAL QUANTITY RECEIVED BY YEAR</button></br>
             <button type="button" onclick="window.location.replace('report005.jsp')">TOTAL QUANTITY DELIVERED BY YEAR</button></br>
            <button type="button" onclick="window.location.replace('report006.jsp')">TOTAL QTY RECEIVED FOR EACH CATEGORY </button></br>
            <button type="button" onclick="window.location.replace('report007.jsp')">REJECTED ITEMS</button></br>
        
            <button type="button" onclick="window.location.replace('viewPhotos.jsp')">VIEW PHOTOS </button></br>
        
        </div>
     
    </body>
</html>

