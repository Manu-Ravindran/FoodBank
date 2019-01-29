<%-- 
    Document   : user
    Created on : 6 Dec, 2018, 7:12:42 PM
    Author     : Sajid
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

#logo
	{
		text-align: center;
		margin-bottom: 4em;
	}
	
	
	#logo img
	{
		display: inline-block;
		margin-bottom: 1em;
		border-radius: 50%;
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
</head>
<body>

<div class="sidebar">
    </br>
    </br>
    </br>
    <div id="logo">
        <%
            Integer rid = (Integer)session.getAttribute("ids");
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("SELECT pic FROM  FDA.users where id="+rid+" ");    
                while(rs.next())
                {
                    byte[] bytes=rs.getBytes("pic");
                          byte[] encoded = Base64.getEncoder().encode(rs.getBytes("pic"));
                          String se=new String(encoded);
                          out.println("<img src='data:image/jpeg;base64,"+se+"' height='80%'width='80%' />");
                          
                }
        %>
			
			</div>
    <a href="dashboard.jsp" target="mn1">DASHBOARD</a>
    <a href="updtAcc.jsp" target="mn1">MY ACCOUNT</a>
    <a href="reportOpt1.jsp" target="mn1">VIEW REPORTS</a>
    
    <a href="userRcv.jsp" target="mn1">RECEIVE</a>
    <a href="fdi.jsp">GO BACK</a>
  <a href="index.html">SIGN-OUT</a>
</div>

<div class="content">
    <iframe name="mn1" width="100%" height="100%" frameborder="0">
    </iframe>
</div>


</body>
</html>
