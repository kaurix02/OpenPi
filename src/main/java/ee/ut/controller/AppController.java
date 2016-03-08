package ee.ut.controller;

import java.util.HashSet;
import java.util.List;

import ee.ut.model.UserRole;
import ee.ut.model.UserRoleType;
import ee.ut.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.core.Authentication;

import ee.ut.model.Pizza;
import ee.ut.service.PizzaService;

import ee.ut.model.User;
import ee.ut.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;


@Controller
@RequestMapping("/")
public class AppController {

    @Autowired
    private PizzaService pizzaService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    /*
     * This method will list all existing pizzas.
     */
    @RequestMapping(value = {"/pizzas"}, method = RequestMethod.GET)
    public String listPizzas(ModelMap model) {
        List<Pizza> pizzas = pizzaService.findAllPizzas();
        model.addAttribute("pizzas", pizzas);
        return "allpizzas_page";
    }
    /*
     * Main Page
     */
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String mainPage(ModelMap model) {
        if (!(getPrincipal() == null)){
            model.addAttribute("firstName", userService.findUserByEmail(getPrincipal()).getFirstName());
            model.addAttribute("isAuthorized", true);
        } else model.addAttribute("isAuthorized", false);
        //model.addAttribute("welcome", getPrincipal());
        return "main_page";
    }

    /*
     * Registration Page
     */

    @RequestMapping(value = {"/registration"}, method = RequestMethod.GET)
    public String registrationPage(ModelMap model){
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("isUnique", true);
        model.addAttribute("registrationSuccess", false);
        return "registration_page";
    }

    /*
     * Confirm Registration if (user is valid) suceess; else tell about it and tell to try again;
     */

    @RequestMapping(value = {"/registration"}, method = RequestMethod.POST)
    public String saveUser(@Valid User user, BindingResult result, ModelMap model) {
        if (!userService.isUserEmailUnique(user.getEmail())) {
            model.addAttribute("isUnique", false);
            user.setPassword(null);
            model.addAttribute("user", user);
            return "registration_page";
        }
        user.getUserRoles().add(userRoleService.findRoleByType(UserRoleType.USER.getUserRoleType()));
        userService.saveUser(user);
        model.addAttribute("registrationSuccess", true);
        model.addAttribute("isUnique", true);
        model.addAttribute("user", new User());
        return "registration_page";
    }

    /*
     * Login Page
     */

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(ModelMap model) {
        return "login_page";
    }

    /*
     * Access denied if someone tries to access page about deliveries and products
     */

    @RequestMapping(value = "/access_denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "access_denied_page";
    }

    /*
     * In order to finish session user must log out.
     */

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    private String getPrincipal(){
        String email = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            email = ((UserDetails)principal).getUsername();
        }

        return email;
    }
}
