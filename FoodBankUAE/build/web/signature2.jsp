<%-- 
    Document   : signature2
    Created on : 28 Nov, 2018, 6:27:55 AM
    Author     : Sajid
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  


  <title>Signature Pad demo</title>

  <style>
body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: black;
}

* {
    box-sizing: border-box;
}



/* Full-width input fields */
select {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

select:focus {
    background-color: #ddd;
    outline: none;
}

/* Overwrite default styles of hr */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for the submit button */
input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

input[type=submit] :hover {
    opacity: 1;
}


</style>
  
</head>

<body onselectstart="return false">


<form action="transfer" method="POST"> 
    <script src="js/jquery.min.js" ></script>
<script type="text/javascript">
$(document).ready(function () {

    $("#nm").change(function () {
  var cntrol = $(this);
  
  var a = cntrol.find(':selected').data('cname');  
  document.getElementById('charity').value = a;
 });

});
</script>

    <label><b>TO</b></label></br></br>
<select id="nm" name="nm">
        <option>TO Charity Employee Name</option>
        <%
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement statement = connection.createStatement();
	 
	ResultSet rs = statement.executeQuery("SELECT * FROM FDA.USERS where scope='charity'");  

        while(rs.next())
        {
            out.println("<option value='"+rs.getString("USERNAME")+"' data-cname='"+rs.getString("company")+"'>"+rs.getString("company")+" ORG  -"+rs.getString("USERNAME")+"</option>");
        }
        %>
    </select>
        <input type="hidden" id="charity" name="charity" />  
<%
            
Calendar cal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
out.println("<input type='hidden'  name='time' value='"+sdf.format(cal.getTime())+"'>");
java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
out.println("<input type='hidden'  name='date' value='"+sqlDate+"'>");
                    
%>
    
<input type="submit" value="submit"/>

</form>



</body>

</html>
