package org.thoth.jaspic;

import java.util.Map;
import javax.security.auth.Subject;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.message.AuthException;
import javax.security.auth.message.MessageInfo;
import javax.security.auth.message.config.ServerAuthConfig;
import javax.security.auth.message.config.ServerAuthContext;
import org.apache.log4j.Logger;

public class TestServerAuthConfig implements ServerAuthConfig {

    private static final Logger log = Logger.getLogger(TestServerAuthConfig.class);

    private String layer;
    private String appContext;
    private CallbackHandler handler;
    private Map<String, String> providerProperties;

    public TestServerAuthConfig(String layer, String appContext,
        CallbackHandler handler, Map<String, String> providerProperties) {
        log.info(String.format("ENTER constructor(...)"));
        log.info(String.format("layer=%s", layer));
        log.info(String.format("appContext=%s", appContext));
        log.info(String.format("handler=%s", MyReflectionToStringBuilder.toString(handler)));
        log.info(String.format("providerProperties=%s", MyReflectionToStringBuilder.toString(providerProperties)));
        
        this.layer = layer;
        this.appContext = appContext;
        this.handler = handler;
        this.providerProperties = providerProperties;
    }

    /**
     * WebLogic 12c, JBoss EAP 6 and GlassFish 3.1.2.2 call this only once per
     * request, Geronimo V3 calls this before sam.validateRequest and again
     * before sam.secureRequest in the same request.
     *
     */
    @Override
    public ServerAuthContext getAuthContext(String authContextID,
        Subject serviceSubject, @SuppressWarnings("rawtypes") Map properties)
        throws AuthException {
        log.info(String.format("ENTER getAuthContext(...)"));
        log.info(String.format("authContextID=%s", authContextID));
        log.info(String.format("serviceSubject=%s", MyReflectionToStringBuilder.toString(serviceSubject)));
        log.info(String.format("properties=%s", MyReflectionToStringBuilder.toString(properties)));
        
        log.info(String.format("Create new TestServerAuthContext object"));
        return new TestServerAuthContext(handler);
    }

    @Override
    public String getMessageLayer() {
        log.info(String.format("ENTER getMessageLayer() %s", layer));
        return layer;
    }

    @Override
    public String getAuthContextID(MessageInfo messageInfo) {
        log.info(String.format("ENTER getAuthContextID(...) %s", appContext));        
        log.info(String.format("messageInfo=%s", MyReflectionToStringBuilder.toString(messageInfo)));
        return appContext;
    }

    @Override
    public String getAppContext() {
        log.info(String.format("ENTER getAppContext() %s", appContext)); 
        return appContext;
    }

    @Override
    public void refresh() {
        log.info(String.format("ENTER refresh()"));
    }

    @Override
    public boolean isProtected() {
        log.info(String.format("ENTER isProtected() false"));
        return false;
    }

    public Map<String, String> getProviderProperties() {
        log.info(String.format("ENTER isProtected() %s", MyReflectionToStringBuilder.toString(providerProperties)));
        return providerProperties;
    }

}
