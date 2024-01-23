package com.portfolio.project.dao;

import com.portfolio.project.domain.EmployeeDto;

import java.util.List;

public interface EmployeeDao {

    List<EmployeeDto> listEmployee() throws Exception;
    List<EmployeeDto> searchEmployee(String name) throws Exception;
}
