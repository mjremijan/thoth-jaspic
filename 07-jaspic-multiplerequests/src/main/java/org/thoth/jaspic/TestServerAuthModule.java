package org.thoth.jaspic;

import java.io.IOException;
import java.security.Principal;
import java.util.Map;
import java.util.Set;
import javax.security.auth.Subject;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.UnsupportedCallbackException;
import javax.security.auth.message.AuthException;
import javax.security.auth.message.AuthStatus;
import static javax.security.auth.message.AuthStatus.SEND_SUCCESS;
import static javax.security.auth.message.AuthStatus.SUCCESS;
import javax.security.auth.message.MessageInfo;
import javax.security.auth.message.MessagePolicy;
import javax.security.auth.message.config.ServerAuthContext;
import javax.security.auth.message.module.ServerAuthModule;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

public class TestServerAuthModule implements ServerAuthModule {

    private static final Logger log = Logger.getLogger(TestServerAuthModule.class);

    private CallbackHandler handler;
    private Map<String, String> options;
    private final Class<?>[] supportedMessageTypes = new Class[]{HttpServletRequest.class, HttpServletResponse.class};

    @Override
    @SuppressWarnings("unchecked")
    public void initialize(MessagePolicy requestPolicy, MessagePolicy responsePolicy, CallbackHandler handler, @SuppressWarnings("rawtypes") Map options) throws AuthException {
        this.handler = handler;
        this.options = options;
    }

    /**
     * A Servlet Container Profile compliant implementation should return HttpServletRequest and
     * HttpServletResponse, so the delegation class {@link ServerAuthContext} can choose the right
     * SAM to delegate to.
     */
    @Override
    public Class<?>[] getSupportedMessageTypes() {
        return supportedMessageTypes;
    }

    @Override
    public AuthStatus validateRequest(MessageInfo messageInfo, Subject clientSubject, Subject serviceSubject) throws AuthException {
        log.info(String.format("ENTER validateRequest(...)"));
        log.info(String.format("messageInfo=%s", MyReflectionToStringBuilder.toString(messageInfo)));
        log.info(String.format("clientSubject=%s", MyReflectionToStringBuilder.toString(clientSubject)));
        log.info(String.format("serviceSubject=%s", MyReflectionToStringBuilder.toString(serviceSubject)));

        // *********************************************************************
        Callback[] callback
            = new TestCallbackBuilder(messageInfo,clientSubject).build();

        if (callback != null) {
            try {
                handler.handle(callback);
            } catch (IOException | UnsupportedCallbackException e) {
                throw new RuntimeException("Problem with handler handling the Callback", e);
            }
        }

        return SUCCESS;
    }

    @Override
    public AuthStatus secureResponse(MessageInfo messageInfo, Subject serviceSubject) throws AuthException {
        return SEND_SUCCESS;
    }

    /**
     * Called in response to a {@link HttpServletRequest#logout()} call.
     *
     */
    @Override
    public void cleanSubject(MessageInfo messageInfo, Subject subject) throws AuthException {

        if (subject != null) {
            Set<Principal> principals
                = subject.getPrincipals();
            if (principals != null) {
                principals.clear();
            }
        }
    }
}
