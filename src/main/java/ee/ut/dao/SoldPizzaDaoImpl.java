package ee.ut.dao;

import ee.ut.model.SoldPizza;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("soldPizzaDao")
public class SoldPizzaDaoImpl extends AbstractDao<Integer, SoldPizza> implements SoldPizzaDao{
    public SoldPizza findSoldPizzaById(int id) {
        return getByKey(id);
    }

    public void saveSoldPizza(SoldPizza soldPizza) { persist(soldPizza); }

    public void deleteSoldPizzaById(int id) {
        Query query = getSession().createSQLQuery("delete from sold_pizzas where id = :id");
        query.setString("id", String.valueOf(id));
        query.executeUpdate();
    }

    @SuppressWarnings("unchecked")
    public List<SoldPizza> findAllSoldPizzas() {
        Criteria criteria = createEntityCriteria();
        return (List<SoldPizza>) criteria.list();
    }
}
