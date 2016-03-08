package ee.ut.service;

import ee.ut.dao.UserRoleDao;
import ee.ut.model.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userRoleService")
@Transactional
public class UserRoleServiceImpl implements UserRoleService {
    @Autowired
    private UserRoleDao userRoleDao;

    public UserRole findRoleByType(String type) {
        return userRoleDao.findRoleByType(type);
    }
}
