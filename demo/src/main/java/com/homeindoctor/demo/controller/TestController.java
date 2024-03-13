package com.homeindoctor.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
    
    
    @GetMapping("/test1")
    public String testPage(){
        log.info("테스트페이지");
        return "index";
    }

    @GetMapping("/hi")
    public String hiPage(){
        log.info("안녕");
        return "test";
    }
    
    
}
