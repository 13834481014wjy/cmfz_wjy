package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService{
    Admin findByUsernameAndPwd(Admin admin);
    void motify(Admin admin);
}
