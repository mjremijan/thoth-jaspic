package org.thoth.jaspic.pipestone.executive;

import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;

@Stateless
public class ExecutiveContract {

    @RolesAllowed({"ExecutiveRole"})
    public String getContractDetails() {
        return "Contract_Details";
    }
}
