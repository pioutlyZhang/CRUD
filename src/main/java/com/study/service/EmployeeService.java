package com.study.service;

import com.study.dao.EmployeeMapper;
import com.study.pojo.Employee;
import com.study.pojo.EmployeeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAll() {
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        return employees;
    }

    public void addEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }


    public boolean checkEmail(String email) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmailEqualTo(email);
        long count = employeeMapper.countByExample(employeeExample);
        return count==0;
    }
    public boolean checkUpdateEmail(String email,Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmailEqualTo(email);
        long count = employeeMapper.countByExample(employeeExample);
        return count==0||employee.getEmail().equals(email);
    }


    public Employee getEmp(Integer empId) {
        Employee employee = employeeMapper.selectByPrimaryKeyWithDept(empId);
        return employee;
    }

    public void updateEmpById(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmpById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteEmp(List<Integer> id) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(id);
        employeeMapper.deleteByExample(example);
    }
}
