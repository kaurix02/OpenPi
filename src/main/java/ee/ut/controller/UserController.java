package ee.ut.controller;

import ee.ut.helpmodules.OverallHelp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private HttpSession httpSession;

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String userPage(ModelMap model) {
        model.addAttribute("user", new OverallHelp().getPrincipal());
        model.addAttribute("test", SecurityContextHolder.getContext().getAuthentication().getDetails() + "*"+new OverallHelp().getPrincipal() + "*"+httpSession.getId());
        return "user_page";
    }
}
