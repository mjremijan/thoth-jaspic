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
                When I get to important code (the code I write to create
                the Principal and groups) can I use the CDI to get an
                instance of some object which will get the principal 
                and group information for me?
            </li>
        </ul>

        
        <h2>Test Results</h2>
        <blockquote>
            <p>
                Yes!
            </p>
            
            <p>
                Look at the table below.  This project has a
                <span class='code'>GroupFinder.java</span> class which is
                hard-coded to return 
                <span class='code'>GROUP_SALARY_EMPLOYEES,GROUP_EXECUTIVES</span>.
                So the user has both of those roles.  The
                <span class='code'>TestCallbackBuild.java</span> class uses
                <span class='code'>CDI</span> to lookup an instance of
                <span class='code'>GroupFinder</span>
                
            </p>
        </blockquote>
        
        <h2>References</h2>
        <blockquote>
            <p>
                14.4 The CDI class. (2016, May 23). Retrieved August 10, 2017,
                from <a href="http://docs.jboss.org/cdi/learn/userguide/CDI-user-guide.html#_the_code_cdi_code_class">
                    http://docs.jboss.org/cdi/learn/userguide/CDI-user-guide.html#_the_code_cdi_code_class</a>
            </p>
        </blockquote>
                    
        <jsp:include page="/info.jsp"/>
        
    </body>
</html>
