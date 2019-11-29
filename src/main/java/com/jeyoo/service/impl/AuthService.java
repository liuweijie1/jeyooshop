package com.jeyoo.service.impl;


import com.jeyoo.mapper.AdminEmployeeMapper;
import com.jeyoo.pojo.AdminEmployee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    @Autowired
    private AdminEmployeeMapper employeeMapper;

    public AdminEmployee  login(String username, String password) {

        AdminEmployee adminEmployee = employeeMapper.selectByUsernameAndPassword(username, password);


        return adminEmployee;

    }
}
