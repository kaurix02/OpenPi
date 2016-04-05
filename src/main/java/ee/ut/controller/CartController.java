package ee.ut.controller;

import ee.ut.helpmodules.OverallHelp;
import ee.ut.model.Pizza;
import ee.ut.model.ShoppingCart;
import ee.ut.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("session")
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private HttpSession httpSession;

    @Autowired
    private UserService userService;

    @Autowired
    private PizzaService pizzaService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private SoldPizzaService soldPizzaService;

    private ShoppingCart shoppingCart = new ShoppingCart();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getCartShopping(ModelMap model) {
        model.addAttribute("isShopping", true);
        model.addAttribute("isEstonian", httpSession.getAttribute("language"));
        /*model.addAttribute("test", SecurityContextHolder.getContext().getAuthentication().getDetails() + "*"+new OverallHelp().getPrincipal() + "*"+httpSession.getId());*/
        List<Pizza> pizzas = pizzaService.findAllPizzas();
        model.addAttribute("pizzas", pizzas);
        /* Shopping Cart */
        model.addAttribute("userFirstName", userService.findUserByEmail(new OverallHelp().getPrincipal()).getFirstName());
        model.addAttribute("shoppingCart", shoppingCart.getShoppingCart());
        return "allpizzas_page";
    }

    @RequestMapping(value = "addToCart", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)//, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody ShoppingCart addToCart(@RequestBody Pizza pizza){// BindingResult result, ModelMap model){//) {
        shoppingCart.addToShoppingCart(pizza);
        return shoppingCart;
    }

    @RequestMapping(value = "removeFromCart", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)//, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody ShoppingCart removeFromCart(@RequestBody Pizza pizza){// BindingResult result, ModelMap model){//) {
        shoppingCart.removeFromShoppingCart(pizza);
        return shoppingCart;
    }

    @RequestMapping(value = "checkout", method = RequestMethod.GET)
    public String checkout(ModelMap model, HttpServletRequest request, @RequestParam(required = false) String success, @RequestParam(required = false) String cancel){
        if (success != null) {
            Map<String, String> map = new HashMap<>();
            map.put("SUCCESS", "TRUE");
            model.addAttribute("checkoutInfo", map);
        } else if (cancel != null) {
            orderService.deleteOrderById(orderService.getLast().getId());
            model.addAttribute("checkoutInfo", shoppingCart.pseudoPurchaseInfo(new OverallHelp().getPrincipal(), request.getRequestURL().toString(), userService, pizzaService, orderService));
        } else {
            model.addAttribute("checkoutInfo", shoppingCart.pseudoPurchaseInfo(new OverallHelp().getPrincipal(), request.getRequestURL().toString(), userService, pizzaService, orderService));
        }
        return "checkout_page";
    }

    @RequestMapping(value = "checkout/successPurchase", method = RequestMethod.POST)
    public String successPurchase(ModelMap model, HttpServletRequest request){
        model.addAttribute("checkoutInfo", shoppingCart.getPurchaseInfo());
        shoppingCart.realize(pizzaService, orderService, soldPizzaService);
        return "redirect:/cart/checkout?success";
    }

    @RequestMapping(value = "checkout/cancelPurchase", method = RequestMethod.POST)
    public String cancelPurchase(ModelMap model, HttpServletRequest request){
        model.addAttribute("checkoutInfo", shoppingCart.getPurchaseInfo());
        return "redirect:/cart/checkout?cancel";
    }




}