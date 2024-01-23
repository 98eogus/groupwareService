package com.portfolio.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @GetMapping("/overview")
    public ModelAndView showOverview() {
        ModelAndView modelAndView = new ModelAndView("overview"); // "overview"는 해당 JSP 파일의 이름
        // 여기에 필요한 데이터를 추가할 수 있음
        return modelAndView;
    }


}