package ee.ut.dao;

import ee.ut.model.UserRole;

public interface UserRoleDao {
    UserRole findRoleByType(String type);
}
