/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.thoth.jaspic.pipestone.security.auth;

import static java.lang.Boolean.TRUE;
import java.security.Principal;
import java.util.Map;
import javax.security.auth.Subject;
import javax.security.auth.callback.Callback;
import javax.security.auth.message.MessageInfo;
import javax.security.auth.message.callback.CallerPrincipalCallback;
import javax.security.auth.message.callback.GroupPrincipalCallback;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.thoth.jaspic.pipestone.lang.MyReflectionToStringBuilder;

/**
 *
 * @author Michael Remijan mjremijan@yahoo.com @mjremijan
 */
public class PipestoneSecurityCallbackBuilder {

    private static final Logger log = Logger.getLogger(PipestoneSecurityCallbackBuilder.class);

    HttpServletRequest request;
    HttpSession session;
    Principal principal;
    Subject clientSubject;
    Map map;

    public PipestoneSecurityCallbackBuilder(MessageInfo messageInfo, Subject clientSubject) {
        this.request = (HttpServletRequest) messageInfo.getRequestMessage();
        this.session = request.getSession();
        this.principal = request.getUserPrincipal();
        this.clientSubject = clientSubject;
        this.map = messageInfo.getMap();
    }

    public Callback[] build() {
        log.info(String.format("ENTER build()"));

        log.info(String.format("SESSION ID=%s", session.getId()));

        Callback[] callback = null;

        if (callback == null) {
            if (principal != null) {
                log.info(String.format("Create Callback from Principal %s", MyReflectionToStringBuilder.toString(principal)));
                callback = new Callback[]{
                    new CallerPrincipalCallback(clientSubject, principal)
                };
            }
        }

        if (callback == null) {
            
            String username = "thoth-jaspic-usr";
            String groups = "GROUP_CUSTOMER_SUPPORTS,GROUP_SALARY_EMPLOYEES";

            if (groups != null) {
                log.info(String.format("Create Callback[] from HARD-CODED-GROUP"));
                log.info(String.format("REQUEST username=\"%s\"",username));
                log.info(String.format("REQUEST groups=\"%s\"",groups));
                log.info(String.format("Create Callback from REQUEST"));
                callback = new Callback[]{
                      new CallerPrincipalCallback(clientSubject, username)
                    , new GroupPrincipalCallback(clientSubject, groups.split(","))
                };
                session.setAttribute("ferris.auth.username", username);
                session.setAttribute("ferris.auth.groups", groups);
                // Tell container to register an authentication session.
                map.put("javax.servlet.http.registerSession", TRUE.toString());
            }
        }


        if (callback == null) {
            String username = (String) session.getAttribute("ferris.auth.username");
            String groups = (String) session.getAttribute("ferris.auth.groups");
            if (username != null && groups != null) {
                log.info(String.format("Create Callback[] from SESSION"));
                log.info(String.format("SESSION username=\"%s\"", username));
                log.info(String.format("SESSION groups=\"%s\"", groups));
                log.info(String.format("Create Callback from SESSION"));
                callback = new Callback[]{
                      new CallerPrincipalCallback(clientSubject, username)
                    , new GroupPrincipalCallback(clientSubject, groups.split(","))
                };
            }
        }

        return callback;
    }
}
