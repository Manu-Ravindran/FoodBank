<%-- 
    Document   : adminSent
    Created on : 15 Dec, 2018, 9:30:01 PM
    Author     : Sajid
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>

<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 40%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
input [type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

input [type=submit] :hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}


</style>
<script type="text/javascript">
            var xmlHttp;
            function show(str)
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
                var url = "showSent4.jsp";
                url+="?count=" + str;
                xmlHttp.onreadystatechange = change;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
            }
            
            function change()
            {
                if(xmlHttp.readyState === 4 || xmlHttp.readyState === "complete")
                {
                    document.getElementById("display").innerHTML=xmlHttp.responseText;
                    document.getElementById('id01').style.display='block';
                    
                    
                }
            }

</script>
</head>
<body>
    <form action="sentDel4.jsp" enctype="multipart/form-data">
<div style="overflow-x:auto;">
  <table>
    <tr>
        <th>to</th>
      <th>DATE</th>
      <th>MAIL</th>
      <th>&nbsp;&nbsp;&nbsp;</th>
    </tr>
    <%

            
                    
                    
                    Class.forName("org.apache.derby.jdbc.ClientDriver");

                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                        
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM FDA.send  where sender='admin' ");

                    

                 ResultSet rs = ps.executeQuery();   
                while(rs.next())
                 {
                     
                       out.println("<tr>");
                       out.println("<td>"+rs.getString("receiver")+"</td>");
                       out.println("<td>"+rs.getString("SDATE")+"    "+rs.getString("STIME")+"</td>");
                       out.println("<td><a href='#' onclick='show("+rs.getInt("id")+")'>"+rs.getString("sub")+"</a></td>");
                    
                        out.println("<td>");
                       out.println("<input type='checkbox' name='idVal' value='"+rs.getInt("id")+"'>");
                       out.println("</td>");
                       out.println("</tr>");
                     
                             
                 }
                


            
            %> 
    
  </table>
</div>
            <input type="submit" value="DELETE">
</form>
            <form action="adminMail.jsp">
                <input type="submit" value="GO BACK">
            </form>
            
<div id="id01" class="modal">
    
  <div class="modal-content animate" >
      <div class="container">
    
   
    <span id="display"></span>
    
  

    
      
    </div>

    
  </div>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
</html>
