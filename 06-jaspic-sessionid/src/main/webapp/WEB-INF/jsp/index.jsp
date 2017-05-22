<!DOCTYPE html>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.io.File" %>
<%@ page import="java.security.Principal" %>


<html>
    <head>
        <title><%= pageContext.findAttribute("maven.project.artifactId") %> Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %></h1>
        <p>
            Timestamp: <%= new SimpleDateFormat("dd-M-yyyy hh:mm:ss").format(Calendar.getInstance().getTime())%>
        </p>
        
        
        <h2>Test Goals</h2>
        <ul>
            <% String q1 = "";
               q1 += "Can I get the user's Session on first request and get it consistently on subsequent requests?";
            
            %>
            <li><%= q1 %></li>
        </ul>

        
        <h2>Log file location</h2>
        <blockquote>
            <p>
                <%= System.getProperty("com.sun.aas.instanceRoot") + File.separator + "logs" + File.separator + pageContext.findAttribute("maven.project.artifactId") + ".log"%>
            </p>
        </blockquote>

            
        <h2>Test Results</h2>
        <p>
            <i><%= q1 %></i>
        </p>
        <blockquote>
            <p>
                Yes!
            </p>
            <p>
                After this page has loaded, check the log file and see what it printed for the Session ID.  Search
                the log file for "SESSIONID:".  Then compare what you find in the log files to 
                this Session ID: <span style="font-family: courier"><%= session.getId() %></span>
            </p>
            <p>
                Additionally, the code set a session attribute using the
                key <span style="font-family: courier">org.thoth.jaspic.sessiontest</span>.  
                Below it should say <span style="font-family: courier">Hello Session</span>.
            </p>
            <p>
                <span style="font-family: courier">org.thoth.jaspic.sessiontest=<%= session.getAttribute("org.thoth.jaspic.sessiontest") %></span>
            </p>
        </blockquote>
    </body>
</html>
