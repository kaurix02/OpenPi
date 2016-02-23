package ee.ut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ee.ut.dao.UserDao;
import ee.ut.model.User;

//@Service("userService")
//@Transactional
public class UserServiceImpl implements UserService {
//
//    @Autowired
//    private UserDao dao;
//
//    public User findUserById(int id) {
//        return dao.findUserById(id);
//    }
//
//    public void saveUser(User user) {
//        dao.saveUser(user);
//    }
//
//    /* Transactional means, that you do actions with persistent object and hibernate will automatically commit updates, when the transaction ends.
//     * Fetch the entity from db and update it with proper values within transaction.
//     * It will be updated in db once transaction ends.
//     */
//    public void updateUser(User user) {
//        User entity = dao.findUserById(user.getId());
//        if(entity!=null){
//            entity.setUserName(user.getUserName());
//            entity.setJoiningDate(user.getJoiningDate());
//            entity.setEmail(user.getEmail());
//        }
//    }
//
//    public void deleteUserByEmail(String email) {
//        dao.deleteUserByEmail(email);
//    }
//
//    public List<User> findAllUsers() {
//        return dao.findAllUsers();
//    }
//
//    public User findUserByEmail(String email) {
//        return dao.findUserByEmail(email);
//    }
//
//    public boolean isUserEmailUnique(Integer id, String email) {
//        User user = findUserByEmail(email);
//        return ( user == null || ((id != null) && (user.getId() == id)));
//    }
}
