package ee.ut.dao;

import ee.ut.model.User;

import java.util.List;

public interface UserDao {

    User findUserById(int id);

    void saveUser(User user);

    void deleteUserByEmail(String email);

    List<User> findAllUsers();

    User findUserByEmail(String email);
}
