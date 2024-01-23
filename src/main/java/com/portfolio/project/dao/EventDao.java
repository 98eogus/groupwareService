package com.portfolio.project.dao;

import com.portfolio.project.domain.EventDto;

import java.util.List;

public interface EventDao {

    List<EventDto> listEvent () throws Exception;;
}
