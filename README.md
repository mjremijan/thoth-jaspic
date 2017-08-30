# thoth-jaspic

Research and Development on JASPIC (JSR 196)

Areas of Research
------------------

* **01-jaspic-embedded** - Get JASPIC up and running embedded within a WAR.  Requests run the code.  Nothing actually protected.
  * Test URL: http://localhost:8080/jaspic-embedded
* **02-jaspic-goodneighbor** -
  * Test URL: http://localhost:8080/jaspic-goodneighbor
* **02-jaspic-helloworld** -
  * Test URL: http://localhost:8080/jaspic-helloworld
* **03-jaspic-principal** -
  * Test URL: http://localhost:8080/jaspic-principal
* **04-jaspic-isuserinrole-glassfishwebxml** -
  * Test URL: http://localhost:8080/jaspic-isuserinrole-glassfishwebxml
* **04-jaspic-isuserinrole-webxml** -
  * Test URL: http://localhost:8080/jaspic-isuserinrole-webxml
* **05-japsic-isuserinrole-declareroles** -
  * Test URL: http://localhost:8080/japsic-isuserinrole-declareroles
* **05-jaspic-isuserinrole-glassfishwebxml** -
  * Test URL: http://localhost:8080/jaspic-isuserinrole-glassfishwebxml
* **06-jaspic-sessionid** -
  * Test URL: http://localhost:8080/jaspic-sessionid
* **07-jaspic-multiplerequests** -
  * Test URL: http://localhost:8080/jaspic-multiplerequests
* **08-jaspic-servlet-protected-annotations** -
  * Test URL: http://localhost:8080/jaspic-servlet-protected-annotations
* **08-jaspic-servlet-protected-webxml** -
  * Test URL: http://localhost:8080/jaspic-servlet-protected-webxml
* **09-jaspic-jsp-protected-annotations** -
  * Test URL: http://localhost:8080/jaspic-jsp-protected-annotations
* **09-jaspic-jsp-protected-webxml** -
  * Test URL: http://localhost:8080/jaspic-jsp-protected-webxml
* **10-jaspic-unprotected-to-protected** -
  * Test URL: http://localhost:8080/jaspic-unprotected-to-protected
* **11-jaspic-get-cdi-bean** -
  * Test URL: http://localhost:8080/jaspic-get-cdi-bean
* **12-jaspic-ejb-integration** -
  * Test URL: http://localhost:8080/jaspic-ejb-integration
* **13-jaspic-wrapping-request-doesnt-work** -
  * Test URL: http://localhost:8080/jaspic-wrapping-request-doesnt-work
* **14-jaspic-jsf-page-protected-webxml** -
  * Test URL: http://localhost:8080/jaspic-jsf-page-protected-webxml
* **15-jaspic-jsf-managedbean-protected-webxml** -
  * Test URL: http://localhost:8080/jaspic-jsf-managedbean-protected-webxml
* **16-jaspic-jsf-ajax-protected-webxml** -
  * Test URL: http://localhost:8080/jaspic-jsf-ajax-protected-webxml
* **17-jaspic-jaxrs-protected-ejb-annotations** -
  * Test URL: http://localhost:8080/jaspic-jaxrs-protected-ejb-annotations
* **17-jaspic-jaxrs-protected-jersey-annotations** -
  * Test URL: http://localhost:8080/jaspic-jaxrs-protected-jersey-annotations
* **17-jaspic-jaxrs-protected-webxml** -
  * Test URL: http://localhost:8080/jaspic-jaxrs-protected-webxml
* **18-jaspic-contexts-in-each-major-technology** -
  * Test URL: http://localhost:8080/jaspic-contexts-in-each-major-technology
* **19-jaspic-pipestone-helloworld** -
  * Test URL: http://localhost:8080/jaspic-pipestone-helloworld
* **19-jaspic-pipestone-security** -
  * Test URL: http://localhost:8080/jaspic-pipestone-security
* **19-jaspic-pipestone-web** -
  * Test URL: http://localhost:8080/jaspic-pipestone-web
* **20-jaspic-customprincipal-security** -
  * Test URL: http://localhost:8080/jaspic-customprincipal-security
* **20-jaspic-customprincipal-web** -
  * Test URL: http://localhost:8080/jaspic-customprincipal-web



[DONE] 1. Embed with web-app
Get JASPIC up and running embedded within a WAR.  Requests run the code.  Nothing actually protected.

[DONE] 2.Run multiple applications
JASPIC webapp only affects its WAR.  Does not affect any other WAR deployed to the same server.

[DONE] 3. Principal object
Generate a Principal object from HttpServletRequest.
No roles, just a Principal with the right name

[DONE] 4a. Is User In Role (web.xml)
Generate a Principal object with ROLES from an HttpServletRequest. 
Valid roles are in web.xml

[DONE] 4b. Is User In Role (web.xml and glassfish-web.xml)
Generate a Principal object with ROLES from an HttpServletRequest. 
Application-specific, valid roles are in web.xml.  Application-specific
roles are mapped to user's groups in glassfish-web.xml

[DONE] 5a. Is User In Role (annotations)
Generate a Principal object from HttpServletRequest with roles. 
Valid roles are in @DeclaredRoles annotation

[DONE] 5b. Is User In Role (annotations and glassfish-web.xml)
Generate a Principal object with ROLES from an HttpServletRequest. 
Application-specific, valid roles are in web.xml.  Application-specific
roles are mapped to user's groups in glassfish-web.xml

[DONE] 6. Session ID
Can my code get the session id consistently?

[DONE] 7. Multiple Requests
If request 'A' sets the principal, can I make requests 'B', 'C', and
'D' and maintain that principal across the requests?

[DONE] 8a. Servlet protected (web.xml and glassfish-web.xml)
Can there be a servlet that's public which any group may access and
another servlet that's private which is accessible only by a specific 
identity management group?Everything is declared in web.xml and 
glassfish-web.xml. 

[DONE] 8b. Servlet protected (annotations)
Can there be a servlet that's public which any group may access and
another servlet that's private which is accessible only by a specific 
identity management group? Everything is declared in annotations 
except for the identity-management groups in and glassfish-web.xml.

[DONE] 9a. JSP protected (web.xml and glassfish-web.xml)
Can there be a JSP that's public which any group may access and
another JSP that's private which is accessible only by a specific 
identity management group? Everything is declared in web.xml and 
glassfish-web.xml.

[DONE] 9b. JSP protected (annotations)
Can there be a JSP that's public which any group may access and
another JSP that's private which is accessible only by a specific 
identity management group? Everything is declared in annotations 
except for the identity-management groups in glassfish-web.xml.

[DONE] 10. Unprotected to protected
If the application has a public servlet that attempts to forward
to either a protected servlet or JSP, will the forward request
be denied?

[DONE] 11. CDI integration
When I get to important code (the code I write to create
the Principal and groups) can I use the CDI to get an
instance of some object which will get the principal 
and group information for me?

[DONE] 12. EJB integration
If I have an EJB which is protected by @RolesAllowed,
will the method call fail if I don't have that role?
Will it succeed if I do have that role?

[DONE] 13. WebFilter work just as well?
Does proxying the HttpServletRequext with a @WebFilter work
just as well?

[DONE] 14. JSF page protected
Can I protect a JSF page with a web.xml
security-constraint, @DeclareRoles,
and with identity-management groups in glassfish-web.xml?

[DONE] 15. JSF managed bean call protected
Can I protect a server-side JSF managed bean call.  In other words,
if my JSF page tries to call a bean method which it should not have
access to, will the method call fail?

[DONE] 16. JSF AJAX call
Can I protect a JSF AJAX call with a web.xml
security-constraint, @DeclareRoles,
and with identity-management groups in glassfish-web.xml?

[DONE] 17.a JAX-RS call (web.xml and glassfish-web.xml)
Can I protect a JAX-RS AJAX call with a web.xml
security-constraint, @DeclareRoles,
and with identity-management groups in glassfish-web.xml?

[DONE] 17.b JAX-RS call (annotations)
Can I protect a JAX-RS AJAX call with @DeclareRoles, @RolesAllowed, 
and with identity-management groups in glassfish-web.xml? Yes,
with EJBs and no proprietory code.

[DONE] 17.c JAX-RS call (annotations)
Can I protect a JAX-RS AJAX call with @DeclareRoles, @RolesAllowed, 
and with identity-management groups in glassfish-web.xml, but 
without EJBs?

[DONE] 18. How do you get the Principle from each major technology?
 - jsp
 - servlet
 - ejb
 - jsf
 - jax-rs

[DONE] 19. pipestone-security and pipestone-web
 Can 2 projects be created where the -security project protects
 the context of the -web project?  This will allow the security
 piece to be configured and deployed seperately.

[DONE ] 20. Custom Principal object
Can I create a custom "MyPrincipal" object which can return the 
principal name along with a list of all the roles?

