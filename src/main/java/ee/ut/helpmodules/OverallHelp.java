package ee.ut.helpmodules;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * Created by alandu on 15.03.16.
 */
public class OverallHelp {
    public String getPrincipal(){
        String email = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            email = ((UserDetails)principal).getUsername();
        }

        return email;
    }
}
