package com.portfolio.project.controller;

import com.portfolio.project.domain.EventDto;
import com.portfolio.project.service.EmployeeService;
import com.portfolio.project.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import java.util.List;

@Controller

public class EventController {

    @Autowired
    EventService eventService;


    @GetMapping("/event")
    public String listEvent(Model m) throws Exception {

        List<EventDto> eventList = eventService.listEvent();



        int eventCount = eventList.size();
        m.addAttribute("eventList", eventList);
        m.addAttribute("eventCount", eventCount); // 총 건수를 모델에 추가
        return "event";
    }
}
