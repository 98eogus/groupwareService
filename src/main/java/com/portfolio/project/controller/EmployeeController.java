package com.portfolio.project.controller;

import com.portfolio.project.domain.EmployeeDto;
import com.portfolio.project.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @GetMapping("/show")

    public String show() throws Exception {

        return "employee";
    }

    @GetMapping("/list")
    @ResponseBody
    public List<EmployeeDto> listEmployee() throws Exception {

        return employeeService.listEmployee();
    }




    @GetMapping("/search")
    @ResponseBody
    public List<EmployeeDto> searchEmployee(String name) throws Exception {

        return employeeService.searchEmployee(name);
    }

}
