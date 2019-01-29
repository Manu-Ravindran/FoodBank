<%-- 
    Document   : location
    Created on : 12 Dec, 2018, 5:09:21 PM
    Author     : Sajid
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}


.container {
    padding: 16px;
}


/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
    </head>
    <body onload="getLocation()">
        <form action="addloc" method="post" enctype="multipart/form-data">    
        <div class="container">
    <label for="uname"><b>SELECT LOC</b></label>
    <select name="floc">
        <option>Select a Location</option>
        <%
            String nm=(String)session.getAttribute("uname");
            
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement statement = connection.createStatement();
	 
	ResultSet rs = statement.executeQuery("SELECT * FROM FDA.fridge where USERID = '"+nm+"' ");  

        while(rs.next())
        {
            out.println("<option value='"+rs.getString("idno")+"'>"+"ID : "+rs.getString("idno")+" | LOC : "+rs.getString("loc")+"</option>");
        
        
        
        }
        
        %>
    </select>

    <label for="psw"><b>STATUS</b></label>
    <input type="text"  name="st" required>
    <%
            
Calendar cal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
out.println("<input type='hidden'  name='time' value='"+sdf.format(cal.getTime())+"'>");

java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
out.println("<input type='hidden'  name='date' value='"+sqlDate+"'>");
out.println("<input type='hidden'  name='usr' value='"+nm+"'>");
%>
    
    <input type="hidden" id="demo" name="log" >
    <input type="hidden" id="demo1" name="lat" >
    <label> IMAGE 1 </label> <input type="file" name="file1"></BR></BR>
    <label> IMAGE 2</label> <input type="file" name="file2"></BR></BR>
    <label> IMAGE 3</label> <input type="file" name="file3">
    
    <button type="submit">SUBMIT</button>
    
  </div>
        </form>
        
        <script>
var x = document.getElementById("demo");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    document.getElementById("demo").value=position.coords.longitude;
    document.getElementById("demo1").value=position.coords.latitude;
    
}
</script>


    </body>
</html>
