package ee.ut.controller;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ee.ut.model.Pizza;
import ee.ut.service.PizzaService;

import ee.ut.model.User;
import ee.ut.service.UserService;


@Controller
@RequestMapping("/")
public class AppController {

    @Autowired
    PizzaService pizzaService;

    //@Autowired
    //UserService userService;

    @Autowired
    MessageSource messageSource;

    /*
     * This method will list all existing pizzas.
     */
    @RequestMapping(value = {"/pizzas"}, method = RequestMethod.GET)
    public String listPizzas(ModelMap model) {
        List<Pizza> pizzas = pizzaService.findAllPizzas();
        System.err.print(pizzas);
        model.addAttribute("pizzas", pizzas);
        return "allpizzas";
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String mainPage(ModelMap model) {
        return "mainpage";
    }

    /*
     * This method will provide the medium to register a new user.
     */

//    @RequestMapping(value = {"/registration"}, method = RequestMethod.GET)
//    public String registerUser(ModelMap model) {
//        User user = new User();
//        model.addAttribute("user", user);
//        model.addAttribute("edit", false);
//        return "registration";
//    }
//
//    /*
//     * This method will be called on form submission, handling POST request for
//     * saving user in database.
//     */
//    @RequestMapping(value = {"/registration"}, method = RequestMethod.POST)
//    public String saveUser(@Valid User user, BindingResult result,
//                           ModelMap model) {
//
//        if (result.hasErrors()) {
//            return "registration";
//        }
//
//        /*
//         * Preferred way to achieve uniqueness of field [ssn] should be implementing custom @Unique annotation
//         * and applying it on field [ssn] of Model class [Employee].
//         *
//         * Below mentioned peace of code [if block] is to demonstrate that you can fill custom errors outside the validation
//         * framework as well while still using internationalized messages.
//         *
//         */
//        if (!userService.isUserEmailUnique(user.getId(), user.getEmail())) {
//            FieldError emailError = new FieldError("user", "email", messageSource.getMessage("non.unique.email", new String[]{user.getEmail()}, Locale.getDefault()));
//            result.addError(emailError);
//            return "registration";
//        }
//
//        userService.saveUser(user);
//
//        model.addAttribute("success", "User " + user.getUserName() + " registered successfully");
//        return "success";
//    }
}
