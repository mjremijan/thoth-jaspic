package org.thoth.jaspic;

import java.util.Collections;
import javax.security.auth.Subject;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.message.AuthException;
import javax.security.auth.message.AuthStatus;
import javax.security.auth.message.MessageInfo;
import javax.security.auth.message.config.ServerAuthContext;
import javax.security.auth.message.module.ServerAuthModule;
import org.apache.log4j.Logger;

public class TestServerAuthContext implements ServerAuthContext {

    private static final Logger log = Logger.getLogger(TestServerAuthContext.class);

    private ServerAuthModule serverAuthModule;

    public TestServerAuthContext(CallbackHandler handler) throws AuthException {
        log.info(String.format("ENTER constructor(...)"));
        log.info(String.format("handler=%s", MyReflectionToStringBuilder.toString(handler)));
        
        log.info("Create new TestServerAuthModule object and initialize");
        serverAuthModule = new TestServerAuthModule();
        serverAuthModule.initialize(null, null, handler,
            Collections.<String, String>emptyMap());
    }

    @Override
    public AuthStatus validateRequest(MessageInfo messageInfo,
        Subject clientSubject, Subject serviceSubject) throws AuthException {
        log.info(String.format("ENTER validateRequest(...)"));
        log.info(String.format("messageInfo=%s", MyReflectionToStringBuilder.toString(messageInfo)));
        log.info(String.format("clientSubject=%s", MyReflectionToStringBuilder.toString(clientSubject)));
        log.info(String.format("serviceSubject=%s", MyReflectionToStringBuilder.toString(serviceSubject)));
        
        log.info("CALL serverAuthModule#validateRequest");
        return serverAuthModule.validateRequest(messageInfo, clientSubject,
            serviceSubject);
    }

    @Override
    public AuthStatus secureResponse(MessageInfo messageInfo,
        Subject serviceSubject) throws AuthException {
        log.info(String.format("ENTER secureResponse(...)"));
        log.info(String.format("messageInfo=%s", MyReflectionToStringBuilder.toString(messageInfo)));
        log.info(String.format("serviceSubject=%s", MyReflectionToStringBuilder.toString(serviceSubject)));
        
        log.info("CALL serverAuthModule#secureResponse");
        return serverAuthModule.secureResponse(messageInfo, serviceSubject);
    }

    @Override
    public void cleanSubject(MessageInfo messageInfo, Subject subject)
        throws AuthException {
        log.info(String.format("ENTER cleanSubject(...)"));
        log.info(String.format("messageInfo=%s", MyReflectionToStringBuilder.toString(messageInfo)));
        log.info(String.format("subject=%s", MyReflectionToStringBuilder.toString(subject)));
        
        log.info("CALL serverAuthModule#cleanSubject");
        serverAuthModule.cleanSubject(messageInfo, subject);
    }

}
