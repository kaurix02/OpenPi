package ee.ut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ee.ut.dao.PizzaDao;
import ee.ut.model.Pizza;

@Service("pizzaService")
@Transactional
public class PizzaServiceImpl implements PizzaService {

    @Autowired
    private PizzaDao pizzaDao;

    public Pizza findPizzaById(int id) {
        return pizzaDao.findPizzaById(id);
    }

    public void savePizza(Pizza pizza) {
        pizzaDao.savePizza(pizza);
    }

    public void updatePizza(Pizza pizza) {
        Pizza entity = pizzaDao.findPizzaById(pizza.getId());
        if(entity!=null){
            entity.setNaming(pizza.getNaming());
            entity.setDescription(pizza.getDescription());
        }
    }

    public void deletePizzaByNaming(String naming) {
        pizzaDao.deletePizzaByNaming(naming);
    }

    public List<Pizza> findAllPizzas() {
        return pizzaDao.findAllPizzas();
    }

    public Pizza findPizzaByNaming(String naming) {
        return pizzaDao.findPizzaByNaming(naming);
    }
}
