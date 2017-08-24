package org.thoth.jaspic.customprincipal.security.principal;

import java.security.Principal;
import javax.enterprise.context.ApplicationScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import org.apache.log4j.Logger;

@Named(value = "principalController")
@ApplicationScoped
public class PrincipalController {

    private static final Logger log = Logger.getLogger(PrincipalController.class);

    public PrincipalController() {
    }

    public String getName() {
        Principal principal
            = FacesContext.getCurrentInstance().getExternalContext().getUserPrincipal();
        String name =
            (principal == null) ? "UNKNOWN" : principal.getName();
        return name;
    }

    public String getStringRepresentation() {
        Principal principal
            = FacesContext.getCurrentInstance().getExternalContext().getUserPrincipal();
        String toString =
            (principal == null) ? "UNKNOWN" : principal.toString();
        return toString;
    }

    public boolean isUserInRole(String role) {
        return
            FacesContext
                .getCurrentInstance()
                .getExternalContext()
                .isUserInRole(role)
        ;
    }
}
