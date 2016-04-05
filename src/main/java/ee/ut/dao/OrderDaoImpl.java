package ee.ut.dao;

import ee.ut.model.Order;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orderDao")
public class OrderDaoImpl extends AbstractDao<Integer, Order> implements OrderDao{

    public Order findOrderById(int id) {
        return getByKey(id);
    }

    public void saveOrder(Order order) { persist(order); }

    public void deleteOrderById(int id) {
        Query query = getSession().createSQLQuery("delete from orders where id = :id");
        query.setString("id", String.valueOf(id));
        query.executeUpdate();
    }

    @SuppressWarnings("unchecked")
    public List<Order> findAllOrders() {
        Criteria criteria = createEntityCriteria();
        return (List<Order>) criteria.list();
    }

    public void updateOrder(Order order) {
        getSession().update(order);
    }

    public Order getLast() {
        Query query = getSession().createSQLQuery("select id from orders where id = (select max(id) from orders)");
        return findOrderById((Integer)(query.list().get(0)));
    }

}
