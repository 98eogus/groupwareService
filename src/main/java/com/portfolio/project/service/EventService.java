package com.portfolio.project.service;

import com.portfolio.project.domain.EmployeeDto;
import com.portfolio.project.domain.EventDto;

import java.util.List;

public interface EventService {

    List<EventDto> listEvent() throws Exception;
}
