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
            <% String q1 = "Can @DeclareRoles replace roles specified in <span style=\"font-family: courier\">web.xml</span>?"; %>
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
                Yes! It would appear so.
            </p>
            <p>
                What I did for <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i> was I removed
                all &lt;security-role&gt; elements from the <span style="font-family: courier">web.xml</span>
                file and instead I used the <span style="font-family: courier">@DeclareRoles</span> annotation
                to declare the roles for the application.  But a big question is which class should have the
                <span style="font-family: courier">@DeclareRoles</span> annotation?
            </p>
            <p>
                Turns out, it seems as if <span style="font-family: courier">@DeclareRoles</span> can be anywhere
                when using GlassFish or Payara.  This, however, is behavior specific to these EE Servers.  
                WebLogic wants <span style="font-family: courier">@DeclareRoles</span> on a 
                <span style="font-family: courier">Servlet</span> class.  JSR 340 of the Servlet 3.1 specification
                states in section 15.5.1 that "The <span style="font-family: courier">@DeclareRoles</span>
                annotation may only be defined in classes implementing the
                <span style="font-family: courier">javax.servlet.Servlet</span> interface or a subclass thereof." 
                So in this case it appears the WebLogic behavior is correct.
            </p>
            <p>
                For <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i>, all of the roles have
                been removed from <span style="font-family: courier">web.xml</span> and are now declared on
                the <span style="font-family: courier">@DeclareRoles</span> annoation of the 
                <span style="font-family: courier">DeclareRolesServlet.java</span> class.  The valid roles for
                <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i> are: <pre>
<b>@DeclareRoles({"public", "classified", "top secret"})</b>
</pre>
            </p>
            <p>
                If you enter one of these roles in the form below and then submit,
                the JASPIC code will use the <span style="font-family: courier">HttpServletRequest</span>
                to create a <span style="font-family: courier">Principal</span> and assoicate whatever 
                roles you enter in the form below to that <span style="font-family: courier">Principal</span>. 
                Then <span style="font-family: courier">Request#isUserInRole()</span> will be called
                using the roles you enter in the form below.  If what you enter matches what's on 
                the <span style="font-family: courier">@DeclareRoles</span> annoation of the 
                <span style="font-family: courier">DeclareRolesServlet.java</span> class, then
                <span style="font-family: courier">Request#isUserInRole()</span> will                 
                return <span style="font-family: courier">true</span>.  Any other
                role will return <span style="font-family: courier">false</span>.
            </p>
            <p>
                <form action="index#results">
                    ROLES: (comma separated list)<br />
                    <input type="text" name="roles" /><br />
                    <br />
                    <input type="submit" value="Submit" /> 
                </form>                
            </p>
            <% Principal p = request.getUserPrincipal(); %>
            <% if (p != null) { %>
                <p>
                    <a name="results" />
                    <b>Role Information</b>
                </p>
                <p>
                    <input type="button" onclick="document.location.href='index';" value="Clear" />
                </p>
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
                 <% } %>            
            <% } %>
        </blockquote>
    </body>
</html>
