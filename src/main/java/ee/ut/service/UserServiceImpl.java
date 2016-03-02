package ee.ut.service;


import ee.ut.dao.UserDao;
import ee.ut.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public User findUserById(int id) {
        return userDao.findUserById(id);
    }

    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    public void updateUser(User user) {
        User entity = userDao.findUserById(user.getId());
        if(entity!=null){
            entity.setFirstName(user.getFirstName());
            entity.setLastName(user.getLastName());
            entity.setEmail(user.getEmail());
        }
    }

    public void deleteUserByEmail(String email) {
        userDao.deleteUserByEmail(email);
    }

    public List<User> findAllUsers() {
        return userDao.findAllUsers();
    }

    public User findUserByEmail(String email) {
        return userDao.findUserByEmail(email);
    }

    public boolean isUserEmailUnique(String email) {
        User user = findUserByEmail(email);
        return user == null;
    }
}