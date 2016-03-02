package ee.ut.service;


import ee.ut.model.User;

import java.util.List;

public interface UserService {

    User findUserById(int id);

    void saveUser(User user);

    void updateUser(User user);

    void deleteUserByEmail(String email);

    List<User> findAllUsers();

    User findUserByEmail(String email);

    boolean isUserEmailUnique(String email);
}
