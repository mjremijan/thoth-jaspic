package org.thoth.jaspic.security.filter;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.security.Principal;
import javax.servlet.http.HttpServletRequest;

public class HttpServletRequestProxy implements InvocationHandler {
    
    protected HttpServletRequest request;
    
    protected HttpServletRequestProxy(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Object result = null;
        
        if (method.getName().equals("getUserPrincipal")) {
            Principal p = new Principal() {
                @Override
                public String getName() {
                    return "proxy-wrapper-user";
                }
            };
            result = p;
        }
        else
        if (method.getName().equals("isUserInRole")) {
            String role
                = (String)args[0];
            if (role == null) {
                role = "";
            }
            if ("ExecutiveRole".equals(role)) {
                result = Boolean.TRUE;
            } else {
                result = Boolean.FALSE;
            }
        }
        else {
            result = method.invoke(request, args);
        }
        return result;
    }
}
