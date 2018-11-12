package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Admin findByUsernameAndPwd(Admin admin) {
        Admin queryByUsernameAndPwd = adminDao.queryByUsernameAndPwd(admin);
        if(queryByUsernameAndPwd!=null){
            return queryByUsernameAndPwd;
        }else{
            return null;
        }

    }


    @Override
    public void motify(Admin admin) {
        adminDao.update(admin);
    }

}
