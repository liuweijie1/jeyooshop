package com.house730.admin.service.impl;


import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.mapper.AdminEmployeeMapper;
import com.house730.admin.pojo.AdminEmployee;
import com.house730.admin.pojo.User;
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
