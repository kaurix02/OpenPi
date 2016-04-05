package ee.ut.service;

import ee.ut.model.SoldPizza;

import java.util.List;

/**
 * Created by Alandu on 4/3/2016.
 */
public interface SoldPizzaService {
    SoldPizza findSoldPizzaById(int id);

    void saveSoldPizza(SoldPizza soldPizza);

    void deleteSoldPizzaById(int id);

    List<SoldPizza> findAllSoldPizzas();
}
