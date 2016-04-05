package ee.ut.service;

import ee.ut.model.Order;

import java.util.List;

/**
 * Created by Alandu on 4/3/2016.
 */
public interface OrderService {
    Order findOrderById(int id);

    void saveOrder(Order order);

    void deleteOrderById(int id);

    List<Order> findAllOrders();

    void updateOrder(Order order);

    Order getLast();
}
