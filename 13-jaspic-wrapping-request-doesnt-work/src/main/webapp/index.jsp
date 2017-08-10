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
                Does proxying the HttpServletRequext with a @WebFilter work
                just as well?
            </li>
        </ul>

        
        <h2>Test Results</h2>
        <blockquote>
            <p>
                Below you will see the principal and role information that comes
                from the wrapped request.  So that seems to work OK.
            </p>
            
            <p>
                However, if you click this button, trying to get to 
                <span class="code">ExecutiveServlet</span> will fail miserabley.
                The request will cause the browser's BASIC
                authentication dialog box to appear.  This is because 
                <span class="code">ExecutiveServlet</span> is protected by
                a <span class="code">@ServletSecurity</span> annotation. The
                EE server knows this and attempts to enforce security way before
                the request ever gets to the <span class="code">HttpServletRequestProxyFilter</span> 
                which wraps/proxies the request.  So using a WebFilter just doesn't work.
            </p>                        
            <form action="<%= request.getContextPath() %>/sbin/executive" method="GET">
                <input type="submit" value="Can't get to ExecutiveServlet...get BASIC authentication dialog box" />
            </form>
                
            <p>
                If you stick to only programmatic security (vs. delcarative security)
                and you only get the principal and roles from the request, I guess
                wrapping the request would work.  But, this is too restrictive
                and prevents you from using EE security as it is built into the
                server.
            </p>
            
            <p>
                <img style="width:800px;" src="<%= request.getContextPath() %>/AuthenticationRequired.jpg" />
            </p>
        </blockquote>
        
        <h2>References</h2>
        <blockquote>
            <p>
                Rai, A. (2015, January 14).  How to Use Filter in Servlet 3 with @WebFilter Annotation.  Retrieved August 10, 2017,
                from <a href="http://www.concretepage.com/java-ee/jsp-servlet/how-to-use-filter-in-servlet-3-with-webfilter-annotation">
                    http://www.concretepage.com/java-ee/jsp-servlet/how-to-use-filter-in-servlet-3-with-webfilter-annotation</a>
            </p>
        </blockquote>
                    
        <jsp:include page="/info.jsp"/>
        
    </body>
</html>
