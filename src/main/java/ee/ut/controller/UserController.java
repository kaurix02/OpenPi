package ee.ut.controller;

import ee.ut.helpmodules.OverallHelp;
import ee.ut.model.Order;
import ee.ut.model.User;
import ee.ut.service.OrderService;
import ee.ut.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.*;

@Controller
public class UserController {
    @Autowired
    private HttpSession httpSession;

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String userPage(ModelMap model) {
        model.addAttribute("user", new OverallHelp().getPrincipal());
        model.addAttribute("isEstonian", httpSession.getAttribute("language"));
        User currentUser = userService.findUserByEmail(new OverallHelp().getPrincipal());
        model.addAttribute("userFirstName", currentUser.getFirstName());

        List<Order> orders = orderService.findAllOrders();
        List<Order> userOrders = new ArrayList<>();
        for (Order o : orders ) {
            if ( o.getUser().getId() == currentUser.getId() && !userOrders.contains(o)) {
                Order temp = new Order();
                temp.setSoldPizzas(o.getSoldPizzas());
                temp.setUser(o.getUser());
                temp.setTotal(o.getTotal());
                temp.setIsDone(o.getIsDone());
                temp.setId(o.getId());
                userOrders.add(temp);

            }
        }
        List<Order> temp = new ArrayList<>();
        int i = userOrders.size();
        for (int j = userOrders.size() - 1 ; j >= 0; j-- ) {
            userOrders.get(j).setTotal(Double.valueOf(new DecimalFormat("####0.00").format(userOrders.get(j).getTotal())));
            userOrders.get(j).setIsDone(userOrders.get(j).getIsDone().equals('f') ? '-' : '+');
            userOrders.get(j).setId(i);
            temp.add(userOrders.get(j));
            i--;
        }
        model.addAttribute("userOrders", temp);
        return "user_page";
    }


}
