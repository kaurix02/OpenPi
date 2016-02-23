package ee.ut.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import ee.ut.model.Pizza;

@Repository("pizzaDao")
public class PizzaDaoImpl extends AbstractDao<Integer, Pizza> implements PizzaDao {

    public Pizza findPizzaById(int id) {
        return getByKey(id);
    }

    public void savePizza(Pizza pizza) { persist(pizza); }

    public void deletePizzaByNaming(String naming) {
        Query query = getSession().createSQLQuery("delete from pizzas where naming = :naming");
        query.setString("naming", naming);
        query.executeUpdate();
    }

    @SuppressWarnings("unchecked")
    public List<Pizza> findAllPizzas() {
        Criteria criteria = createEntityCriteria();
        return (List<Pizza>) criteria.list();
    }

    public Pizza findPizzaByNaming(String naming) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("naming", naming));
        return (Pizza) criteria.uniqueResult();
    }
}
