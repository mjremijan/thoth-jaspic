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
               q1 += "Can application-specific roles be declared with <span style=\"font-family: courier\">@DeclareRole</span>";
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
                The idea is like this.  Inside of your applicaiton you have the
                <span style="font-family: courier">@DeclareRoles</span> annotations on classes that define
                <i>roles</i> that are <b>application-specific</b>.  This means that these <i>roles</i> are only 
                used within the application and nowhere else.  So for <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i>, the following
                <b>application-specific</b> <i>roles</i> are declared by the 
                <span style="font-family: courier">@DeclareRoles</span> annotation on the 
                <span style="font-family: courier">DeclareRolesBean.java</span> class: <pre>
package org.thoth.jaspic;
import javax.annotation.security.DeclareRoles;

<b>@DeclareRoles({"everybody", "the boss", "the boss's boss"})</b>
public class DeclareRolesBean {

}</pre>           
            </p>            
            <p>
                Application development proceeds using these <b>application-specific</b> <i>roles</i> 
                to secure the application.
            </p>
            <p>
                Now, some time later, its finally decided that the indentity management
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
    &lt;role-name&gt;the boss&lt;/role-name&gt;
    &lt;group-name&gt;classified&lt;/group-name&gt;
&lt;/security-role-mapping&gt;
&lt;security-role-mapping&gt;
    &lt;role-name&gt;the boss's boss&lt;/role-name&gt;
    &lt;group-name&gt;top secret&lt;/group-name&gt;
&lt;/security-role-mapping&gt;</pre>
            </p>
            
            <p>
                The valid values in <i><%= pageContext.findAttribute("maven.project.artifactId") %>.war</i> for <b>application-specific</b> <i>roles</i> are:
            </p>
            <ol>
                <li>everybody</li>
                <li>the boss</li>
                <li>the boss's boss</li>
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
                If you enter these roles and groups in the form below and then submit, you'll see something
                pretty cool.  The JASPIC code will generate a 
                <span style="font-family: courier">Principal</span> and use the
                <span style="font-family: courier">HttpServletRequest</span> to get the
                <b>identity-management</b> <i>groups</i> to associate with that
                <span style="font-family: courier">Principal</span>.  
                However, a call to 
                <span style="font-family: courier">Request#isUserInRole()</span> uses
                an <b>application-specific</b> <i>role</i>, not an 
                <b>identity-management</b> <i>group</i>.  If the <i>role</i> you enter in the form
                below is one of the roles
                declared by a <span style="font-family: courier">@DeclareRoles</span> annotation
                and if that <i>role</i> is mapped to a <i>group</i> by 
                <span style="font-family: courier">glassfish-web.xml</span>, then
                <span style="font-family: courier">Request#isUserInRole()</span>
                will return <span style="font-family: courier">true</span>.
            </p>
            <p>
                <form action="index#results">
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
                    <input type="button" onclick="document.location.href='index';" value="Clear" />
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
