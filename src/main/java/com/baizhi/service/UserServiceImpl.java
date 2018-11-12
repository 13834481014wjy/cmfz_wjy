package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.util.SaltUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    @Override
    public void addUser(User user) {
        String salt = SaltUtils.getSalt(4);
        user.setSalt(salt);

        String password = user.getPassword();
        String hex = DigestUtils.md5Hex(salt+password);
        user.setPassword(hex);

        user.setId(UUID.randomUUID().toString());
        userDao.insert(user);
    }

    @Override
    public void modifyUser(User user) {

        String salt = SaltUtils.getSalt(4);
        user.setSalt(salt);

        String password = user.getPassword();
        String hex = DigestUtils.md5Hex(salt+password);
        user.setPassword(hex);

        userDao.update(user);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public String findUserByUsernamePwd(User user) {
        User user1 = userDao.queryByUsernameAndPwd(user);
        String salt = user1.getSalt();
        String password = DigestUtils.md5Hex(salt+user.getPassword());

        if (password.equals(user1.getPassword())){
            return "100";
        }else{
            return "101";
        }

    }
}
