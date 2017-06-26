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
                identity management group? Everything is declared in 
                <span class="code">web.xml</span> and 
                <span class="code">glassfish-web.xml</span>
            </li>
        </ul>

        
        <h2>Test Results</h2>
        <blockquote>
            <p>
                Yes!
            </p>
            <p>
                For this test, <span class="code">web.xml</span> is used to 
                declare <span class="code">&lt;security-constraint&gt;</span>
                with the URLs to be protected and which roles can access those URLs.
                <span class="code">web.xml</span> is necessary since a
                <span class="code">@ServletSecurity</span> annotation cannot be
                put on a JSP page.
            </p>
            <p>
                <span class="code">web.xml</span> declares the 
                <span class="code">ManagerRole</span> and the 
                <span class="code">AdminRole</span> application specific roles 
                which are used in the code.  Then 
                <span class="code">glassfish-web.xml</span>
                maps these application specific roles to
                <span class="code">GROUP_MANAGERS</span> and
                <span class="code">GROUP_ADMINS</span>.  These are the identity
                management groups which would be associated with a user in whatever
                identity managment solution you use.  The 
                <span class="code">TestServerAuthModule</span> class ultimately
                creates a <span class="code">Prinicpal</span> with the
                identity management groups.
            </p>
            <p>
                For this example, the <span class="code">Principal</span> was 
                create with only 1 identity management group: 
                <span class="code">GROUP_MANAGERS</span>.  As you click the links below,
                you will be able to access the <span class="code">About JSP</span> 
                because this JSP is completely unprotected.  You will be able to access the
                the <span class="code">Manager JSP</span>, because you are in the
                <span class="code">GROUP_MANAGERS</span> identity management group.  
                However, you will <b>not</b>
                be able to access the <span class="code">Admin JSP</span> because
                you are <b>not</b> in the <span class="code">GROUP_ADMINS</span> 
                identity management group.
            </p>
            
            <table border="1">
                <tr>
                    <th>JSP</th>
                    <th>Accessible</th>
                    <th>Explaination</th>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/bin/about.jsp">About JSP</a></td>
                    <td style="background-color: greenyellow">Yes</td>
                    <td>This JSP is not protected so it's accessible to anyone.</td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/manager/manager.jsp">Manager JSP</a></td>
                    <td style="background-color: greenyellow">Yes</td>
                    <td>
                        This JSP is accessible because you are in the
                        <span class="code">GROUP_MANAGERS</span> identity management group.
                    </td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/admin/admin.jsp">Admin JSP</a></td>
                    <td style="background-color: red">No</td>
                    <td>
                        This JSP is <b>not</b> accessible because you are <b>not</b> 
                        in the <span class="code">GROUP_ADMINS</span> 
                        identity management group.
                    </td>
                </tr>
            </table>
        </blockquote>
                    
        <jsp:include page="/bin/info.jsp"/>
    </body>
</html>
