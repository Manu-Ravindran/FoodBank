<%-- 
    Document   : updtUser
    Created on : 13 Dec, 2018, 7:00:29 PM
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
body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: black;
}

* {
    box-sizing: border-box;
}

/* Add padding to containers */
.container {
    padding: 16px;
    background-color: white;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 20%;
    opacity: 0.9;
}

button:hover {
    opacity: 1;
}


/* Full-width input fields */



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

input[type=submit]:hover {
    opacity: 1;
}


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
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
$('#pwd1, #pwd2').on('keyup', function () {
  if ($('#pwd1').val() == $('#pwd2').val()) {
    $('#message').html('Matching').css('color', 'green');
  } else 
    $('#message').html('Not Matching').css('color', 'red');
});
</script>
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
                var url = "show1.jsp";
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
                    
                }
            }
            
            function check()
            {
                var a=document.getElementById("pwd1").value;
                var b=document.getElementById("pwd2").value;
                if(a==b)
                {
                   document.getElementById("message").innerHTML='correct'; 
                }
                else
                {
                   document.getElementById("message").innerHTML='un Matched'; 
                }
                   
                
            }
            
        </script>
        
    </head>
    <body >
    
        <div class="container">
            <form name="vinform" action="updtDispatcher00001.jsp">
                 <div style="overflow-x:auto;"> 
          <table>
    <tr>
      <th>FIRST NAME</th>
      <th>LAST NAME</th>
      <th>COMPANY</th>
      <th>BRANCH</th>
      <th>USERNAME</th>
      <th>CONTACT</th>
      <th>EMAIL</th>
      <th>&nbsp;&nbsp;&nbsp;</th>
    </tr>
        <%
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("SELECT * FROM FDA.USERS where SCOPE='user' or SCOPE='store' or SCOPE='charity'  ");
	
	ResultSet rs = st.executeQuery();  

        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>");
            out.println(""+rs.getString("firstname")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("lastname")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("company")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("branch")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("username")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("tel")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("email")+"");
            out.println("</td>");
            out.println("<td>");
            out.println("<input type='radio' name='idVal' value='"+rs.getInt("id")+"'>");
            
            out.println("</td>");
            out.println("</tr>");
        }
        %>
          </table>
    <label for="cat"><b>EDIT</b></label>
        <select name="upd1" id="upd1"  onchange="show(this.value)">
        <option value=''>SELECT AN OPTION</option>
        <option value='fnm'>FIRST NAME</option>
        <option value='lnm'>LAST NAME</option>
        <option value='dob'>DOB</option>
        <option value='ct'>CONTACT</option>
        <option value='em'>EMAIL</option>
        <option value='pass'>PASSWORD</option>
          
    </select>
    
    <span id="display"> </span>
      
   </br></br>
   <input type="submit" value="CHANGE"/></br></br>
   </br></br>
                
            </form>
           
        </div>
    </body>
</html>
