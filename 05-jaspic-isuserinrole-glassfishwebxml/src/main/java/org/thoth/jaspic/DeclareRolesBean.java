package org.thoth.jaspic;

import javax.annotation.security.DeclareRoles;

@DeclareRoles({"everybody", "the boss", "the boss's boss"})
public class DeclareRolesBean {

}
