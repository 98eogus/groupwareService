package com.portfolio.project.dao;

import com.portfolio.project.domain.EmployeeDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class EmployeeDaoImpl implements  EmployeeDao{

    @Autowired
    private SqlSession session;
    private static String namespace = "com.portfolio.project.dao.employeeMapper.";


    @Override
    public List<EmployeeDto> listEmployee() throws Exception {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public List<EmployeeDto> searchEmployee(String name) throws Exception {

        return session.selectList(namespace+"search", name);
    }



}
