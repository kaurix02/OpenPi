package ee.ut.dao;

import ee.ut.model.User;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao{

    public User findUserById(int id) {
        return getByKey(id);
    }

    public void saveUser(User user) { persist(user); }

    public void deleteUserByEmail(String email) {
        Query query = getSession().createSQLQuery("delete from users where email = :email");
        query.setString("email", email);
        query.executeUpdate();
    }

    @SuppressWarnings("unchecked")
    public List<User> findAllUsers() {
        Criteria criteria = createEntityCriteria();
        return (List<User>) criteria.list();
    }

    public User findUserByEmail(String email) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("email", email));
        return (User) criteria.uniqueResult();
    }
}
