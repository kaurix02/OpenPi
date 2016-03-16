package ee.ut.controller;

/**
 * Created by alandu on 15.03.16.
 */

import ee.ut.helpmodules.OverallHelp;
import ee.ut.model.Pizza;
import ee.ut.model.ShoppingCart;
import ee.ut.service.PizzaService;
import ee.ut.service.PizzaServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
//@Scope("session")
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private HttpSession httpSession;

    @Autowired
    private PizzaService pizzaService;

    private List<Pizza> listOfProducts = new ArrayList<>();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getCartShopping(ModelMap model) {
        model.addAttribute("listOfProducts", "empty");
        model.addAttribute("isShopping", true);
        model.addAttribute("test", SecurityContextHolder.getContext().getAuthentication().getDetails() + "*"+new OverallHelp().getPrincipal() + "*"+httpSession.getId());
        List<Pizza> pizzas = pizzaService.findAllPizzas();
        model.addAttribute("pizzas", pizzas);
        return "allpizzas_page";
    }

    @RequestMapping(value = "addToCart", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)//, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody Pizza addToCart(@RequestBody Pizza pizza){// BindingResult result, ModelMap model){//) {
        /*listOfProducts.add(pizza);
        ShoppingCart sc = new ShoppingCart();
        sc.setShoppingCart(listOfProducts);*/
        //log.info(listOfProducts.toString());
        //System.err.println("***********************************" +listOfProducts + "**************************************************");
        //model.addAttribute("listOfProducts", listOfProducts.toString());
        return pizza;
    }
}