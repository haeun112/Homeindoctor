package com.homeindoctor.dih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SmartController {
    
    @GetMapping("/smart")
    public String smartPay(){
        log.info("스마트 체온계 페이지");
        return "smart";
    }

    
}
