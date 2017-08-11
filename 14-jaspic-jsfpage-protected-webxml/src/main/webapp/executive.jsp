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
        <h1><%= pageContext.findAttribute("maven.project.artifactId") %> (Executive)</h1>
        
        <jsp:include page="/meta.jsp"/>

        <h2>Yes!!</h2>
        <blockquote>
            <p>
                The <span class="code">HttpServletRequestProxy</span>
                only gives you the <span class="code">ExecutiveRole</span>  
                and you're here.  So I guess that's good!
            </p>
            <p>
                <a href="<%= request.getContextPath() %>/">&lt;&lt; back</a>
            </p>
            
        </blockquote>
        
        <jsp:include page="/info.jsp"/>
    </body>
</html>
