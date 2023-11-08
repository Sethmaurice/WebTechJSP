package com.example.student_mis.Service;

import com.example.student_mis.dao.UserDao;

public class UserServiceImpl implements UserService{
    UserDao userDao = new UserDao();
    @Override
    public String loginUser(String email, String password) {
        return userDao.loginUser(email, password);
    }
}
