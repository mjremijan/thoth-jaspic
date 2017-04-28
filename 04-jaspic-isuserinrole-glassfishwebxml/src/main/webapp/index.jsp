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
               q1 += "Can application-specific roles be in <span style=\"font-family: courier\">web.xml</span>";
               q1 += " and identity-management groups be in <span style=\"font-family: courier\">glassfish-web.xml</span>";
               q1 += " with <span style=\"font-family: courier\">HttpServletRequest</span> loading the identity-management groups";
               q1 += " and <span style=\"font-family: courier\">Request#isUserInRole()</span> using application-specific roles?"; 
            
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
                This tests the mapping of <b>application-specific</b> <i>roles</i> to <b>identity-management</b> <i>groups</i>.
                Sound's strange, but here are the details.
            </p>
            <p>
                The idea is like this.  Inside of <span style="font-family: courier">web.xml</span>, <i>roles</i>
                are defined that are <b>application-specific</b>.  This means that these <i>roles</i> are only 
                used within the application and nowhere else.  So for <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i>, the following
                <b>application-specific</b> <i>roles</i> are defined in <span style="font-family: courier">web.xml</span> <pre>
&lt;security-role&gt;
    &lt;role-name>everybody&lt;/role-name&gt;
&lt;/security-role&gt;
&lt;security-role&gt;
    &lt;role-name>only_the_boss&lt;/role-name&gt;
&lt;/security-role&gt;
&lt;security-role&gt;
    &lt;role-name>only_the_bosses_boss&lt;/role-name&gt;
&lt;/security-role&gt;</pre>           
            </p>            
            <p>
                Application development proceeds using these <b>application-specific</b> <i>roles</i> 
                to secure the application.
            </p>
            <p>
                Now, some time later, its finally come to the decision that the indentity management
                for <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i> will be handled by Microsoft Active Directory and users 
                of <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i> will be assigned to the following <b>identity-management</b>
                <i>groups</i>: "public", "classified", "top secret".
            </p>
            <p>
                At this point do you need to update your entire application and start using
                these group names?  Nope! What you do is map the <b>application-specific</b> 
                <i>roles</i> to the <b>identity-management</b> <i>groups</i> using 
                <span style="font-family: courier">glassfish-web.xml</span> like this: <pre>
&lt;security-role-mapping&gt;
    &lt;role-name&gt;everybody&lt;/role-name&gt;
	&lt;group-name&gt;public&lt;/group-name&gt;
&lt;/security-role-mapping&gt;
&lt;security-role-mapping&gt;
	&lt;role-name&gt;only_the_boss&lt;/role-name&gt;
	&lt;group-name&gt;classified&lt;/group-name&gt;
&lt;/security-role-mapping&gt;
&lt;security-role-mapping&gt;
	&lt;role-name&gt;only_the_bosses_boss&lt;/role-name&gt;
	&lt;group-name&gt;top secret&lt;/group-name&gt;
&lt;/security-role-mapping&gt;</pre>
            </p>
            
            <p>
                The valid values in <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i> for <b>application-specific</b> <i>roles</i> are:
            </p>
            <ol>
                <li>everybody</li>
                <li>only_the_boss</li>
                <li>top only_the_bosses_boss</li>
            </ol>
            <p>
                The valid values in <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i> for <b>identity-management</b> <i>groups</i> are:
            </p>
            <ol>
                <li>public</li>
                <li>classified</li>
                <li>top secret</li>
            </ol>
            <p>
                If you enter these roles and groups in the form below, you'll see something
                pretty cool.  The <b>identity-management</b> <i>groups</i> are associated with 
                <span style="font-family: courier">Principal</span>.  In other words,
                when the Identity Management solution protecting your application passes the
                user and group information to your application (typically through HTTP headers)
                the Identity Management solution will pass <i>groups</i> "public, classified, 
                top secret".  However, a request to 
                <span style="font-family: courier">Request#isUserInRole()</span> uses
                an <b>application-specific</b> <i>role</i>, that's in 
                <span style="font-family: courier">web.xml</span>, <b>NOT</b>
                the groups provided the the Identity Management solution.  Even though that
                <b>application specific</b> <i>role</i>
                isn't what's associated with the
                <span style="font-family: courier">Principal</span>, the call to
                <span style="font-family: courier">Request#isUserInRole()</span>
                still returns <span style="font-family: courier">true</span> because
                the <b>application-specific</b> <i>role</i> is mapped to the 
                <b>identity-management</b> <i>group</i> through <span style="font-family: courier">glassfish-web.xml</span>.
                If the mapping is wrong, then the result will be <span style="font-family: courier">true</span>
                even if both the <i>role</i> and <i>group</i> are valid.
            </p>
            <p>
                <form action="index.jsp#results">
                    APPLICATION-SPECIFIC ROLES: (comma separated list)<br />
                    <input type="text" name="roles" /><br />
                    <br />
                    IDENTITY-MANAGEMENT GROUPS: (maps to list above)<br />
                    <input type="text" name="groups" /><br />
                    <br />
                    <input type="submit" value="Submit" /> 
                </form>                
            </p>
            <% Principal p = request.getUserPrincipal(); %>
            <% if (p != null) { %>
            
                <p>
                    <a name="results"/>
                    <b>Role to Group Matching Information</b>
                </p>
                <p>
                    <input type="button" onclick="document.location.href='index.jsp';" value="Clear" />
                </p>
                <%
                    String groups = request.getParameter("groups");
                    %>
                    <p>
                        <span style="font-family: courier">Principal</span> is in the following <b>identity-management</b> <i>groups</i>: <%= groups %>
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
