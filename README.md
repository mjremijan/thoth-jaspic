# thoth-jaspic

Research and Development on JASPIC (JSR 196)

Areas of Research
------------------

* **01-jaspic-embedded** - Get JASPIC up and running embedded within a WAR.  Requests run the JASPIC code.  Nothing actually protected.
  * Test URL: http://localhost:8080/jaspic-embedded
* **02-jaspic-goodneighbor** - JASPIC webapp only affects this WAR.  Does not affect any other WAR deployed to the same server.
  * Test URL: http://localhost:8080/jaspic-goodneighbor
* **02-jaspic-helloworld** - A "hello world" app to go with test 02 to verify the JASPIC code is not run when this application is accessed. 
  * Test URL: http://localhost:8080/jaspic-helloworld
* **03-jaspic-principal** - Generate a Principal object from HttpServletRequest.
            No roles, just a Principal with the right name
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

Enjoy!

