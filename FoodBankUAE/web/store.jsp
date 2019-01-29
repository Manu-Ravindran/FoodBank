<%-- 
    Document   : store
    Created on : 6 Dec, 2018, 1:20:59 AM
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
                var url = "countMail2.jsp";
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
        
        <div class="flex">
            
            <center> <a href="storeMail.jsp">   <img src="images/mail.png"  width="25%" height="15%"> </a></center></br>
            <center> <span id="display"></span></center></br>
            
            
             <center> <a href="updtAcc2.jsp">   <img src="images/acc.png"  width="15%" height="15%"> </a></center></br>
             
                <center> <a href="receive1.jsp">   <img src="images/do.png"  width="15%" height="15%"> </a></center></br>
        
        
                <center> <a href="close.jsp">   <img src="images/sign.png"  width="15%" height="15%"> </a></center>
            
        </div>
    </body>
</html>
