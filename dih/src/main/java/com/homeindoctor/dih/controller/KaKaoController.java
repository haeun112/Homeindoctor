// package com.homeindoctor.dih.controller;

// import org.springframework.context.annotation.Description;
// import org.springframework.stereotype.Controller;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RequestParam;
// import org.springframework.web.bind.annotation.ResponseBody;

// import com.homeindoctor.dih.service.CustomerService;

// import lombok.RequiredArgsConstructor;
// import lombok.extern.slf4j.Slf4j;

// @Controller
// @RequiredArgsConstructor
// @Slf4j
// public class KaKaoController {
//     private final KaKaoTokenJsonData KaKaoTokenJsonData;
//     private final KaKaoUserInfo KaKaoUserInfo;

//     private final CustomerService customerService;

//     @Description
//     @GetMapping("login/KaKao")
//     @ResponseBody
//     public String kakaoLogin(@RequestParam("code") String code){
//         log.info("인가 코드를 이용하여 토큰을 받습니다.");
//         KaKaoTokenResponse KaKaoTokenResponse = KaKaoTokenJsonData.getToken(code);
//         log.info("토큰에 대한 정보입니다. {}", kakaoTokenResponse);
//         KaKaoUserInfoResponse userInfo = kakaoUserInfo.getUserInfo(kakaoTokenResponse.getAccess_token());
//         log.info("회원 정보입니다. {}", userInfo);

//         customerService.createUser(userInfo.getKaKao_account().getEmail());

//         return "main";
//     }
// }
