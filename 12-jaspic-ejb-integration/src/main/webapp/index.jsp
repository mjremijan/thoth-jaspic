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
                If I have an EJB which is protected by @RolesAllowed,
                will the method call fail if I don't have that role?
                Will it succeed if I do have that role?
            </li>
        </ul>

        
        <h2>Test Results</h2>
        <blockquote>
            <p>
                Yes!
            </p>
            
            <p>
                Click this button and you will see the EJB method call will fail
                because you do not have <span class="code">ExecutiveRole</span>.
            </p>                        
            <form action="<%= request.getContextPath() %>/guest" method="GET">
                <input type="submit" value="Test that executive method call fails" />
            </form>  
            <p>
                <img src="<%= request.getContextPath() %>/EJBAccessException.jpg" />
            </p>
            
            <p>
                On the other hand, this EJB methd call will succeed because
                you have the <span class="code">SalaryEmployeeRole</span> role.
            </p>                        
            <form action="<%= request.getContextPath() %>/salary" method="GET">
                <input type="submit" value="Test that salary method call is OK" />
            </form>  
        </blockquote>
        
        <h2>References</h2>
        <blockquote>
            <p>
                4 Ways to Get EJBContext in EJB 3. (2006, June 6). Retrieved August 10, 2017,
                from <a href="http://javahowto.blogspot.com/2006/06/4-ways-to-get-ejbcontext-in-ejb-3.html">
                    http://javahowto.blogspot.com/2006/06/4-ways-to-get-ejbcontext-in-ejb-3.html</a>
            </p>
        </blockquote>
                    
        <jsp:include page="/info.jsp"/>
        
    </body>
</html>
