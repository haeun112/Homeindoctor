package com.homeindoctor.dih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.annotation.ServletSecurity;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
    
    @GetMapping("/mypage")
    public String myPage(){
        return "mypage";
    }
}
