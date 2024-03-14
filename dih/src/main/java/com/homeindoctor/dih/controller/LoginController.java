package com.homeindoctor.dih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
    
    @GetMapping("/login")
    public String loginPage(){
        log.info("로그인 페이지");
        return "login";
    }

    @GetMapping("/DIH")
    public String dihLoginPage(){
        log.info("닥터인홈 로그인");
        return "dihLogin";
    }
}
