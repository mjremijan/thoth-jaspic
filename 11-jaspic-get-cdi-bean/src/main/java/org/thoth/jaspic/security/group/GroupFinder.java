package org.thoth.jaspic.security.group;

import javax.enterprise.context.ApplicationScoped;

/**
 *
 * @author Michael Remijan mjremijan@yahoo.com @mjremijan
 */
@ApplicationScoped
public class GroupFinder {

    /**
     * Return a comma separated list of groups for the given principalId
     * @param principalId
     * @return 
     */
    public String findGroups(String principalId) {
        return "GROUP_SALARY_EMPLOYEES,GROUP_EXECUTIVES";
    }
}
