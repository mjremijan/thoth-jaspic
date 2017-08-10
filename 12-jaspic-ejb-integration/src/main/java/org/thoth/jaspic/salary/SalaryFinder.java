package org.thoth.jaspic.salary;

import java.security.Principal;
import javax.annotation.Resource;
import javax.annotation.security.RolesAllowed;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import org.apache.log4j.Logger;

@Stateless
@RolesAllowed({"SalaryEmployeeRole"})
public class SalaryFinder {

    private static final Logger log = Logger.getLogger(SalaryFinder.class);

    @Resource
    private SessionContext ctx;

    /**
     * Get user from SessionContext and find the user's salary.
     * 
     * @return The user's salary
     */
    public Salary findMySalary() {
        Salary s;
        
        Principal principal
            = ctx.getCallerPrincipal();
        log.info(String.format("CallerPrincipal: \"%s\"", String.valueOf(principal)));
        
        if (principal != null) {
            String name = principal.getName();
            log.info(String.format("CallerPrincipal Name: \"%s\"", name));
            s = new Salary (75000, name);
        } else {
            s = new Salary(-1, "missing");
        }
        
        return s;
    }
}
