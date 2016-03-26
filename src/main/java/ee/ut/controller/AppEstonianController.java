package ee.ut.controller;

import ee.ut.helpmodules.OverallHelp;
import ee.ut.model.User;
import ee.ut.model.UserRoleType;
import ee.ut.service.PizzaService;
import ee.ut.service.UserRoleService;
import ee.ut.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/ee")
public class AppEstonianController {
    @Autowired
    private PizzaService pizzaService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private HttpSession httpSession;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String mainPageEesti(ModelMap model) {
        if (!(new OverallHelp().getPrincipal() == null)){
            model.addAttribute("userFirstName", userService.findUserByEmail(new OverallHelp().getPrincipal()).getFirstName());
            model.addAttribute("isAuthorized", true);
        } else model.addAttribute("isAuthorized", false);
        return "main_page_ee";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPageEesti(ModelMap model) {
        return "login_page_ee";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registrationPage(ModelMap model){
        User user = new User();
        model.addAttribute("user", user);
        return "registration_page_ee";
    }

    /*
     * Confirm Registration if (user is valid) suceess; else tell about it and tell to try again;
     */

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String saveUser(User user, BindingResult result, ModelMap model) {
        //return "redirect:/";
        if (!userService.isUserEmailUnique(user.getEmail())) {
            user.setPassword(null);
            model.addAttribute("user", user);
            return "redirect:/ee/registration?unique";
        }
        user.getUserRoles().add(userRoleService.findRoleByType(UserRoleType.USER.getUserRoleType()));
        userService.saveUser(user);
        model.addAttribute("user", new User());
        return "redirect:/ee/registration?success";
    }

    /*
     * Access denied if someone tries to access page about deliveries and products
     */

    /*@RequestMapping(value = "/access_denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", new OverallHelp().getPrincipal());
        return "access_denied_page";
    }*/

    /*
     * In order to finish session user must log out.
     */

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/ee/login?logout";
    }
}
