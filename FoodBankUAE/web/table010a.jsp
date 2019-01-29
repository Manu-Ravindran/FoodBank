<%-- 
    Document   : table010a
    Created on : 12 Dec, 2018, 11:35:09 PM
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
        <div class="container" >
            <div id="main">
            <div id="screenshot"  style="overflow-x:auto;">
          
        <table>
            <tr>
                <th>
                    Ref ID
                </th>
                <th>
                    Status
                </th>
                <th>
                    loc(Copy text)
                </th>
                <th>
                    TIME
                </th>
                <th>
                    DATE
                </th>
                <th>
                    IMAGE3
                </th>
            </tr>
            <%
                String d1=request.getParameter("date1");
                String d2=request.getParameter("date2");
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("SELECT * FROM  FDA.FR_REP where datein>='"+d1+"'and datein<='"+d2+"' ");    
                while(rs.next())
                      {
                          out.println("<tr>");
                          out.println("<td>");
                          out.println(""+rs.getString("IDNO")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("STATUS")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("LAT")+" "+rs.getString("LOG")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("timein")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("datein")+"");
                          out.println("</td>");
                          out.println("<td >");
                          byte[] encoded = Base64.getEncoder().encode(rs.getBytes("pic"));
                          String se=new String(encoded);
                          if(encoded.length==0)
                          {
                          
                          }
                          else
                          {
                              out.println("<img src='data:image/jpeg;base64,"+se+"' height=\"200\" width=\"400\" />");
                          out.println("</br>");
                          }
                              
                          
                          byte[] encoded1= Base64.getEncoder().encode(rs.getBytes("pic2"));
                          String se1=new String(encoded1);
                          if(encoded1.length==0)
                          {
                          
                          }
                          else
                          {
                              out.println("<img src='data:image/jpeg;base64,"+se1+"' height=\"200\" width=\"400\" />");
                          out.println("</br>");
                          }
                          byte[] encoded2 = Base64.getEncoder().encode(rs.getBytes("pic3"));
                          String se2=new String(encoded2);
                          if(encoded2.length==0)
                          {
                          }
                          else
                          {
                              out.println("<img src='data:image/jpeg;base64,"+se2+"' height=\"200\" width=\"400\" />");
                          
                          }
                          out.println("</td>");
                          out.println("</tr>");
                        }
            %>
            
        </table>
        </div>
        
            </div>
        
            
        
        </div>
        </br>
    
    </body>
</html>

