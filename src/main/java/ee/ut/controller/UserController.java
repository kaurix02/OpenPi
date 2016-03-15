package ee.ut.controller;

import ee.ut.helpmodules.OverallHelp;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String userPage(ModelMap model) {
        model.addAttribute("user", new OverallHelp().getPrincipal());
        model.addAttribute("test", SecurityContextHolder.getContext().getAuthentication().getDetails());
        return "user_page";
    }
}
