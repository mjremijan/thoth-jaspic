package org.thoth.jaspic;

import java.io.IOException;
import java.security.Principal;
import java.util.Enumeration;
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
import javax.security.auth.message.callback.CallerPrincipalCallback;
import javax.security.auth.message.callback.GroupPrincipalCallback;
import javax.security.auth.message.config.ServerAuthContext;
import javax.security.auth.message.module.ServerAuthModule;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

public class TestServerAuthModule implements ServerAuthModule {

    private static final Logger log = Logger.getLogger(TestServerAuthModule.class);

    private CallbackHandler handler;
    private Map<String, String> options;
    private final Class<?>[] supportedMessageTypes = new Class[]{HttpServletRequest.class, HttpServletResponse.class};

    @Override
    @SuppressWarnings("unchecked")
    public void initialize(MessagePolicy requestPolicy, MessagePolicy responsePolicy, CallbackHandler handler, @SuppressWarnings("rawtypes") Map options) throws AuthException {
        log.info(String.format("ENTER initialize(...)"));
        log.info(String.format("requestPolicy=%s", MyReflectionToStringBuilder.toString(requestPolicy)));
        log.info(String.format("responsePolicy=%s", MyReflectionToStringBuilder.toString(responsePolicy)));
        log.info(String.format("handler=%s", MyReflectionToStringBuilder.toString(handler)));
        log.info(String.format("options=%s", MyReflectionToStringBuilder.toString(options)));

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
        log.info(String.format("ENTER getSupportedMessageTypes() %s", MyReflectionToStringBuilder.toString(supportedMessageTypes)));
        return supportedMessageTypes;
    }

    @Override
    public AuthStatus validateRequest(MessageInfo messageInfo, Subject clientSubject, Subject serviceSubject) throws AuthException {
        log.info(String.format("ENTER validateRequest(...)"));
        log.info(String.format("messageInfo=%s", MyReflectionToStringBuilder.toString(messageInfo)));
        log.info(String.format("clientSubject=%s", MyReflectionToStringBuilder.toString(clientSubject)));
        log.info(String.format("serviceSubject=%s", MyReflectionToStringBuilder.toString(serviceSubject)));

        HttpServletRequest request
            = (HttpServletRequest) messageInfo.getRequestMessage();
        HttpServletResponse response
            = (HttpServletResponse) messageInfo.getResponseMessage();

        {
            StringBuilder sp = new StringBuilder("::HEADERS::\n");
            Enumeration<String> names
                = request.getHeaderNames();

            while (names.hasMoreElements()) {
                String name = names.nextElement();
                String valu = request.getHeader(name);
                sp.append(String.format("  NAME=\"%s\", VALUE=\"%s\"\n", name, valu));
            }
            log.info(String.format("%n%s", sp.toString()));
        }

        {
            StringBuilder sp = new StringBuilder("::PARAMETERS::\n");
            Enumeration<String> names
                = request.getParameterNames();

            while (names.hasMoreElements()) {
                String name = names.nextElement();
                String valu = request.getParameter(name);
                sp.append(String.format("  NAME=\"%s\", VALUE=\"%s\"\n", name, valu));
            }
            log.info(String.format("%n%s", sp.toString()));
        }

        
        HttpSession session
                = request.getSession();
        log.info(String.format("SESSION: %s%n", session.getId()));
        
        log.info("Setting session attribute org.thoth.jaspic.sessiontest with value Hello World");
        session.setAttribute("org.thoth.jaspic.sessiontest", "Hello Session");        
        
        log.info(String.format("CALL this#authenticateUser(...)"));
        authenticateUser(clientSubject, serviceSubject);

        return SUCCESS;
    }

    @Override
    public AuthStatus secureResponse(MessageInfo messageInfo, Subject serviceSubject) throws AuthException {
        log.info(String.format("ENTER secureResponse(...)"));
        log.info(String.format("messageInfo=%s", MyReflectionToStringBuilder.toString(messageInfo)));
        log.info(String.format("serviceSubject=%s", MyReflectionToStringBuilder.toString(serviceSubject)));

        log.info(String.format("return SEND_SUCCESS"));
        return SEND_SUCCESS;
    }

    /**
     * Called in response to a {@link HttpServletRequest#logout()} call.
     *
     */
    @Override
    public void cleanSubject(MessageInfo messageInfo, Subject subject) throws AuthException {
        log.info(String.format("ENTER cleanSubject(...)"));
        log.info(String.format("messageInfo=%s", MyReflectionToStringBuilder.toString(messageInfo)));
        log.info(String.format("subject=%s", MyReflectionToStringBuilder.toString(subject)));

        if (subject != null) {
            log.info(String.format("Subject is not null"));
            Set<Principal> principals
                = subject.getPrincipals();
            if (principals != null) {
                log.info(String.format("Principals is not null"));
                principals.clear();
            }
        }
    }

    private void authenticateUser(Subject clientSubject, Subject serverSubject)
    {
        CallerPrincipalCallback callerPrincipalCallback
            = new CallerPrincipalCallback(clientSubject, "jaspic-testing-usr");

        GroupPrincipalCallback groupPrincipalCallback
            = new GroupPrincipalCallback(clientSubject, null);

        try {
            handler.handle(
                new Callback[]{
                    callerPrincipalCallback,groupPrincipalCallback
                }
            );
        } catch (IOException | UnsupportedCallbackException e) {
            throw new RuntimeException("Problem creating CallerPrincipalCallback", e);
        }
    }
}
