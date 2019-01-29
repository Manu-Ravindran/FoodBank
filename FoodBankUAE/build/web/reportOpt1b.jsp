<%-- 
    Document   : reportOpt1b
    Created on : 6 Dec, 2018, 5:11:57 PM
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
            
            <button type="button" onclick="window.location.replace('table001.jsp')">CHARITY YEAR TOTAL</button></br>
            <button type="button" onclick="window.location.replace('table002.jsp')">EACH SUPPLIER YEAR TOTAL</button></br>
             <button type="button" onclick="window.location.replace('table003.jsp')">SUPPLIER YEAR TOTAL</button></br>
            <button type="button" onclick="window.location.replace('table004.jsp')">DAILY RECEIVED </button></br>
             <button type="button" onclick="window.location.replace('table005.jsp')">DAILY DELIVERED</button></br>
            <button type="button" onclick="window.location.replace('table006.jsp')">TOTAL QTY RECEIVED FOR EACH YEAR </button></br>
            <button type="button" onclick="window.location.replace('table007.jsp')">TOTAL QTY DELIVERED FOR EACH YEAR </button></br>
            <button type="button" onclick="window.location.replace('table008.jsp')">TOTAL QTY RECEIVED FOR EACH CATEGORY</button></br>
            
            <button type="button" onclick="window.location.replace('table009.jsp')">CHARITY DELIVERY RECEIPT</button></br>
            <button type="button" onclick="window.location.replace('table011.jsp')">REJECTED ITEMS</button></br>
       
        </div>
     
    </body>
</html>

