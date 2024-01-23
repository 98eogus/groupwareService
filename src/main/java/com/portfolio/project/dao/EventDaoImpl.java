package com.portfolio.project.dao;

import com.portfolio.project.domain.EventDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EventDaoImpl implements EventDao{

    @Autowired
    private SqlSession session;
    private static String namespace = "com.portfolio.project.dao.eventMapper.";


    @Override
    public List<EventDto> listEvent() throws Exception {

        return session.selectList(namespace+"selectAll");

    }
}
