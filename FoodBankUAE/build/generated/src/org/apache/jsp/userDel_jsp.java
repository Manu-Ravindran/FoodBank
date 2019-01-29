package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class userDel_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <style>\n");
      out.write("body {\n");
      out.write("    font-family: Arial, Helvetica, sans-serif;\n");
      out.write("    background-color: black;\n");
      out.write("}\n");
      out.write("\n");
      out.write("* {\n");
      out.write("    box-sizing: border-box;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Add padding to containers */\n");
      out.write(".container {\n");
      out.write("    padding: 16px;\n");
      out.write("    background-color: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write("label {\n");
      out.write("    padding: 12px 12px 12px 0;\n");
      out.write("    display: inline-block;\n");
      out.write("}\n");
      out.write("\n");
      out.write("button {\n");
      out.write("    background-color: #4CAF50;\n");
      out.write("    color: white;\n");
      out.write("    padding: 16px 20px;\n");
      out.write("    margin: 8px 0;\n");
      out.write("    border: none;\n");
      out.write("    cursor: pointer;\n");
      out.write("    width: 20%;\n");
      out.write("    opacity: 0.9;\n");
      out.write("}\n");
      out.write("\n");
      out.write("button:hover {\n");
      out.write("    opacity: 1;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("/* Overwrite default styles of hr */\n");
      out.write("hr {\n");
      out.write("    border: 1px solid #f1f1f1;\n");
      out.write("    margin-bottom: 25px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Set a style for the submit button */\n");
      out.write("input[type=submit] {\n");
      out.write("    background-color: #4CAF50;\n");
      out.write("    color: white;\n");
      out.write("    padding: 16px 20px;\n");
      out.write("    margin: 8px 0;\n");
      out.write("    border: none;\n");
      out.write("    cursor: pointer;\n");
      out.write("    width: 100%;\n");
      out.write("    opacity: 0.9;\n");
      out.write("}\n");
      out.write("\n");
      out.write("input[type=submit]:hover {\n");
      out.write("    opacity: 1;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("table {\n");
      out.write("    border-collapse: collapse;\n");
      out.write("    border-spacing: 0;\n");
      out.write("    width: 100%;\n");
      out.write("    border: 1px solid #ddd;\n");
      out.write("}\n");
      out.write("\n");
      out.write("th, td {\n");
      out.write("    text-align: left;\n");
      out.write("    padding: 8px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("tr:nth-child(even){background-color: #f2f2f2}\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body >\n");
      out.write("        \n");
      out.write("        <div class=\"container\">\n");
      out.write("            <form name=\"vinform\" action=\"modify2\">\n");
      out.write("                <label for=\"cat\"><b>SELECT INPUT YOU WANT TO Delete</b></label>\n");
      out.write("                 <div style=\"overflow-x:auto;\"> \n");
      out.write("          <table>\n");
      out.write("    <tr>\n");
      out.write("      <th>CATEGORY</th>\n");
      out.write("      <th>PRODUCT</th>\n");
      out.write("      <th>BRAND</th>\n");
      out.write("      <th>MFD</th>\n");
      out.write("      <th>EXP</th>\n");
      out.write("                <th>\n");
      out.write("                    QTY\n");
      out.write("                </th>\n");
      out.write("                <th>\n");
      out.write("                    WT\n");
      out.write("                </th>\n");
      out.write("                <th>\n");
      out.write("                    Tt. KG\n");
      out.write("                </th>\n");
      out.write("      <th>&nbsp;&nbsp;&nbsp;</th>\n");
      out.write("    </tr>\n");
      out.write("        ");

        String a = (String) session.getAttribute("f_id");
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("select id,CATEGORY,PRODUCT,BRAND,MFD,EXP,QTY,NOS,WT from FDA.RECEIVE where f_id=?");
	st.setString(1, a);
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
        
      out.write("\n");
      out.write("          </table>\n");
      out.write("    \n");
      out.write("    </select>\n");
      out.write("    </br></br>\n");
      out.write("    <label for=\"cmt\"><b>COMMENT</b></label>\n");
      out.write("    <input type=\"text\" name=\"cmt\">\n");
      out.write("    \n");
      out.write("    \n");
      out.write("      \n");
      out.write("   </br></br>\n");
      out.write("   <input type=\"submit\" value=\"CHANGE\"/></br></br>\n");
      out.write("   </br></br>\n");
      out.write("                \n");
      out.write("            </form>\n");
      out.write("          <form action=\"changeStatusA.jsp\">\n");
      out.write("          <input type=\"submit\" value=\"NEXT\"/>\n");
      out.write("          </form>\n");
      out.write("             \n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
