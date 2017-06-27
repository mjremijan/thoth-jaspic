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
        
        <jsp:include page="/meta.jsp"/>

        
        <h2>Test Goals</h2>
        <ul>
            <li>
                If the application has a public servlet that attempts to forward
                to either a protected servlet or JSP, will the forward request
                be denied?
            </li>
        </ul>

        
        <h2>Test Results</h2>
        <blockquote>
            <p>
                Yes!
            </p>
            
            <table border="1">
                <tr>
                    <th>Servlet</th>
                    <th>Accessible</th>
                    <th>Explaination</th>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/bin/admin">Admin (forward through unprotected servlet)</a></td>
                    <td style="background-color: greenyellow">
                        Yes
                    </td>
                    <td>
                        Although you do not have the <span class="code">AdminRole</span>
                        role, access to this protected resource is being done 
                        server-side by a <span class="code">RequestDispatcher</span> forward.
                        <br />
                        <br />
                        From the <i>Java EE 5 Tutorial</i> retrieved from 
                        <a href="https://docs.oracle.com/cd/E19575-01/819-3669/bncbk/index.html">https://docs.oracle.com/cd/E19575-01/819-3669/bncbk/index.html</a>
                        it says:<br/><br/>
                        "Security constraints work only on the original request URI and not on calls made throug 
                        a <span class="code">RequestDispatcher</span> (which include 
                        <span class="code">&lt;jsp:include&gt;</span>
                        and 
                        <span class="code">&lt;jsp:forward&gt;</span>). 
                        Inside the application, it is assumed that the application itself has complete 
                        access to all resources and would not forward a user request unless it had decided 
                        that the requesting user also had access."
                    </td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/sbin/admin">Admin Servlet</a></td>
                    <td style="background-color: red">
                        No
                    </td>
                    <td>
                        You do not have the <span class="code">AdminRole</span>
                        role so you do not have access to this via the browser 
                        (in other words, the original request URI).
                    </td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/bin/executive">Executive (forward through unprotected servlet)</a></td>
                    <td style="background-color: greenyellow">
                        Yes
                    </td>
                    <td>
                        Although you do not have the <span class="code">ExecutiveRole</span>
                        role, access to this protected resource is being done 
                        server-side by a <span class="code">RequestDispatcher</span> forward.
                        <br />
                        <br />
                        From the <i>Java EE 5 Tutorial</i> retrieved from 
                        <a href="https://docs.oracle.com/cd/E19575-01/819-3669/bncbk/index.html">https://docs.oracle.com/cd/E19575-01/819-3669/bncbk/index.html</a>
                        it says:<br/><br/>
                        "Security constraints work only on the original request URI and not on calls made throug 
                        a <span class="code">RequestDispatcher</span> (which include 
                        <span class="code">&lt;jsp:include&gt;</span>
                        and 
                        <span class="code">&lt;jsp:forward&gt;</span>). 
                        Inside the application, it is assumed that the application itself has complete 
                        access to all resources and would not forward a user request unless it had decided 
                        that the requesting user also had access."
                    </td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/executive/executive.jsp">Executive JSP</a></td>
                    <td style="background-color: red">
                        No
                    </td>
                    <td>
                        You do not have the <span class="code">ExecutiveRole</span>
                        role so you do not have access to this via the browser 
                        (in other words, the original request URI).
                    </td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/bin/custsupt">Customer Support (forward through unprotected servlet)</a></td>
                    <td style="background-color: red">
                        No
                    </td>
                    <td>
                        Although the orginal request URI goes through a 
                        unprotected servlet and the unprotected servlet
                        forwards the request to a protected servlet, the
                        <span class="code">CustomerSupportServletProtected</span>
                        class uses programmatic security.  If 
                        <span class="code">request.isUserInRole("CustomerSupportRole")</span>
                        fails, the code will return a 403 error.
                    </td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/sbin/custsupt">Customer Support Servlet</a></td>
                    <td style="background-color: red">
                        No
                    </td>
                    <td>
                        You do not have the <span class="code">CustomerSupportRole</span>
                        role so you do not have access to this via the browser 
                        (in other words, the original request URI).
                    </td>
                </tr>
                
                
                
                <tr>
                    <td><a href="<%= request.getContextPath() %>/bin/salemp">Salary Employee (forward through unprotected servlet)</a></td>
                    <td style="background-color: greenyellow">
                        Yes
                    </td>
                    <td>
                        You do  have the <span class="code">SalaryEmployeeRole</span>
                        role.  But that doesn't matter with this request because, 
                        access to this protected resource is being done 
                        server-side by a <span class="code">RequestDispatcher</span> forward.
                        <br />
                        <br />
                        From the <i>Java EE 5 Tutorial</i> retrieved from 
                        <a href="https://docs.oracle.com/cd/E19575-01/819-3669/bncbk/index.html">https://docs.oracle.com/cd/E19575-01/819-3669/bncbk/index.html</a>
                        it says:<br/><br/>
                        "Security constraints work only on the original request URI and not on calls made throug 
                        a <span class="code">RequestDispatcher</span> (which include 
                        <span class="code">&lt;jsp:include&gt;</span>
                        and 
                        <span class="code">&lt;jsp:forward&gt;</span>). 
                        Inside the application, it is assumed that the application itself has complete 
                        access to all resources and would not forward a user request unless it had decided 
                        that the requesting user also had access."
                    </td>
                </tr>
                <tr>
                    <td><a href="<%= request.getContextPath() %>/sbin/salemp">SalaryEmployee Servlet</a></td>
                    <td style="background-color: greenyellow">
                        Yes
                    </td>
                    <td>
                        You have the <span class="code">SalaryEmployeeRole</span>
                        role so you have access to this via the browser 
                        (in other words, the original request URI).
                    </td>
                </tr>
            </table>
        </blockquote>
                    
        <jsp:include page="/info.jsp"/>
        
    </body>
</html>
