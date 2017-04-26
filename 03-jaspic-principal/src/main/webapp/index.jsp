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
            <% String q1 = "Can a Principal be created from an HttpServletRequest?"; %>
            <li><%= q1 %></li>
        </ul>

        <h2>Log fle location</h2>
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
                Enter a Principal ID (name) in the form below and submit.  
                When the page reloads the principal information will be displayed below.
            </p>
            <p>
                <form action="index.jsp#results">
                    PRINCIPAL ID:<br />
                    <input type="text" name="principalId" />&nbsp;<input type="submit" value="Submit" /> 
                </form>                
            </p>
            <% Principal p = request.getUserPrincipal(); %>
            <% if (p != null) { %>
                <a name="results" />
                <p><b>Principal Information</b></p>
                <p>
                    <input type="button" onclick="document.location.href='index.jsp';" value="Clear" />
                </p>
                <p>
                    <table border="1">
						<tr>
                            <th>Method Call</th>
                            <th>Value</th>
                        </tr>
                        <tr>
                            <td style="font-family:courier">request.getUserPrincipal().getName()</td>
                            <td style="font-family:courier"><%= p.getName() %></td>
                        </tr>
                        <tr>
                            <td style="font-family:courier">request.getUserPrincipal().getClass()</td>
                            <td style="font-family:courier"><%= p.getClass() %></td>
                        </tr>
                    </table>
                </p>
            <% } %>
        </blockquote>
    </body>
</html>
