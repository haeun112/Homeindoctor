package com.homeindoctor.dih.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homeindoctor.dih.dto.GoodsDto;
import com.homeindoctor.dih.service.GoodsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {

    @Autowired
    GoodsService goodsService;
    
    @GetMapping("/goodsUpload")
    public String goodsUploadPage(){
        log.info("상품 등록 페이지");
        return "goodsUpload";
    }

    @PostMapping("/goodsUpload")
    public String goodsUploadForm(GoodsDto goodsDto, Model model, RedirectAttributes rttr){
        model.addAttribute("god", goodsDto);

        log.info("상품 등록 처리");
        log.info("goodsDto: {}", goodsDto);

        boolean result = goodsService.goodsUploadForm(goodsDto);
        if(result){
            model.addAttribute("msg", "등록성공");
            rttr.addFlashAttribute("msg", "등록성공");
            return "smart";
        }else{
            model.addAttribute("msg", "등록실패");
            return "smart";
        }
    }
}
