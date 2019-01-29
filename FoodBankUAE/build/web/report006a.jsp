<%-- 
    Document   : report006a
    Created on : 28 Nov, 2018, 11:26:42 PM
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
    <link rel="stylesheet" href="demos.css" type="text/css" media="screen" />
    
    <script src="chart/RGraph.common.core.js" ></script>
    <script src="chart/RGraph.bar.js" ></script>
    <script type="text/javascript" src="js/jspdf.min.js"></script>
    <script type="text/javascript" src="js/html2canvas.min.js"></script>

</head>
<body>

<div id="main">
           <div id="screenshot" onclick='makeScreenshot();'>
    <canvas id="cvs" width="800" height="600">[No canvas support]</canvas>
           </div>
</div>
<%
    String a=request.getParameter("date1");
    String b=request.getParameter("date2");
%>
    
    <a id="a-download" href="#" >Download</a>

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
                var ht=297*hratio;
                doc.addImage(imgData, 'PNG', 10,20,285,ht);
                doc.save('DELIVERY-REPORT.pdf');
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
	
	ResultSet rs = statement.executeQuery("SELECT  distinct CATEGORY,sum(QTY) FROM FDA.RECEIVE where calender>='"+a+"' and calender<='"+b+"'  group by category order by sum(QTY) desc");    
                while(rs.next())
                      {
                          out.println(""+rs.getDouble("2")+",");
                        }
            %>
            ];

            var bar = new RGraph.Bar({
                id: 'cvs',
                data: data,
                options: {
                    ymax: 200+<%
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = con.createStatement();
	
	ResultSet rs1 = st.executeQuery("SELECT  sum(QTY) FROM FDA.RECEIVE where calender>='"+a+"' and calender<='"+b+"'  ");    
                while(rs1.next())
                      {
                          out.println(""+rs1.getDouble("1")+"");
                        }
            %>,
                    noxaxis: true,
                    labels: [
                        <%
                        ResultSet rss = statement.executeQuery("SELECT  distinct CATEGORY,sum(QTY) FROM FDA.RECEIVE where calender>='"+a+"' and calender<='"+b+"'  group by category order by sum(QTY) desc");
                    while(rss.next())
                    {
                     out.println("'"+rss.getString("category")+"',");
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