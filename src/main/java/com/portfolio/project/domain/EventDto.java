package com.portfolio.project.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

public class EventDto {

    private Long id;
    private String title;
    private LocalDate event_date;



    private String content;



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LocalDate getEvent_date() {
        return event_date;
    }

    public void setEvent_date(LocalDate event_date) {
        this.event_date = event_date;
    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


}
