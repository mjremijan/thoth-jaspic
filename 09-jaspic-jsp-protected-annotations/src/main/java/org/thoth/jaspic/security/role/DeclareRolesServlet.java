package org.thoth.jaspic.security.role;

import javax.annotation.security.DeclareRoles;
import javax.servlet.http.HttpServlet;

@DeclareRoles({"ManagerRole", "AdminRole", "StockholderRole"})
public class DeclareRolesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
}
