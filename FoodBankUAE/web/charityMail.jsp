<%-- 
    Document   : charityMail
    Created on : 15 Dec, 2018, 8:48:27 PM
    Author     : Sajid
--%>
  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body {
    font-family: Arial, Helvetica, sans-serif;
}
            .flex{
                    justify-content: center;
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
img:hover{
 -moz-box-shadow: 3px 3px 5px #999;
 -webkit-box-shadow: 7px 7px 10px #999;
 box-shadow: 10px 10px 14px #90DAFF;
 -webkit-transition: all .2s ease;
transition: all .2s ease;
}
        </style>
    </head>
    <body>
       <center>
        <table class="flex" >
         <tr>
         <td>
        <center> <a href="charityInbox.jsp">   <img src="images/inbox.png"   width="40%" height="65%"> </a></center></br>
        <center><b><font style="color: blue">INBOX</font></b></center>
         </td>
         </tr>
         <tr>
         <td>
        <center> <a href="charitySent.jsp">   <img src="images/sent.png"  width="40%" height="80%"> </a></center></br>
        <center><b><font style="color: blue">SENT</font></b></center>
        </td>
        </tr>
        <tr>
         <td>
        <center> <a href="charitySend01.jsp">   <img src="images/Compose.png"  width="40%" height="33%"> </a></center></br>
        <center><b><font style="color: blue">COMPOSE</font></b></center>
         </td>
        </tr>
        <tr>
         <td>
        <center><button type="button" onclick="window.location.replace('charity.jsp')">GO BACK</button></br>
        </center>
          </td>
        </tr>
        </table>
       </center>
     
    </body>
</html>

