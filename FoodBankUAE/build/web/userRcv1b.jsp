<%-- 
    Document   : userRcv1b
    Created on : 8 Dec, 2018, 6:07:29 AM
    Author     : Sajid
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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

/* Full-width input fields */
select {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}
input {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}
input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

/* Overwrite default styles of hr */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}

/* Set a style for the submit button */
input[type=submit],button {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

input[type=submit],button:hover {
    opacity: 1;
}

/* Add a blue text color to links */
a {
    color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
    background-color: #f1f1f1;
    text-align: center;
}


</style>

<script type="text/javascript">
            var xmlHttp;
            function showProd(str)
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
                var url = "try2.jsp";
                url+="?count=" + str;
                xmlHttp.onreadystatechange = prodChange;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
            }
            
            function prodChange()
            {
                if(xmlHttp.readyState === 4 || xmlHttp.readyState === "complete")
                {
                    document.getElementById("product").innerHTML=xmlHttp.responseText;
                }
            }
            
            
            function showBrand(str)
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
                var url = "brd.jsp";
                url+="?count=" + str;
                xmlHttp.onreadystatechange = brandChange;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
            }
            
            function brandChange()
            {
                if(xmlHttp.readyState === 4 || xmlHttp.readyState === "complete")
                {
                    document.getElementById("brand").innerHTML=xmlHttp.responseText;
                }
            }
            
            
        </script>



    </head>
    <body>
        

    
        <form action="userRcv1c.jsp">
    
  <div class="container">
        
        <label for="cat"><b>SELECT CATEGORY</b></label>
        <select name="category" id="category" onchange="showProd(this.value)">
        <option>Select a Category</option>
        <%
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("SELECT distinct category FROM FDA.PRODUCT  ");
	
	ResultSet rs = st.executeQuery();  

        while(rs.next())
        {
            out.println("<option value='"+rs.getString("category")+"'>"+rs.getString("category")+"</option>");
        }
        %>
    </select>
    
    <label for="prod"><b>SELECT PRODUCT</b></label>
    
    <select id="product" name="product" id="product" onchange="showBrand(this.value)">
          <option value='-1'>Select a Product</option>
          
        </select>
    
    <label for="brand"><b>SELECT BRAND</b></label>
    
    <select id="brand" name="brand" >
          <option value='-1'>Select a Brand</option>
          
        </select>
    
    <label for="mfd"><b>ENTER MANUFACTURING DATE</b></label>
    <input type="date" id="mfd" name='mfd'/>
    
    <label for="exp"><b>ENTER EXPIRY DATE</b></label>
    <input type="date" id="exp" name='exp'/>
    
    <label for="qty"><b>ENTER QUANTITY</b></label>
    <input type="text" id='qt' name='qt'/>
   
    <label for="unit"><b>ENTER UNIT</b></label>
    <select id='unit' name="unit" >
          <option value='kg'>KG</option>
        </select>
   </br></br>
   <%
       out.println("<input type='hidden' name='date' value='"+new java.sql.Date(new java.util.Date().getTime())+"'>");
   %>
   <input type="submit" value="ADD"/>
   </br></br>
       

   
  </div>
  
</form>
    </body>
</html>
