<%-- 
    Document   : fdi
    Created on : 6 Dec, 2018, 1:20:44 AM
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
       <script type="text/javascript">
            var xmlHttp;
            function show()
            {
                if(typeof XMLHttpRequest !== "undefined")
                {
                   xmlHttp= new XMLHttpRequest(); 
                }else if(window.ActiveXObject)
                {
                    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
                }
                if(xmlHttp === null)
                {
                    alert(" Browser does not support AJAX");
                    return;
                }
                var url = "countMail1.jsp";
                xmlHttp.onreadystatechange = change;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
            }
            
            function change()
            {
                if(xmlHttp.readyState === 4 || xmlHttp.readyState === "complete")
                {
                    document.getElementById("display").innerHTML=xmlHttp.responseText;
                    
                    
                }
            }

</script>
    </head>
    <body onload="show()">
       <center>
        <table class="flex" >
                <tr>
         <td>
            <center> <a href="userMail.jsp">   <img src="images/mail.png"  width="20%" height="65%"> </a></center></br>
            <center> <span id="display"></span></center></br></td><td>
                <center> <a href="location.jsp">   <img src="images/ma.jpg"  width="20%" height="10%"> </a></center></br>
                </td>
         </tr>
         <tr>
         <td>
            <center> <a href="user.jsp">   <img src="images/home.png"  width="40%" height="15%"> </a></center></br>
             
</td><td>
               <center> <a href="changeStatus.jsp">   <img src="images/check.png"  width="40%" height="15%"> </a></center></br>
          </td>
         </tr>
         <tr>
         <td>
           <center> <a href="transfer1a.jsp">   <img src="images/check2.png"  width="40%" height="15%"> </a></center></br>
        
</td><td>
                <center> <a href="close.jsp">   <img src="images/sign.png"  width="45%" height="15%"> </a></center>
         </td>
         </tr>
                
                
                
                
        
</table></center>
     
    </body>
</html>

