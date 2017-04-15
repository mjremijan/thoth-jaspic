<!DOCTYPE html>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.io.File" %>
<%@ page import="java.security.Principal" %>


<html>
    <head>
        <title>03-jaspic-principal Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
        <h1>03-jaspic-principal</h1>
        <p>
            Timestamp: <%= new SimpleDateFormat("dd-M-yyyy hh:mm:ss").format(Calendar.getInstance().getTime())%>
        </p>
        <h2>Test Goals</h2>
        <ul>
            <% String q1 = "Can a Principal and roles be generated from an HttpServletRequest?"; %>
            <li><%= q1 %></li>
        </ul>

        <h2>Log file location</h2>
        <blockquote>
            <p>
                <%= System.getProperty("com.sun.aas.instanceRoot") + File.separator + "logs" + File.separator + "03-jaspic-principal.log"%>
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
                Enter user/group information and submit.  When the page reloads the principal
                information will be displayed below.
            </p>
            <p>
                <form action="index.jsp">
                    USER:<br />
                    <input type="text" name="user" /><br />
                    <br />
                    GROUPS: (comma separated. valid groups are "rainbow" and "color"; see web.xml &lt;security-role&gt;)<br />
                    <input type="text" name="groups" /><br />
                    <br />
                    <input type="submit" value="Submit" /> 
                </form>                
            </p>
            <% Principal p = request.getUserPrincipal(); %>
            <% if (p != null) { %>
                <p><b>Principal Information</b></p>
                <table>
                    <tr>
                        <td style="font-family:courier">Principal.getName()</td>
                        <td style="font-family:courier"><%= p.getName() %></td>
                    </tr>
                    <tr>
                        <td style="font-family:courier">Principal.getClass()</td>
                        <td style="font-family:courier"><%= p.getClass() %></td>
                    </tr>
                </table>
                
                <%
					String groups = request.getParameter("groups");
                    if (groups != null) {
                        String[] tokens = groups.split(","); %>
                        <p>
                            <b>Role Information</b>
                        </p>
                        <p>
                            For the role information below, you need to look in the web.xml file
                            and see what &lt;security-role&gt; values have been defined.  For
                            this application, there are only 2: "rainbow" and "color".  Only these
                            2 roles will appear as <span style="font-family: courier">true</span>
                            in the table below.  Any other role you may have entered will appear
                            as <span style="font-family: courier">false</span> because web.xml
                            doesn't know about it.
                        </p>
                        <table>
                    <%  for (String token : tokens) { %>
                            <tr>
                                <td style="font-family:courier">In role "<%= token %>"</td>
                                <td style="font-family:courier"><%= request.isUserInRole(token) %></td>
                            </tr>
                     <% } %>
                        </table>
                        <p>
                            <input type="button" onclick="document.location.href='index.jsp';" value="Clear" />
                        </p>
                 <% } 
				%>
            
            <% } %>
        </blockquote>
    </body>
</html>
