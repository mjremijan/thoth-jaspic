package org.thoth.jaspic.customprincipal.application;

import javax.enterprise.context.ApplicationScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.servlet.ServletContext;

@Named(value = "applicationController")
@ApplicationScoped
public class ApplicationController {

    protected ServletContext servletContext;

    public ApplicationController() {
        servletContext = (ServletContext) FacesContext
            .getCurrentInstance().getExternalContext().getContext();
    }

    public String getTitle() {
        return String.valueOf(
            servletContext.getAttribute("maven.project.artifactId")
        );
    }

    public String getSecurityTitle() {
        return String.valueOf(
            servletContext.getAttribute("maven.project.artifactId")
        ).replace("-web", "-security");
    }

}
