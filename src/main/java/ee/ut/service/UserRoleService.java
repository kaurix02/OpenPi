package ee.ut.service;

import ee.ut.model.UserRole;

/**
 * Created by alandu on 7.03.16.
 */
public interface UserRoleService {
    UserRole findRoleByType(String type);
}
