package com.homeindoctor.dih.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AsController {
    
    @GetMapping("/as")
    public String asPage(){
        log.info("as 페이지");
        return "as";
    }
}
