package ee.ut.dao;

import java.util.List;
import ee.ut.model.Pizza;

public interface PizzaDao {

    Pizza findPizzaById(int id);

    void savePizza(Pizza pizza);

    void deletePizzaByNaming(String naming);

    List<Pizza> findAllPizzas();

    Pizza findPizzaByNaming(String naming);
}
