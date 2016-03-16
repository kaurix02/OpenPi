package ee.ut.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by alandu on 16.03.16.
 */
public class ShoppingCart implements Serializable {
    private static final long serialVersionUID = 1L;

    private List<Pizza> shoppingCart;

    public List<Pizza> getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(List<Pizza> shoppingCart) {
        this.shoppingCart = shoppingCart;
    }

}
