package org.thoth.jaspic.executive;

import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;

@Stateless
public class ExecutiveApprovals {
    @RolesAllowed({"ExecutiveRole"})
    public String approveContract() {
        return "APPROVED";
    }
}
