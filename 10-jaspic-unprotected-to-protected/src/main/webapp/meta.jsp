<!DOCTYPE html>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.io.File" %>


<blockquote>
    <p>
        <b>Timestamp:</b> <%= new SimpleDateFormat("dd-M-yyyy hh:mm:ss").format(Calendar.getInstance().getTime())%>
    </p>
    <p>
        <b>Log file:</b> <%= System.getProperty("com.sun.aas.instanceRoot") + File.separator + "logs" + File.separator + pageContext.findAttribute("maven.project.artifactId")  + ".log"%>
    </p>
</blockquote>