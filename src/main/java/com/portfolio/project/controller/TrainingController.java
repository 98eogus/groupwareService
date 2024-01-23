package com.portfolio.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TrainingController {

    @GetMapping("/training")
    public String showTraining() {

        return"training";
    }
}
