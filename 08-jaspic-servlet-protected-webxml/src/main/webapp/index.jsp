<!DOCTYPE html>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.io.File" %>

<html>
    <head>
        <title><%= pageContext.findAttribute("maven.project.artifactId") %> Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (Login)</h1>
        <blockquote>
            <p>
                Timestamp: <%= new SimpleDateFormat("dd-M-yyyy hh:mm:ss").format(Calendar.getInstance().getTime())%>
                Log file: <%= System.getProperty("com.sun.aas.instanceRoot") + File.separator + "logs" + File.separator + pageContext.findAttribute("maven.project.artifactId")  + ".log"%>
            </p>
        </blockquote>

        
        <h2>Test Goals</h2>
        <ul>
            <% String q1 = "Can there be a servlet that's public which any role may access and"; %> 
            <% q1 += " one that's private which only an application-specific role may access?"; %>
            <% q1 += " Everything is declared in web.xml. No"; %> 
            <% q1 += " identity-management group is in glassfish-web.xml."; %>
            
            <li><%= q1 %></li>
        </ul>

        
        <h2>Test Results</h2>
        <blockquote>
            <p>
                Yes!
            </p>
            <p>
                Below are 3 links.  For this example, your user 
                <span style="font-family: courier">Principal</span> was create with only 1 role: 
                <span style="font-family: courier">MANAGER</span>.  As you click the links below,
                you will be able to access the <span style="font-family: courier">AboutServlet</span> 
                because this servlet is completely unprotected.  You will be able to access the
                the <span style="font-family: courier">ManagerServlet</span>, because you have the
                <span style="font-family: courier">MANAGER</span> role.  However, you will <b>not</b>
                be able to access the <span style="font-family: courier">AdminServlet</span> because
                you do not have the <span style="font-family: courier">ADMIN</span> role.
            </p>
            
            <table>
                <tr>
                    <th>Servlet</th>
                    <th>Accessable</th>
                    <th>Explaination</th>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/bin/about">AboutServlet</a></td>
                    <td>Yes</td>
                    <td>This servlet is not protected so is accessable to anyone.</td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/sbin/manager">ManagerServlet</a></td>
                    <td>Yes</td>
                    <td>
                        This servlet accessable because you have the 
                        <span style="font-family: courier">MANAGER</span> 
                        role.
                    </td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/sbin/admin">AdminServlet</a></td>
                    <td>No</td>
                    <td>
                        This servlet is <b>not</b> accessable because you do <b>not</b> have the 
                        <span style="font-family: courier">ADMIN</span> 
                        role.
                    </td>
                </tr>
            </table>
        </blockquote>
                    
        <jsp:include page="info.jsp"/>
    </body>
</html>
