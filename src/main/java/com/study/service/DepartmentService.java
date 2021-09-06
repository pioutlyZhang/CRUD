package com.study.service;

import com.study.dao.DepartmentMapper;
import com.study.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;


    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }
}
