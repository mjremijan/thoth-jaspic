package org.thoth.jaspic;

import javax.annotation.security.DeclareRoles;
import javax.servlet.http.HttpServlet;

@DeclareRoles({"public", "classified", "top secret"})
public class DeclareRolesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

}
