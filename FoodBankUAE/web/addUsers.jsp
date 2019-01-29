<%-- 
    Document   : addUsers
    Created on : 6 Dec, 2018, 6:53:04 PM
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
            
            <button type="button" onclick="window.location.replace('signUpUser.jsp')">ADD FOOD BANK INSPECTOR</button></br>
            <button type="button" onclick="window.location.replace('signUpVendor.jsp')">ADD VENDOR EMPLOYEE</button></br>
            <button type="button" onclick="window.location.replace('signUpCharity.jsp')">ADD CHARITY ORG EMPLOYEE</button></br>
            
        </div>
     
    </body>
</html>

