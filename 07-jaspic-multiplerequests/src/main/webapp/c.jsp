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
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (C)</h1>
        <p>
            Timestamp: <%= new SimpleDateFormat("dd-M-yyyy hh:mm:ss").format(Calendar.getInstance().getTime())%>
        </p>
        
        <h2>Test Results</h2>
        <blockquote>
            <jsp:include page="info.jsp"/>
        </blockquote>
    </body>
</html>
