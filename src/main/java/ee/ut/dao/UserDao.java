package ee.ut.dao;

import ee.ut.model.User;
import org.springframework.security.core.GrantedAuthority;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public interface UserDao {

    User findUserById(int id);

    void saveUser(User user);

    void deleteUserByEmail(String email);

    List<User> findAllUsers();

    User findUserByEmail(String email);

}
