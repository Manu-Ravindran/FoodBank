<%-- 
    Document   : RPgraph
    Created on : 18 Nov, 2018, 7:54:15 PM
    Author     : Sajid
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
    <link rel="stylesheet" href="demos.css" type="text/css" media="screen" />
    
    <script src="chart/RGraph.common.core.js" ></script>
    <script src="chart/RGraph.bar.js" ></script>
    <script type="text/javascript" src="js/html2canvas.min.js"></script>

</head>
<body>

<div id="main">
           <div id="screenshot" onclick='makeScreenshot();'>
    <canvas id="cvs" width="800" height="600">[No canvas support]</canvas>
           </div>
</div>

    
    <a id="a-download" href="#" >Download a screenshot</a>

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
        this.href = document.getElementById("canvasID").toDataURL();
        this.download = "canvas-image.png";
    }, false);
  
  </script>
   
    
    
    <script>
        window.onload = function ()
        {
            var data = [
                <%
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement statement = connection.createStatement();
	
	ResultSet rs = statement.executeQuery("select supplier, sum(qty) from RECEIVE group by supplier order by sum(qty) desc");    
                while(rs.next())
                      {
                          out.println(""+rs.getInt("2")+",");
                        }
            %>
            ];

            var bar = new RGraph.Bar({
                id: 'cvs',
                data: data,
                options: {
                    ymax: 10000,
                    noxaxis: true,
                    labels: [
                        <%
                        ResultSet rss = statement.executeQuery("select supplier, sum(qty) from RECEIVE group by supplier order by sum(qty) desc");
                    while(rss.next())
                    {
                     out.println("'"+rss.getString("SUPPLIER")+"',");
                    }
                    %>
                    ],
                    labelsAbove: true,
                    unitsPost: ' KG ',
                    colors: ['darkorange'],
                    backgroundGrid: false,
                    gutterLeft: 100,
                    gutterRight: 5,
                    strokestyle: 'rgba(0,0,0,0)',
                    textAccessible: true
                }
            }).draw();
        };
    </script>

</body>
</html>