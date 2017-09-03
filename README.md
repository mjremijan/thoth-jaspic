# thoth-jaspic

Research and Development on JASPIC (JSR 196)

Areas of Research
------------------

* **01-jaspic-embedded** - Get JASPIC up and running embedded within a WAR.  
    Requests run the JASPIC code.  Nothing actually protected.
  * Test URL: http://localhost:8080/01-jaspic-embedded

* **02-jaspic-goodneighbor** - JASPIC webapp only affects this WAR.  
    Does not affect any other WAR deployed to the same server.
  * Test URL: http://localhost:8080/02-jaspic-goodneighbor

* **02-jaspic-helloworld** - A "hello world" app to go with test 02 to verify the JASPIC code is not run when this application is accessed. 
  * Test URL: http://localhost:8080/02-jaspic-helloworld

* **03-jaspic-principal** - Generate a Principal object from HttpServletRequest.
            No roles, just a Principal with the right name
  * Test URL: http://localhost:8080/03-jaspic-principal

* **04-jaspic-isuserinrole-glassfishwebxml** - Generate a Principal object with ROLES from an HttpServletRequest. 
            Application-specific, valid roles are in web.xml.  Application-specific
            roles are mapped to user's groups in glassfish-web.xml
  * Test URL: http://localhost:8080/04-jaspic-isuserinrole-glassfishwebxml

* **04-jaspic-isuserinrole-webxml** - Generate a Principal object with ROLES from an HttpServletRequest. 
            Valid roles are in web.xml
  * Test URL: http://localhost:8080/jaspic-isuserinrole-webxml

* **05-japsic-isuserinrole-declareroles** - Generate a Principal object from HttpServletRequest with roles. 
            Valid roles are in @DeclaredRoles annotation
  * Test URL: http://localhost:8080/05-japsic-isuserinrole-declareroles

* **05-jaspic-isuserinrole-glassfishwebxml** - Generate a Principal object with ROLES from an HttpServletRequest. 
            Application-specific, valid roles are in web.xml.  Application-specific
            roles are mapped to user's groups in glassfish-web.xml
  * Test URL: http://localhost:8080/05-jaspic-isuserinrole-glassfishwebxml

* **06-jaspic-sessionid** - Can my code get the session id consistently?
  * Test URL: http://localhost:8080/06-jaspic-sessionid
* **07-jaspic-multiplerequests** - If request 'A' sets the principal, can I make requests 'B', 'C', and
            'D' and maintain that principal across the requests?
  * Test URL: http://localhost:8080/07-jaspic-multiplerequests
* **08-jaspic-servlet-protected-annotations** - Can there be a servlet that's public which any group may access and
            another servlet that's private which is accessible only by a specific 
            identity management group? Everything is declared in annotations 
            except for the identity-management groups in and glassfish-web.xml. 
  * Test URL: http://localhost:8080/08-jaspic-servlet-protected-annotations
* **08-jaspic-servlet-protected-webxml** - Can there be a servlet that's public which any group may access and
            another servlet that's private which is accessible only by a specific 
            identity management group?Everything is declared in web.xml and 
            glassfish-web.xml.
  * Test URL: http://localhost:8080/08-jaspic-servlet-protected-webxml
* **09-jaspic-jsp-protected-annotations** - Can there be a JSP that's public which any group may access and
            another JSP that's private which is accessible only by a specific 
            identity management group? Everything is declared in annotations 
            except for the identity-management groups in glassfish-web.xml.
  * Test URL: http://localhost:8080/09-jaspic-jsp-protected-annotations
* **09-jaspic-jsp-protected-webxml** - Can there be a JSP that's public which any group may access and
            another JSP that's private which is accessible only by a specific 
            identity management group? Everything is declared in web.xml and 
            glassfish-web.xml.
  * Test URL: http://localhost:8080/09-jaspic-jsp-protected-webxml
* **10-jaspic-unprotected-to-protected** - If the application has a public servlet that attempts to forward
            to either a protected servlet or JSP, will the forward request
            be denied?
  * Test URL: http://localhost:8080/10-jaspic-unprotected-to-protected
* **11-jaspic-get-cdi-bean** - When I get to important code (the code I write to create
            the Principal and groups) can I use the CDI to get an
            instance of some object which will get the principal 
            and group information for me?
  * Test URL: http://localhost:8080/11-jaspic-get-cdi-bean
* **12-jaspic-ejb-integration** - If I have an EJB which is protected by @RolesAllowed,
            will the method call fail if I don't have that role?
            Will it succeed if I do have that role?
  * Test URL: http://localhost:8080/12-jaspic-ejb-integration
* **13-jaspic-wrapping-request-doesnt-work** - Does proxying the HttpServletRequext with a @WebFilter work
            just as well?
  * Test URL: http://localhost:8080/13-jaspic-wrapping-request-doesnt-work
* **14-jaspic-jsf-page-protected-webxml** - Can I protect a JSF page with a web.xml
            security-constraint, @DeclareRoles,
            and with identity-management groups in glassfish-web.xml?
  * Test URL: http://localhost:8080/14-jaspic-jsf-page-protected-webxml
* **15-jaspic-jsf-managedbean-protected-webxml** - JSF managed bean call protected
            Can I protect a server-side JSF managed bean call.  In other words,
            if my JSF page tries to call a bean method which it should not have
            access to, will the method call fail?
  * Test URL: http://localhost:8080/15-jaspic-jsf-managedbean-protected-webxml
* **16-jaspic-jsf-ajax-protected-webxml** - Can I protect a JSF AJAX call with a web.xml
            security-constraint, @DeclareRoles,
            and with identity-management groups in glassfish-web.xml?
  * Test URL: http://localhost:8080/16-jaspic-jsf-ajax-protected-webxml
* **17-jaspic-jaxrs-protected-ejb-annotations** - Can I protect a JAX-RS AJAX call with @DeclareRoles, @RolesAllowed, 
            and with identity-management groups in glassfish-web.xml? Yes,
            with EJBs and no proprietory Jersey code.
  * Test URL: http://localhost:8080/17-jaspic-jaxrs-protected-ejb-annotations
* **17-jaspic-jaxrs-protected-jersey-annotations** - Can I protect a JAX-RS AJAX call with @DeclareRoles, @RolesAllowed, 
            and with identity-management groups in glassfish-web.xml, but 
            without EJBs? Yes, but you must have Jersey specific code :(
  * Test URL: http://localhost:8080/17-jaspic-jaxrs-protected-jersey-annotations
* **17-jaspic-jaxrs-protected-webxml** - Can I protect a JAX-RS AJAX call with a web.xml
            security-constraint, @DeclareRoles,
            and with identity-management groups in glassfish-web.xml?
  * Test URL: http://localhost:8080/17-jaspic-jaxrs-protected-webxml
* **18-jaspic-contexts-in-each-major-technology** - How do you get the Principle from each major technology?
  * JSP
  * Servlet
  * EJB
  * JSF
  * JAX-RS
  * Test URL: http://localhost:8080/18-jaspic-contexts-in-each-major-technology
* **19-jaspic-pipestone-helloworld** - A "helloworld" test application to test that this application is **NOT** protected by jaspic-pipestone-security 
  * Test URL: http://localhost:8080/19-jaspic-pipestone-helloworld
* **19-jaspic-pipestone-security** - Can I separte the JASPIC securty code from my applications code,
             essentially creating 2 projects where the "-security" project protects
             the context of the "-web" project?  This will allow the security
             piece to be configured and deployed seperately.  This is the security code.
  * Test URL: http://localhost:8080/19-jaspic-pipestone-security
* **19-jaspic-pipestone-web** - A "web" test application to test that this application **IS** protected by jaspic-pipestone-security
  * Test URL: http://localhost:8080/19-jaspic-pipestone-web
* **20-jaspic-customprincipal-security** - This is the customprincipal "security" project.  This project has a
            custom `MyPrincipal` object that has an overloaded `toString()` method that returns a JSON
            representation of the principal name, roles, and other principal data.
  * Test URL: http://localhost:8080/20-jaspic-customprincipal-security
* **20-jaspic-customprincipal-web** - This is the customprincipal "web" project.  It is protected by
            customprincipal-security.  Although ustomprincipal-security uses a custom
            `MyPrincipal` object, this "web" project does not know about that class (does **not** have
            a dependency on the class) and therefore cannot typecast to the `MyPrincipal` object type.
            However, since `MyPrincipal#toString()` is overloaded and returns a JSON representation of
            the principal data, this "web" project can parse that JSON and do whatever it needs to with it.
  * Test URL: http://localhost:8080/20-jaspic-customprincipal-web

Enjoy!

