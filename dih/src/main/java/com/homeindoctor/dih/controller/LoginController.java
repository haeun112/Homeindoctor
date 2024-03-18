package com.homeindoctor.dih.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.homeindoctor.dih.service.CustomerService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class LoginController {

    @Autowired
    private final CustomerService customerService;
    
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

    @PostMapping("/DIH")
    public String dihLogin(@RequestParam String user_id, @RequestParam String user_pwd, HttpSession session){
        log.info("닥터인홈 로그인 처리");
        log.info("id:{}, pwd:{}", user_id,user_pwd);

        boolean result = customerService.dihLogin(user_id, user_pwd);
        if(result){
            log.info("닥터인홈 로그인 성공");
            session.setAttribute("loggedInUserId", user_id);
            session.setAttribute("user_pwd", user_pwd);
            return "mypage";
        }else{
            log.info("로그인 실패");
            return "dihLogin";
        }
    }

    @PostMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate(); //세션 무효화
        log.info("로그아웃 성공");
        return "main";
    }
}
