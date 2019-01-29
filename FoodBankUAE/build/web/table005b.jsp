<%-- 
    Document   : table005b
    Created on : 28 Nov, 2018, 9:33:18 PM
    Author     : Sajid
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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



table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: none;
}

th, td {
    text-align: left;
    padding: 8px;
}

</style>
    <script type="text/javascript" src="js/jspdf.min.js"></script>    
    <script type="text/javascript" src="js/html2canvas.min.js"></script>
    </head>
    <body>
        
        <div class="container" >
            <div id="main">
            <div id="screenshot" onclick='makeScreenshot();' style="overflow-x:auto;">
                <table>
        <%
    String a=request.getParameter("fid");
    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st1 = conn.createStatement();
	
	ResultSet rs1 = st1.executeQuery("select  distinct charity_name,CALENDER,FB_LOC,TIME from FDA.DELIVERED where f_id='"+a+"'");    
                while(rs1.next())
                {
                    out.println("<tr>");
                    out.println("<td colspan='2'>");
                    out.println("FROM FOOD BANK  : ");
                    out.println("</td>");
                    out.println("<td colspan='4'>");
                    out.println(""+rs1.getString("fb_loc")+"");
                    out.println("</td>");
                    out.println("</tr>");
                    
                    out.println("<tr>");
                    out.println("<td colspan='2'>");
                    out.println("DATE  :  ");
                    out.println("</td>");
                    out.println("<td colspan='4'>");
                    out.println(""+rs1.getString("calender")+" ");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='2'>");
                    out.println("TIME  :  ");
                    out.println("</td>");
                    out.println("<td colspan='4'>");
                    out.println(""+rs1.getString("TIME")+" ");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='2'>");
                    out.println("TO CHARITY NAME  : ");
                    out.println("</td>");
                    out.println("<td colspan='4'>");
                    out.println(""+rs1.getString("charity_name")+"");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='6'>");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='6'>");
                    out.println("</td>");
                    out.println("</tr>");
                    
                }
%>
        
            <tr>
                <th>
                    CATEGORY
                </th>
                <th>
                    PRODUCT
                </th>
                <th>
                    BRAND
                </th>
                <th>
                    QTY
                </th>
                <th>
                    WT
                </th>
                <th>
                    Tt. KG
                </th>
            </tr>
            <%
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("select CATEGORY,PRODUCT,BRAND,QTY,NOS,WT from FDA.delivered where f_id='"+a+"'");    
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
                          out.println(""+rs.getString("brand")+"");
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
                          out.println("</tr>");
                        }
            
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                Statement st2 = con1.createStatement();
	
                ResultSet rs2 = st2.executeQuery("select  distinct SIGNEE from FDA.delivered where f_id='"+a+"'");    
                while(rs2.next())
                {
                    out.println("<tr>");
                    out.println("<td colspan='6'>");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='6'>");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='6'>");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='2'>");
                    out.println("Received BY  : ");
                    out.println("</td>");
                    out.println("<td colspan='4'>");
                    out.println(""+rs2.getString("signee")+"");
                    out.println("</td>");
                    out.println("</tr>");
                    
                }
%>
        </table>
        </div>
        
            </div>
        
            
        
        </div>
        </br>
        
        <a id="a-download" href="#">DOWNLOAD</a>
    <script type='text/javascript'>
  function makeScreenshot()
    {
        html2canvas(document.getElementById("screenshot"), {scale: 2}).then(canvas =>
        {
            canvas.id = "canvasID";
            var main = document.getElementById("main");
            while (main.firstChild) { main.removeChild(main.firstChild); }
            main.appendChild(canvas);
        });
    }
  
     document.getElementById("a-download").addEventListener('click', function()
    {
        
        var canvas=document.getElementById("canvasID");
        var imgData =canvas.toDataURL("image/png",y = canvas.width, x = canvas.height);
        var hratio = x/y;
                var doc = new jsPDF("l", "mm",'a4');
                var ht=285*hratio;
                doc.addImage(imgData, 'PNG', 10, 40,285,ht);
                doc.save('DELIVERY-REPORT.pdf');
    }, false);
  
  </script>
    </body>
</html>

