package org.thoth.jaspic.executive;

import javax.annotation.security.RolesAllowed;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriInfo;

@Path("executive")
public class ExecutiveResource {

    @Context
    private UriInfo context;

    public ExecutiveResource() {
    }

    @GET
    @Path("contract")
    @Produces(MediaType.APPLICATION_JSON)
    @RolesAllowed({"ExecutiveRole"})
    public ExecutiveContract getContract() {
        return new ExecutiveContract("Red Book", 1000000D);
    }
}
