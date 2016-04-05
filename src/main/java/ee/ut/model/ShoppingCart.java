package ee.ut.model;

import ee.ut.helpmodules.RSA;
import ee.ut.service.OrderService;
import ee.ut.service.PizzaService;
import ee.ut.service.SoldPizzaService;
import ee.ut.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.print.attribute.IntegerSyntax;
import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.*;
import java.security.*;

public class ShoppingCart implements Serializable {
    private static final long serialVersionUID = 1L;

    private Map<String, Integer> shoppingCart = new HashMap<>();

    private Map<String, String> purchaseInfo = new LinkedHashMap<String, String>();

    public Map<String, Integer> getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(Map<String, Integer> shoppingCart) {
        this.shoppingCart = shoppingCart;
    }

    public void addToShoppingCart(Pizza pizza) {
        if (shoppingCart.containsKey(pizza.getNaming())) {
            shoppingCart.replace(pizza.getNaming(), shoppingCart.get(pizza.getNaming()) + 1);
        } else shoppingCart.put(pizza.getNaming(), 1);
    }

    public void removeFromShoppingCart(Pizza pizza) {
        if (shoppingCart.containsKey(pizza.getNaming()) && shoppingCart.get(pizza.getNaming()) > 1) {
            shoppingCart.replace(pizza.getNaming(), shoppingCart.get(pizza.getNaming()) - 1);
        } else shoppingCart.remove(pizza.getNaming());
    }

    public Map<String, String> getPurchaseInfo() {
        return purchaseInfo;
    }

    private double calculateTotal(PizzaService pizzaService) {
        double total = 0;
        for (String s:shoppingCart.keySet()) {
            total += pizzaService.findPizzaByNaming(s).getPrice()*shoppingCart.get(s);
        }
        return total;
    }

    public Map<String, String> pseudoPurchaseInfo(String email, String request,  UserService userService, PizzaService pizzaService, OrderService orderService) {
        purchaseInfo.clear();
        purchaseInfo.put("VK_SERVICE", "1011");
        purchaseInfo.put("VK_VERSION", "008");
        purchaseInfo.put("VK_SND_ID", "uid100010");
        Order o = new Order();
        o.setUser(userService.findUserByEmail(email));
        o.setIsDone('f');
        o.setTotal(calculateTotal(pizzaService));
        orderService.saveOrder(o);
        purchaseInfo.put("VK_STAMP", String.valueOf(orderService.getLast().getId()));
        purchaseInfo.put("VK_AMOUNT", String.valueOf(calculateTotal(pizzaService)));
        purchaseInfo.put("VK_CURR", "EUR");
        purchaseInfo.put("VK_ACC", "EE871600161234567892");
        purchaseInfo.put("VK_NAME", "ÕIE MÄGER");
        purchaseInfo.put("VK_REF", "1234561");
        purchaseInfo.put("VK_LANG", "EST");
        purchaseInfo.put("VK_MSG", toString());
        purchaseInfo.put("VK_RETURN", request + "/successPurchase");
        purchaseInfo.put("VK_CANCEL", request + "/cancelPurchase");
        purchaseInfo.put("VK_DATETIME", "2016-04-04T21:15:17+0300");
        purchaseInfo.put("VK_ENCODING", "utf-8");
        purchaseInfo.put("VK_MAC", makeSignature());
        return purchaseInfo;
    }

    private String makeSignature() {
        String data = "";
        for (String s:purchaseInfo.keySet()) {
            if (s.equals("VK_ENCODING") || s.equals("VK_LANG")) continue;
            int temp = String.valueOf(purchaseInfo.get(s).length()).length();
            if (temp == 1) data += "00"+purchaseInfo.get(s).length();
            else if (temp == 2) data += "0"+purchaseInfo.get(s).length();
            else data += purchaseInfo.get(s).length();
            data += purchaseInfo.get(s);
        }
        String signature = "";
        try {
            signature = RSA.sign(RSA.getPrivateKey("user_key.pem"), data);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return signature;
    }

    public void realize(PizzaService pizzaService, OrderService orderService, SoldPizzaService soldPizzaService) {
        Set<SoldPizza> soldPizzas = new HashSet<>();
        for(String s:shoppingCart.keySet()) {
            SoldPizza temp = new SoldPizza();
            temp.setPizza(pizzaService.findPizzaByNaming(s));
            temp.setAmount(shoppingCart.get(s));
            soldPizzas.add(temp);
            soldPizzaService.saveSoldPizza(temp);
        }
        Order o = orderService.getLast();
        o.setSoldPizzas(soldPizzas);
        orderService.updateOrder(o);
        shoppingCart.clear();
        purchaseInfo.clear();
    }

    public String toString() {
        return shoppingCart.toString();
    }

}
