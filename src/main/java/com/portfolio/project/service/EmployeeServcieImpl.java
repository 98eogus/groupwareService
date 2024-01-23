package com.portfolio.project.service;

import com.portfolio.project.dao.EmployeeDao;
import com.portfolio.project.domain.EmployeeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServcieImpl implements EmployeeService{

    @Autowired
    EmployeeDao employeeDao;

    @Override
    public List<EmployeeDto> listEmployee() throws Exception {
        return employeeDao.listEmployee();
    }

    @Override
    public List<EmployeeDto> searchEmployee(String name) throws Exception {

        return employeeDao.searchEmployee(name);
    }
}
