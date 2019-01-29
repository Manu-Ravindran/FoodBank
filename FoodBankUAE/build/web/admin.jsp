<%-- 
    Document   : admin
    Created on : 6 Dec, 2018, 1:20:29 AM
    Author     : Sajid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
  margin: 0;
  font-family: "Lato", sans-serif;
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #ff8c00;
  position: fixed;
  height: 100%;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #4CAF50;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
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
                var url = "countMail4.jsp";
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

<div class="sidebar">
    <a href="adminMail.jsp" target="mn1">MY MAIL</a>
    <span id="display" style="font-size: 10px !important; color:white !important;"></span>
    <a href="updtAcc4.jsp" target="mn1">MY ACCOUNT</a>
    <a href="additems.jsp" target="mn1">ADD ITEMS</a>
    <a href="addUsers.jsp" target="mn1">ADD USERS</a>
    <a href="table010.jsp" target="mn1">VIEW MAINTENANCE REP</a>
    <a href="updtUser.jsp" target="mn1">UPDATE USERS</a>
    <a href="delUser.jsp" target="mn1">DELETE USERS</a>
    <a href="cache.jsp" target="mn1">CLEAR CACHE</a>
    <a href="clearNULL1.jsp" target="mn1">CLEAR NULL RC</a>
    <a href="adminDash.jsp" target="mn1">DASHBOARD</a>
  <a href="close.jsp">SIGN-OUT</a>
</div>

<div class="content">
    <iframe name="mn1" width="100%" height="100%" frameborder="0">
    </iframe>
</div>


</body>
</html>
