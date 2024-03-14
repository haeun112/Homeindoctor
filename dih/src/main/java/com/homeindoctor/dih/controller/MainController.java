package com.homeindoctor.dih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
    
    @GetMapping("/main")
    public String mainPage(){
        log.info("메인 페이지");
        return "main";
    }
}
