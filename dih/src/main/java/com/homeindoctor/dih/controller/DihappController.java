package com.homeindoctor.dih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DihappController {
    
    @GetMapping("/app")
    public String Dihapp(){
        log.info("닥터인홈 앱 페이지");
        return "doctorinhome";
    }
}
