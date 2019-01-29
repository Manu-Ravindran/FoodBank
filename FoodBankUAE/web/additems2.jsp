<%-- 
    Document   : additems1
    Created on : 6 Dec, 2018, 6:41:54 PM
    Author     : Sajid
--%>
  
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
            <button type="button" onclick="window.location.replace('deleteRegf.jsp')">DELETE REFRIGERATOR LOCATION</button></br>
            
            <button type="button" onclick="window.location.replace('deleteSupplier.jsp')">DELETE SUPPLIER</button></br>
            <button type="button" onclick="window.location.replace('deleteProduct.jsp')">DELETE CATEGORY&PRODUCT</button></br>
             <button type="button" onclick="window.location.replace('deleteBrand.jsp')">DELETE BRAND</button></br>
            <button type="button" onclick="window.location.replace('deleteFB.jsp')">DELETE FOOD BANK LOC</button></br>
             <button type="button" onclick="window.location.replace('deleteCharity.jsp')">DELETE CHARITY ORGANIZATION</button></br>
        
        </div>
     
    </body>
</html>

