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
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (Index)</h1>
        <p>
            Timestamp: <%= new SimpleDateFormat("dd-M-yyyy hh:mm:ss").format(Calendar.getInstance().getTime())%>
        </p>
        
        
        <h2>Test Goals</h2>
        <ul>
            <% String q1 = "If request 'A' sets the principal, can I make requests 'B', 'C', and 'D' and maintain that principal across the requests?"; %>
            <li><%= q1 %></li>
        </ul>

        
        <h2>Log file location</h2>
        <blockquote>
            <p>
                <%= System.getProperty("com.sun.aas.instanceRoot") + File.separator + "logs" + File.separator + pageContext.findAttribute("maven.project.artifactId")  + ".log"%>
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
                <b>1st</b>, use the form below to create a <span style="font-family: courier">Principal</span>
                with one or more of the following valid roles:
            </p>
            <ol>
                <li>public</li>
                <li>classified</li>
                <li>top secret</li>
            </ol>
            <p>
                <form action="index.jsp#results">
                    ROLES: (comma separated list)<br />
                    <input type="text" name="roles" /><br />
                    <br />
                    <input type="submit" value="Submit" /> 
                </form>                
            </p>
            
            <jsp:include page="info.jsp"/>
            
        </blockquote>
    </body>
</html>
