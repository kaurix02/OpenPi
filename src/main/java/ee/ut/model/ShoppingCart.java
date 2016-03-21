package ee.ut.model;

import javax.print.attribute.IntegerSyntax;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by alandu on 16.03.16.
 */
public class ShoppingCart implements Serializable {
    private static final long serialVersionUID = 1L;

    private Map<String, Integer> shoppingCart = new HashMap<>();

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

}
