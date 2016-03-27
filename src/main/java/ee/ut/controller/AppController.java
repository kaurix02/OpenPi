package ee.ut.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.*;

import ee.ut.helpmodules.OverallHelp;
import ee.ut.helpmodules.PizzaFact;
import ee.ut.helpmodules.RegistrationHelp;
import ee.ut.model.*;
import ee.ut.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.session.HttpSessionCreatedEvent;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.core.Authentication;

import ee.ut.service.PizzaService;

import ee.ut.service.UserService;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
@Scope("session")
public class AppController {
    @Autowired
    private PizzaService pizzaService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private HttpSession httpSession;

    @Autowired
    private UserDetailsService userDetailsService;

    private boolean isEstonian = false;

    /*
     * This method will list all existing pizzas.
     */
    @RequestMapping(value = {"/pizzas"}, method = RequestMethod.GET)
    public String listPizzas(ModelMap model) {
        if (new OverallHelp().getPrincipal() != null) {
            //model.addAttribute("userFirstName", userService.findUserByEmail(new OverallHelp().getPrincipal()).getFirstName());
            return "redirect:/cart/";
        }
        model.addAttribute("isEstonian", isEstonian);
        List<Pizza> pizzas = pizzaService.findAllPizzas();
        model.addAttribute("test", SecurityContextHolder.getContext().getAuthentication().getDetails() +"*"+httpSession.getId());
        model.addAttribute("isShopping", false);
        model.addAttribute("pizzas", pizzas);
        return "allpizzas_page";
    }
    /*
     * Main Page
     */
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String mainPage(ModelMap model) {
        //SecurityContextHolder.getContext().getAuthentication().
        if (!(new OverallHelp().getPrincipal() == null)){
            model.addAttribute("userFirstName", userService.findUserByEmail(new OverallHelp().getPrincipal()).getFirstName());
            model.addAttribute("isAuthorized", true);
        } else model.addAttribute("isAuthorized", false);
        model.addAttribute("isEstonian", isEstonian);
        return "main_page";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String setLanguage(String string){// BindingResult result, ModelMap model){//) {
        if (string.equals("estonian")) {
            isEstonian = true;
        } else isEstonian = false;
        httpSession.setAttribute("language", isEstonian);
        //sc.setShoppingCart(listOfProducts);*/
        //log.info(listOfProducts.toString());
        //System.err.println("***********************************" +listOfProducts + "**************************************************");
        //model.addAttribute("listOfProducts", listOfProducts.toString());
        return "redirect:/";
    }

    /*
     * Registration Page
     */

    @RequestMapping(value = {"/registration"}, method = RequestMethod.GET)
    public String registrationPage(ModelMap model){
        User user = new User();
        model.addAttribute("isEstonian", isEstonian);
        model.addAttribute("user", user);
        return "registration_page";
    }

    @RequestMapping(value = {"/funpizzafacts"}, method = RequestMethod.GET)
    public String funPizzaFactsPage(ModelMap model){
        return "fun_pizza_facts";
    }

    public static ArrayList<PizzaFact> pizzaFacts = new ArrayList<>(Arrays.asList(
            new PizzaFact("1", "Lol fact"),
            new PizzaFact("2", "Lol fa2ct"),
            new PizzaFact("3", "Lol f3ct"),
            new PizzaFact("4", "Lol fa4ct"),
            new PizzaFact("5", "Lol fa5ct")
    ));
    @RequestMapping(value = {"/funpizzafacts/iwantsomefact"}, method = RequestMethod.GET)
    public @ResponseBody PizzaFact funPizzaFactsPage(ModelMap model, HttpServletRequest request){
        String id = request.getParameter("id");
        for (PizzaFact pizzaFact : pizzaFacts) {
            if (pizzaFact.id.equals(id)){
                return pizzaFact;
            }
        }
        return pizzaFacts.get(0);
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
            return "redirect:/registration?unique";
        }
        user.getUserRoles().add(userRoleService.findRoleByType(UserRoleType.USER.getUserRoleType()));
        userService.saveUser(user);
        model.addAttribute("user", new User());
        return "redirect:/registration?success";
    }

    @RequestMapping(value = "/facebooklogin", method = RequestMethod.POST)
    public @ResponseBody User facebookLogin(@RequestBody User user, BindingResult result, ModelMap model) {
        if (!userService.isUserEmailUnique(user.getEmail())) {
            model.addAttribute("user", user);
            UserDetails userD = userDetailsService.loadUserByUsername(user.getEmail());
            Authentication auth =
                    new UsernamePasswordAuthenticationToken(userD, null, userD.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(auth);

            return user;
        }
        user.getUserRoles().add(userRoleService.findRoleByType(UserRoleType.USER.getUserRoleType()));
        user.setPassword(UUID.randomUUID().toString().replace("-", ""));
        userService.saveUser(user);
        model.addAttribute("user", user);
        UserDetails userD = userDetailsService.loadUserByUsername(user.getEmail());
        Authentication auth =
                new UsernamePasswordAuthenticationToken(userD, null, userD.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);

        return user;
    }

    /*
     * Login Page
     */

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(ModelMap model) {
        model.addAttribute("isEstonian", isEstonian);
        return "login_page";
    }

    /*
     * Access denied if someone tries to access page about deliveries and products
     */

    @RequestMapping(value = "/access_denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", new OverallHelp().getPrincipal());
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


}
