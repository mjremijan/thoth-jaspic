<!DOCTYPE html>
<html>
    <head>
        <title><%= pageContext.findAttribute("maven.project.artifactId") %> Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <style>
            a {color:blue;}
            .code {font-family: courier;}
        </style>            
    </head>
    <body>
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (Index)</h1>
        
        <jsp:include page="/bin/meta.jsp"/>

        
        <h2>Test Goals</h2>
        <ul>
            <li>
                Can there be a JSP that's public which any group may access and
                another JSP that's private which is accessible only by a specific 
                identity management group? Everything is declared in annotations 
                except for the identity-management groups in 
                <span class="code">glassfish-web.xml</span>.
            </li>
        </ul>

        
        <h2>Test Results</h2>
        <blockquote>
            <p>
                Well, no, not really.  But kinda :)
            </p>
            <p>
                Roles are not a problem.  The 
                <span class="code">@DeclareRoles</span> annotation can be used
                on a bean in the code and replace the <span class="code">web.xml</span>
                <span class="code">&lt;security-role&gt;</span> tag.  
            </p>
            <p>
                The <span class="code">web.xml</span>
                <span class="code">&lt;security-constraint&gt;</span> tag is
                more problematic.  The <span class="code">@ServletSecurity</span> 
                annotation replaces the <span class="code">&lt;security-constraint&gt;</span> 
                tag, however, this annotation is not as flexible as it's XML
                counterpart.  The <span class="code">@ServletSecurity</span>
                annotation is limited to a servlet class - you cannot annotate
                a JSP page.  The annotation also has
                no equivalent of the 
                <span class="code">&lt;security-constraint&gt;...&lt;web-resource-collection&gt;...&lt;url-pattern&gt;</span>,
                tag.  The annotation gets the URL to protected from the 
                <span class="code">@WebServlet</span> annotation. This basically
                means that if the URL you want to protect isn't a servlet, then 
                you still have to
                use the <span class="code">web.xml</span>
                <span class="code">&lt;security-constraint&gt;</span> tag.
            </p>
            <p>
                So long story short, if the URL you want to protect isn't 
                mapped to a servlet, then you can't go all annotations and
                using the <span class="code">web.xml</span>
                <span class="code">&lt;security-constraint&gt;</span> tag is 
                still necessary.
            </p>
            <p>
                However, if you can "proxy" a request through a servlet, then
                you can go all annotations!
            </p>
            <p>
                This example is a mix of annotations and 
                using <span class="code">web.xml</span> just to demonstrate how
                things might be done.
            </p>
            <p>
                For roles, the <span class="code">DeclareRolesBean</span> class
                uses the <span class="code">@DeclareRoles</span> annotation
                to declare 3 <b>application specific</b> roles: 
                <span class="code">{"ManagerRole", "AdminRole", "StockholderRole"}</span>
            </p>
            <p>
                For groups, the <span class="code">glassfish-web.xml</span>
                file is used to map 3 <b>identity management</b> groups to
                the <b>application specific</b> roles.  The mappings are:<br />
                <span class="code">"GROUP_MANAGERS"</span> to <span class="code">"ManagerRole"</span><br />
                <span class="code">"GROUP_ADMINS"</span> to <span class="code">"AdminRole"</span><br />
                <span class="code">"GROUP_STOCKHOLDERS"</span> to <span class="code">"StockholderRole"</span><br />
            </p>
            <p>
                For testing, the <span class="code">TestServerAuthModule</span> class
                create a user <span class="code">Principal</span> that uses
                2 <b>identity management</b> groups: 
                <span class="code">"GROUP_MANAGERS,GROUP_STOCKHOLDERS"</span>
            </p>
            <p>
                Now here is a table of different areas of the application
                you can attempt to access it summarizes what you have
                access to and how access to that resource works.
            </p>
            
            <table border="1">
                <tr>
                    <th>JSP</th>
                    <th>Accessible</th>
                    <th>Why it's accessible</th>
                    <th>How it's coded</th>
                </tr>
                <tr>
                    <td>
                        <a href="<%= request.getContextPath() %>/bin/about.jsp">About JSP</a>
                    </td>
                    <td style="background-color: greenyellow">
                        Yes
                    </td>                    
                    <td>
                        This JSP is not protected so it's accessible to anyone.
                    </td>
                    <td>
                        This JSP page is sitting in the application's root
                        directory structure:<br/></br>
                        <span class="code"><br />
                            <%= pageContext.findAttribute("maven.project.artifactId") %><br />
                            &nbsp;&nbsp;&nbsp;&nbsp;/WEB-INF<br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;/bin/about.jsp</br>
                        </span>
                        <br />
                        So as long as you know the path and name of
                        the page you can browse directly to it.
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="<%= request.getContextPath() %>/manager/manager.jsp?color=blue">Manager JSP</a>
                    </td>
                    <td style="background-color: greenyellow">
                        Yes
                    </td>
                    <td>
                        This JSP is accessible because you are in the
                        <span class="code">GROUP_MANAGERS</span> identity 
                        management group.
                    </td>
                    <td>
                        This JSP page is sitting in the application's root
                        directory structure:<br/></br>
                        <span class="code"><br />
                            <%= pageContext.findAttribute("maven.project.artifactId") %><br />
                            &nbsp;&nbsp;&nbsp;&nbsp;/WEB-INF<br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;/manager/manager.jsp</br>
                        </span>
                        <br />
                        So because this JSP is accessed directly, the 
                        <span class="code">web.xml</span>
                        <span class="code">&lt;security-constraint&gt;</span> tag
                        is needed to protect it.  If you look at 
                        <span class="code">web.xml</span>, you'll see how the
                        deployment descriptor is used to protect management
                        resources.
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <a href="<%= request.getContextPath() %>/stockholder/stockholder.jsp">Stockholder JSP</a>
                    </td>
                    <td style="background-color: greenyellow">
                        Yes
                    </td>
                    <td>
                        This JSP is accessible because you are in the
                        <span class="code">GROUP_STOCKHOLDERS</span> identity 
                        management group.
                    </td>
                    <td>
                        This JSP page is different. It is <b>not</b> directly 
                        accessible from a browser because it is is sitting in 
                        the application's WEB-INF folder:<br/></br>
                        <span class="code"><br />
                            <%= pageContext.findAttribute("maven.project.artifactId") %><br />
                            &nbsp;&nbsp;&nbsp;&nbsp;/WEB-INF<br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/stockholder/stockholder.jsp</br>
                        </span>
                        <br />
                        Because the stockholder pages are <b>not</b> directly 
                        accessible, a <span class="code">StockholderServlet</code>
                        was created to "proxy" requests for these JSPs. This 
                        proxying allows configuration to get out of
                        <span class="code">web.xml</span> and instead reside
                        completely in annotations.  The <span class="code">StockholderServlet</code>'s
                        annotations are:<br /><br />
                        <span class="code">
                        @WebServlet(name = "StockholderServlet", urlPatterns = {"/stockholder/*"}) <br />
                        @ServletSecurity(@HttpConstraint(rolesAllowed = {"StockholderRole"})) <br />
                        </span>
                        
                        These annotations protect all browser URL requests to
                        <span class="code">/stockholder/*</span> with the
                        <span class="code">StockholderRole</span>.  Since
                        any requests to this URL pattern will hit this servlet
                        first, if you do not have the 
                        <span class="code">StockholderRole</span> role, then
                        access will be denied.  If you do have this role, 
                        the Servlet will forward the 
                        <span class="code">/stockholder/*</span> request to a
                        <span class="code">/WEB-INF/stockholder/*</span> resource.
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <a href="<%= request.getContextPath() %>/admin/admin.jsp">Admin JSP</a>
                    </td>
                    <td style="background-color: red">
                        No
                    </td>
                    <td>
                        This JSP is <b>not</b> accessible because you are <b>not</b> 
                        in the <span class="code">GROUP_ADMINS</span> 
                        identity management group.
                    </td>
                    <td>
                        This uses the "proxy" servlet approach the same as
                        requests to the stockholder JSP pages.  However,
                        because you are not in the <span class="code">GROUP_ADMINS</span> 
                        identity management group, the servlet stops the
                        request and never forwards the request to a 
                        <span class="code">/WEB-INF/admin/*</span> resource.
                    </td>
                </tr>
            </table>
        </blockquote>
                    
        <jsp:include page="/bin/info.jsp"/>
    </body>
</html>
