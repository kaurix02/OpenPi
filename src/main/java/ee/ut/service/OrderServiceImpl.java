package ee.ut.service;

import ee.ut.dao.OrderDao;
import ee.ut.dao.UserDao;
import ee.ut.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    public Order findOrderById(int id) {
        return orderDao.findOrderById(id);
    }

    public void saveOrder(Order order) {
        orderDao.saveOrder(order);
    }

    public void deleteOrderById(int id) {
        orderDao.deleteOrderById(id);
    }

    public List<Order> findAllOrders() {
        return orderDao.findAllOrders();
    }

    public void updateOrder(Order order) {
        Order entity = orderDao.findOrderById(order.getId());
        if(entity!=null){
            entity.setSoldPizzas(order.getSoldPizzas());
            entity.setUser(order.getUser());
            entity.setIsDone(order.getIsDone());
            entity.setTotal(order.getTotal());
            orderDao.updateOrder(entity);
        }
    }

    public Order getLast() {
        return orderDao.getLast();
    }
}
