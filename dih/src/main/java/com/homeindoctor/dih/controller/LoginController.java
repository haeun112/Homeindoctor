package com.homeindoctor.dih.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homeindoctor.dih.dto.CustomerDto;
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
    
    //로그인
    @GetMapping("/login")
    public String loginPage(){
        log.info("로그인 페이지");
        return "login";
    }

    //닥터인홈 로그인
    @GetMapping("/DIH")
    public String dihLoginPage(){
        log.info("닥터인홈 로그인");
        return "dihLogin";
    }

    //닥터인홈 로그인 성공
    @PostMapping("/DIH")
    public String dihLogin(@RequestParam String user_id, @RequestParam String user_pwd, HttpSession session){
        log.info("닥터인홈 로그인 처리");
        log.info("id:{}, pwd:{}", user_id,user_pwd);

        boolean result = customerService.dihLogin(user_id, user_pwd);
        if(result){
            log.info("닥터인홈 로그인 성공");
            session.setAttribute("loggedInUserId", user_id);
            session.setAttribute("user_pwd", user_pwd);
            return "main";
        }else{
            log.info("로그인 실패");
            return "dihLogin";
        }
    }

    //로그아웃 성공
    @PostMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate(); //세션 무효화
        log.info("로그아웃 성공");
        return "main";
    }

    //회원가입시 중복 아이디 확인
    @GetMapping("/check/id")
    public ResponseEntity<String> checkId(@RequestParam("user_id") String user_id){
        boolean idCheck = customerService.idcheck(user_id);

        if(idCheck){
            return ResponseEntity.ok("exists");
        }else{
            return ResponseEntity.ok("available");
        }
    }

    //아이디 찾기
    @GetMapping("/find/id")
    public String findId(){
        log.info("아이디 찾기 페이지");
        return "findId";
    }

    //아이디 찾기 : 입력된 이메일 서버로 전송
    @PostMapping("/find/id")
    public String findIdForm(@RequestParam String user_email, Model model){
        List<String> foundId = customerService.findIdForm(user_email);

        if (foundId == null || foundId.isEmpty()) {
            model.addAttribute("notFound", true); // 아이디를 찾지 못한 경우
        } else {
            model.addAttribute("foundId", foundId);
            model.addAttribute("notFound", false); // 아이디를 찾은 경우
        }
        return "findIdResult";
    }

    //비밀번호 찾기
    @GetMapping("/find/pwd")
    public String findPwd(){
        log.info("비밀번호 찾기 페이지");
        return "findPwd";
    }

    //비밀번호 찾기 : 입력된 아이디와 이메일 서버로 전송
    @PostMapping("/find/pwd")
    public String findPwdForm(@RequestParam String user_id, @RequestParam String user_email, Model model, HttpSession session){
        String foundPwd = customerService.findPwdForm(user_id, user_email);
        log.info("입력된 아이디: {}", user_id);
        log.info("반환된 비밀번호: {}", foundPwd);

        if(foundPwd == null || foundPwd.isEmpty()){
            model.addAttribute("notFound", true);
        }else{
            model.addAttribute("notFound", false);
            model.addAttribute("foundPwd", foundPwd);
        }

        //세션에 user_id 저장
        session.setAttribute("userId", user_id);

        return "findPwdResult";
    }   

    //비밀번호 찾기 : 비밀번호 재설정
    @PostMapping("/update/password")
    public String updatePassword(HttpSession session, @RequestParam("user_pwd") String user_pwd, RedirectAttributes redirectAttributes){
        //세션에서 user_id 가져오기
        String user_id = (String) session.getAttribute("userId");
        log.info("가져온 아이디: {}",user_id);

        if(user_id == null){
            return "redirect: /login";
        }
        
        // 비밀번호를 새로운 값으로 업데이트하고 결과를 반환하는 서비스 메서드를 호출합니다.
        boolean passwordUpdateSuccessful = customerService.updatePassword(user_id, user_pwd);

        if(passwordUpdateSuccessful){
            log.info("비밀번호 재설정 성공");
            log.info("변경된 비밀번호: {}", user_pwd);
            redirectAttributes.addAttribute("passwordUpdateSuccess", true);
        }else{
            redirectAttributes.addAttribute("passwordUpdateFailed", true);
        }
        return "redirect:/login";
    }

    //닥터인홈 회원가입
    @GetMapping("/dihJoin")
    public String dihJoin(){
        log.info("닥터인홈 회원가입 화면");
        return "dihJoin";
    }

    //닥터인홈 회원가입 db로 정보 저장 성공
    @PostMapping("/dihJoin")
    public String dihJoinForm(CustomerDto customerDto, Model model, RedirectAttributes rttr){
        model.addAttribute("cust", customerDto);
        log.info("닥터인홈 회원가입 처리");
        log.info("customerDto:{}", customerDto);
        boolean result = customerService.dihJoinForm(customerDto);
        if(result){
            model.addAttribute("msg", "가입성공");
            rttr.addFlashAttribute("msg", "가입성공");
            return "main";
        }else{
            model.addAttribute("msg", "가입실패");
            return "dihJoin";
        }
    }



}
