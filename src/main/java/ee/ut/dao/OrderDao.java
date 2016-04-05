package ee.ut.dao;


import ee.ut.model.Order;

import java.util.List;

public interface OrderDao {
    Order findOrderById(int id);

    void saveOrder(Order order);

    void deleteOrderById(int id);

    List<Order> findAllOrders();

    void updateOrder(Order order);

    Order getLast();
}
