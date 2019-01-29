<%-- 
    Document   : drvModify
    Created on : 23 Nov, 2018, 11:58:13 AM
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
            var xmlHttp;
            
            function showCat()
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
                var url = "showCat.jsp";
                xmlHttp.onreadystatechange = changeCat;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
            }
            
            function changeCat()
            {
                if(xmlHttp.readyState === 4 || xmlHttp.readyState === "complete")
                {
                    document.getElementById("category").innerHTML=xmlHttp.responseText;
                    
                }
            }
            
            
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
                var url = "show.jsp";
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
                    showCat();
                }
            }
            
            
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
    <body >
        
        <div class="container">
            <form name="vinform" action="modify">
                <label for="cat"><b>SELECT INPUT YOU WANT TO MODIFY</b></label>
                 <div style="overflow-x:auto;"> 
          <table>
    <tr>
      <th>CATEGORY</th>
      <th>PRODUCT</th>
      <th>BRAND</th>
      <th>MFD</th>
      <th>EXP</th>
      <th>QTY</th>
      <th>WT</th>
      <th>Tt. KG</th>
      <th>&nbsp;&nbsp;&nbsp;</th>
    </tr>
        <%
        Integer rid = (Integer) session.getAttribute("idnm");
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("SELECT * from FDA.temp where f_id=?  ");
	st.setInt(1, rid);
	ResultSet rs = st.executeQuery();  

        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>");
            out.println(""+rs.getString("category")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("product")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("BRAND")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("MFD")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("EXP")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getDouble("nos")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getDouble("wt")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getDouble("qty")+"");
            out.println("</td>");
            out.println("<td>");
            out.println("<input type='radio' name='idVal'  value='"+rs.getInt("id")+"'>");
            
            out.println("</td>");
            out.println("</tr>");
        }
        %>
          </table>
    <label for="cat"><b>EDIT</b></label>
        <select name="upd" id="upd"  onchange="show(this.value)">
        <option value=''>SELECT AN OPTION</option>
        <option value='cat'>CHANGE CATEGORY & PRODUCT & BRAND</option>
        <option value='mfd'>CHANGE MFD</option>
        <option value='exp'>CHANGE EXP</option>
        <option value='qty'>CHANGE QTY</option>
        <option value='wt'>CHANGE WEIGHT PER QTY</option>
          
    </select>
    
    <span id="display"> </span>
      
   </br></br>
   <input type="submit" value="CHANGE"/></br></br>
   </br></br>
                
            </form>
          <button type="button" onclick="window.location.replace('print.jsp')">NEXT</button>&nbsp;&nbsp;
             
        </div>
    </body>
</html>
