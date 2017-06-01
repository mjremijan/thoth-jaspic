<!DOCTYPE html>
<html>
    <head>
        <title><%= pageContext.findAttribute("maven.project.artifactId") %> Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <style>
            a {color:blue;}
        </style>            
    </head>
    <body>
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (Index)</h1>
        <jsp:include page="/meta.jsp"/>

        
        <h2>Test Goals</h2>
        <ul>
            <% String q1 = "Can there be a servlet that's public which any group may access and"; %> 
            <% q1 += " another servlet that's private which is accessible only by a specific identity management group?"; %>
            <% q1 += " Everything is declared in web.xml and glassfish-web.xml. "; %>
            
            <li><%= q1 %></li>
        </ul>

        
        <h2>Test Results</h2>
        <blockquote>
            <p>
                Yes!
            </p>
            <p>
                Below are 3 links.  For this example, your user 
                <span style="font-family: courier">Principal</span> was create with only 1 identity management group: 
                <span style="font-family: courier">GROUP_MANAGERS</span>.  As you click the links below,
                you will be able to access the <span style="font-family: courier">AboutServlet</span> 
                because this servlet is completely unprotected.  You will be able to access the
                the <span style="font-family: courier">ManagerServlet</span>, because you are in the
                <span style="font-family: courier">GROUP_MANAGERS</span> identity management group.  
                However, you will <b>not</b>
                be able to access the <span style="font-family: courier">AdminServlet</span> because
                you are <b>not</b> in the <span style="font-family: courier">GROUP_ADMINS</span> 
                identity management group.
            </p>
            
            <table border="1">
                <tr>
                    <th>Servlet</th>
                    <th>Accessible</th>
                    <th>Explaination</th>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/bin/about">AboutServlet</a></td>
                    <td>Yes</td>
                    <td>This servlet is not protected so it's accessible to anyone.</td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/sbin/manager">ManagerServlet</a></td>
                    <td>Yes</td>
                    <td>
                        This servlet accessible because you are in the
                        <span style="font-family: courier">GROUP_MANAGERS</span> identity management group.
                    </td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/sbin/admin">AdminServlet</a></td>
                    <td>No</td>
                    <td>
                        This servlet is <b>not</b> accessible because you are <b>not</b> 
                        in the <span style="font-family: courier">GROUP_ADMINS</span> 
                        identity management group.
                    </td>
                </tr>
            </table>
        </blockquote>
                    
        <jsp:include page="/info.jsp"/>
    </body>
</html>
