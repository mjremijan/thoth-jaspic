<!DOCTYPE html>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.io.File" %>

<html>
    <head>
        <title>${project.artifactId} Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
        <h1>${project.artifactId}</h1>
        <p>
            Timestamp: <%= new SimpleDateFormat("dd-M-yyyy hh:mm:ss").format(Calendar.getInstance().getTime())%>
        </p>
        <h2>Test Goals</h2>
        <ul>
            <% String q1 = "Can the JASPIC code get registered when embedded within a WAR?"; %>
            <% String q2 = "Do requests against the application run the JASPIC code on every request?"; %>
            <li><%= q1 %></li>
            <li><%= q2 %></li>
        </ul>

        <h2>Log file location</h2>
        <blockquote>
            <p>
                <%= System.getProperty("com.sun.aas.instanceRoot") + File.separator + "logs" + File.separator + "${project.artifactId}.log"%>
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
                Check the log file.  You'll see the listener registered the JASPIC code.
            </p>
            <div style="font-family:Courier;">
                INFO  TestStartupListener:27 - ENTER contextInitialized()<br />
                INFO  TestAuthConfigProvider:32 - ENTER no-arg constructor<br />
                INFO  TestStartupListener:38 - JASPIC Registered: ID="__2HttpServlet"
            </div>
        </blockquote>
        
        
        <p>
            <i><%= q2 %></i>
        </p>
        <blockquote>
            <p>
                Yes!
            </p>
            <p>
                Keep reloading this page.  Watch the log files.  You'll see
                all the JASPIC code logging.
            </p>
        </blockquote>
    </body>
</html>
