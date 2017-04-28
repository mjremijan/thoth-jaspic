package org.thoth.jaspic;

import javax.annotation.security.DeclareRoles;

@DeclareRoles({"public", "classified", "top secret"})
public class DeclareRolesBean {

}
