package com.house730.admin.service.impl;

import com.house730.admin.mapper.SchoolMapper;
import com.house730.admin.pojo.School;
import com.house730.admin.service.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TestImpl implements Test {
    @Autowired
    private SchoolMapper schoolMapper;
    @Override
    public School method() {
        School school = new School();
        int insert = schoolMapper.insert(school);
        System.out.println("**************************************************"+insert);
        return school;
    }
}
