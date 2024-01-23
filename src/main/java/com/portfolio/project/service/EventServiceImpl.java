package com.portfolio.project.service;

import com.portfolio.project.dao.EventDao;
import com.portfolio.project.domain.EventDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventServiceImpl implements EventService {

    @Autowired
    EventDao eventDao;
    @Override
    public List<EventDto> listEvent() throws Exception {
        return eventDao.listEvent();
    }
}
