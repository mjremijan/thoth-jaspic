<!DOCTYPE html>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.io.File" %>
<%@ page import="java.security.Principal" %>


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
            <% String q1 = "Can roles be loaded from <span style=\"font-family: courier\">HttpServletRequest</span> and used by <span style=\"font-family: courier\">Request#isUserInRole()</span>?"; %>
            <li><%= q1 %></li>
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
                The caveat to using <span style="font-family: courier">Request#isUserInRole()</span> is the
                <span style="font-family: courier">web.xml</span> file.  In order for a webapp to use
                a role, it must be put into <span style="font-family: courier">web.xml</span> as <pre>
&lt;security-role&gt;
    &lt;role-name>ROLE_NAME&lt;/role-name&gt;
&lt;/security-role&gt;</pre>           
            </p>
            <p>
                Valid roles for /${project.artifactId} are:
            </p>
            <ol>
                <li>public</li>
                <li>classified</li>
                <li>top secret</li>
            </ol>
            <p>
                If you enter one of these roles in the form below, you will see
                <span style="font-family: courier">Request#isUserInRole()</span>
                return <span style="font-family: courier">true</span>.  Any other
                role will return <span style="font-family: courier">false</span>.
            </p>
            <p>
                <form action="index.jsp">
                    ROLES: (comma separated list)<br />
                    <input type="text" name="roles" /><br />
                    <br />
                    <input type="submit" value="Submit" /> 
                </form>                
            </p>
            <% Principal p = request.getUserPrincipal(); %>
            <% if (p != null) { %>
                <p><b>Role Information</b></p>
                <%
					String roles = request.getParameter("roles");
                    if (roles != null) {
                        String[] tokens = roles.split(","); %>
                        <table>
                    <%  for (String token : tokens) { %>
                            <tr>
                                <td style="font-family:courier">Request#isUserInRole("<%= token %>")&nbsp;</td>
                                <td style="font-family:courier"><%= request.isUserInRole(token) %></td>
                            </tr>
                     <% } %>
                        </table>
                        <p>
                            <input type="button" onclick="document.location.href='index.jsp';" value="Clear" />
                        </p>
                 <% } %>            
            <% } %>
        </blockquote>
    </body>
</html>
