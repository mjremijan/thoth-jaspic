package org.thoth.jaspic;

import javax.annotation.security.DeclareRoles;
import javax.servlet.http.HttpServlet;

@DeclareRoles({"everybody", "the boss", "the boss's boss"})
public class DeclareRolesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

}
