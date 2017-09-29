package org.thoth.jaspic.security.role;

import javax.annotation.security.DeclareRoles;

@DeclareRoles({"manager.ManagerServlet", "admin.AdminServlet"})
public class DeclareRolesBean {
}
