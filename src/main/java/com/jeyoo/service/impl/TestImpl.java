package com.jeyoo.service.impl;

import com.jeyoo.mapper.SchoolMapper;
import com.jeyoo.pojo.School;
import com.jeyoo.service.Test;

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
