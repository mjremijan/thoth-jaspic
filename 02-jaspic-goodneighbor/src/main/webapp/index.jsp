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
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %></h1>
        <p>
            Timestamp: <%= new SimpleDateFormat("dd-M-yyyy hh:mm:ss").format(Calendar.getInstance().getTime())%>
        </p>
        <h2>Test Goals</h2>
        <ul>
            <% String q1 = "Can the JASPIC application only affect its WAR and not affect other applications on the server?"; %>
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
                First, deploy <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i>. 
            </p>
            <p>
                After <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i> is deployed, look at 
                the log file.  Find in the logs that
                the JASPIC classes have been registered just for the
                <i><%= pageContext.findAttribute("maven.project.artifactId") %></i> application context.
            </p>
            <div style="font-family:Courier;">
                TestStartupListener:18 - ENTER contextInitialized()<br />
                TestAuthConfigProvider:22 - ENTER no-arg constructor<br />
                TestStartupListener:32 - JASPIC Registered: ID="__311_HttpServletserver /02-jaspic-goodneighbor", <span style="color:red; font-weight:bold;">appContext="server /02-jaspic-goodneighbor</span>"
            </div>
            <p>
                Now, use the browser refresh button to keep reloading the 
                <i><%= pageContext.findAttribute("maven.project.artifactId") %></i> application home page. 
                Watch the log files.  You'll see all the JASPIC code logging.
            </p>
            <p>
                Second, deploy <i><%= pageContext.findAttribute("maven.helloworld.artifactId") %>.war</i>. 
            </p>
            <p>
                Now, use the browser refresh button to keep reloading the 
                <i><%= pageContext.findAttribute("maven.helloworld.artifactId") %></i> application home page. 
                Watch the log files.  You'll see nothing.  None of the
                JASPIC code will be logging when reloading the
                <i><%= pageContext.findAttribute("maven.helloworld.artifactId") %></i> application home page.  But
                if you go back to reloading the <i><%= pageContext.findAttribute("maven.project.artifactId") %></i> 
                application home page again, you'll see the JASPIC code
                logging resume.
            </p>
        </blockquote>
    </body>
</html>
