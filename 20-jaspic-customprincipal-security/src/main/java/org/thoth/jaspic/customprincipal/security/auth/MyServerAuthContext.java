package org.thoth.jaspic.customprincipal.security.auth;

import java.util.Collections;
import javax.security.auth.Subject;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.message.AuthException;
import javax.security.auth.message.AuthStatus;
import javax.security.auth.message.MessageInfo;
import javax.security.auth.message.config.ServerAuthContext;
import javax.security.auth.message.module.ServerAuthModule;

public class MyServerAuthContext implements ServerAuthContext {

    private ServerAuthModule serverAuthModule;

    public MyServerAuthContext(CallbackHandler handler) throws AuthException {
        serverAuthModule = new MyServerAuthModule();
        serverAuthModule.initialize(null, null, handler,
            Collections.<String, String>emptyMap());
    }

    @Override
    public AuthStatus validateRequest(MessageInfo messageInfo,
        Subject clientSubject, Subject serviceSubject) throws AuthException {
        return serverAuthModule.validateRequest(messageInfo, clientSubject,
            serviceSubject);
    }

    @Override
    public AuthStatus secureResponse(MessageInfo messageInfo,
        Subject serviceSubject) throws AuthException {
        return serverAuthModule.secureResponse(messageInfo, serviceSubject);
    }

    @Override
    public void cleanSubject(MessageInfo messageInfo, Subject subject)
        throws AuthException {
        serverAuthModule.cleanSubject(messageInfo, subject);
    }

}
