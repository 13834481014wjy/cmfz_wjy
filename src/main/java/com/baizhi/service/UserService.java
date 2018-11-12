package com.baizhi.service;

import com.baizhi.entity.User;

public interface UserService {
    void addUser(User user);
    String  findUserByUsernamePwd(User user);
    void modifyUser(User user);
}
