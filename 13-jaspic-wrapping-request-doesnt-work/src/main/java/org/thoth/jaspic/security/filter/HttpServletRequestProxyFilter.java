package org.thoth.jaspic.security.filter;

import java.io.IOException;
import java.lang.reflect.Proxy;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;

@WebFilter(urlPatterns = {"/*"})
public class HttpServletRequestProxyFilter implements Filter {

    private static final Logger log = Logger.getLogger(HttpServletRequestProxyFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {  
        log.info("ENTER init()");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest proxy = (HttpServletRequest) Proxy.newProxyInstance(
              request.getClass().getClassLoader()
            , new Class[]{HttpServletRequest.class}
            , new HttpServletRequestProxy((HttpServletRequest)request)
        );
        chain.doFilter(proxy, response);
    }

    @Override
    public void destroy() {
        log.info("ENTER destroy()");
    }
    

}
