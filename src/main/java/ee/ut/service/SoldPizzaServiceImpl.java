package ee.ut.service;

import ee.ut.dao.SoldPizzaDao;
import ee.ut.model.SoldPizza;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("soldPizzaService")
@Transactional
public class SoldPizzaServiceImpl implements SoldPizzaService {

    @Autowired
    private SoldPizzaDao soldPizzaDao;

    public SoldPizza findSoldPizzaById(int id) {
        return soldPizzaDao.findSoldPizzaById(id);
    }

    public void saveSoldPizza(SoldPizza soldPizza) {
        soldPizzaDao.saveSoldPizza(soldPizza);
    }

    public void deleteSoldPizzaById(int id) {
        soldPizzaDao.deleteSoldPizzaById(id);
    }

    public List<SoldPizza> findAllSoldPizzas() {
        return soldPizzaDao.findAllSoldPizzas();
    }
}
