package com.homeindoctor.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
    
    @GetMapping("/test")
    public String testPage(){
        log.info("테스트페이지");
        return "test";
    }
    
    
}
