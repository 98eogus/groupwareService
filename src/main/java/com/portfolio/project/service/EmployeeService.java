package com.portfolio.project.service;


import com.portfolio.project.domain.EmployeeDto;

import java.util.List;

public interface EmployeeService {

    List<EmployeeDto> listEmployee() throws Exception;

    List<EmployeeDto> searchEmployee(String name) throws Exception;



}
