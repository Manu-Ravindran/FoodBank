<%-- 
    Document   : charity
    Created on : 6 Dec, 2018, 1:21:10 AM
    Author     : Sajid
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
                var url = "countMail3.jsp";
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
            
            <center> <a href="charityMail.jsp">   <img src="images/mail.png"  width="25%" height="15%"> </a></center></br>
            <center> <span id="display"></span></center></br>
            

            
            <center> <a href="updtAcc3.jsp">   <img src="images/acc.png"  width="15%" height="15%"> </a></center></br>
             
                <center> <a href="drv.jsp">   <img src="images/delv.png"  width="15%" height="15%"> </a></center></br>
        
        
                <center> <a href="close.jsp">   <img src="images/sign.png"  width="15%" height="15%"> </a></center>
            </div>
     <%
        
        Class.forName("org.apache.derby.jdbc.ClientDriver");  
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
        PreparedStatement ps=conn.prepareStatement("INSERT INTO FDA.IDEN2 (NIL) VALUES ('gen2')"); 
        
        int rss=ps.executeUpdate();  
    %>
    </body>
</html>


