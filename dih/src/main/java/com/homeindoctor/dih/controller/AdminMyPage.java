package com.homeindoctor.dih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminMyPage {
    
    @GetMapping("adminMyPage")
    public String aMyPage(){
        log.info("관리자 페이지");
        return "adminMyPage";
    }
}
