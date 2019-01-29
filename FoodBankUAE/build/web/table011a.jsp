<%-- 
    Document   : table011a
    Created on : 29 Dec, 2018, 11:58:09 PM
    Author     : Sajid
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
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
    border: 1px solid #ddd;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>
    <script type="text/javascript" src="js/jspdf.min.js"></script>   
    <script type="text/javascript" src="js/html2canvas.min.js"></script>
    </head>
    <body>
        <%
    String a1=request.getParameter("date1");
    String b1=request.getParameter("date2");
%>
        <div class="container" >
            <div id="main">
            <div id="screenshot" onclick='makeScreenshot();' style="overflow-x:auto;">
          
        <table>
            <tr>
                <th>
                    VENDOR
                </th>
                <th>
                    BRANCH
                </th>
                <th>
                    FROM FB-LOC.
                </th>
                <th>
                    PRODUCT
                </th>
                <th>
                    BRAND
                </th>
                <th>
                    MFD
                </th>
                <th>
                    EXP
                </th>
                <th>
                    QTY
                </th>
                <th>
                    WT
                </th>
                <th>
                    Tt KG.
                </th>
                <th>
                    DATE
                </th>
                <th>
                    REASON
                </th>
            </tr>
            <%
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("SELECT * FROM  FDA.REJECT where RDATE>='"+a1+"' and RDATE<='"+b1+"' order by year(RDATE) desc ");    
                while(rs.next())
                      {
                          out.println("<tr>");
                          out.println("<td>");
                          out.println(""+rs.getString("VENDOR")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("V_LOC")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("FBLOC")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("PRODUCT")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("BRAND")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getDate("MFD")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getDate("EXP")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getDouble("NOS")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getDouble("WT")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getDouble("QTY")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getDate("RDATE")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("COMMENT")+"");
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
                doc.addImage(imgData, 'PNG', 10, 100,285,ht);
                doc.save('DELIVERY-REPORT.pdf');
    }, false);
  
  </script>
    </body>
</html>

