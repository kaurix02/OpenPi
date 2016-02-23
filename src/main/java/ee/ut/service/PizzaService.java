package ee.ut.service;

import java.util.List;

import ee.ut.model.Pizza;

public interface PizzaService {

    Pizza findPizzaById(int id);

    void savePizza(Pizza pizza);

    void updatePizza(Pizza pizza);

    void deletePizzaByNaming(String naming);

    List<Pizza> findAllPizzas();

    Pizza findPizzaByNaming(String naming);
}
