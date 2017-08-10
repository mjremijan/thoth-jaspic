package org.thoth.jaspic.security.auth;

import javax.security.auth.message.config.AuthConfigFactory;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.apache.log4j.Logger;

@WebListener
public class TestStartupListener implements ServletContextListener {

    private static final Logger log = Logger.getLogger(TestStartupListener.class);
    
    private String registrationID;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        log.info(String.format("ENTER contextInitialized()"));
        
        String appContext
            = sce.getServletContext().getVirtualServerName() + " " + sce.getServletContext().getContextPath();
       
        AuthConfigFactory factory
            = AuthConfigFactory.getFactory();
        
        registrationID = factory.registerConfigProvider(
            new TestAuthConfigProvider(),
            "HttpServlet",
            appContext,
            "The test"
        );
        log.info(String.format("JASPIC Registered: ID=\"%s\", appContext=\"%s\"", registrationID, appContext));
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        log.info(String.format("ENTER contextDestroyed()"));
        log.info(String.format("JASPIC Un-Registered: ID=\"%s\"", registrationID));
        AuthConfigFactory factory = AuthConfigFactory.getFactory();
        factory.removeRegistration(registrationID);
    }
}
