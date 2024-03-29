package com.homeindoctor.dih.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homeindoctor.dih.dao.GoodsDao;
import com.homeindoctor.dih.dto.GoodsDto;
import com.homeindoctor.dih.service.GoodsService;

import io.micrometer.common.util.StringUtils;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {

    private static final String UPLOAD_DIR = "static/upload";

    @Autowired
    GoodsService goodsService;

    @Autowired
    GoodsDao goodsDao;
    
    @GetMapping("/goodsUpload")
    public String goodsUploadPage(){
        log.info("상품 등록 페이지");
        return "goodsUpload";
    }

    @PostMapping("/goodsUpload")
    public String goodsSave(GoodsDto goodsDto, MultipartFile imgFile) throws Exception {
        
        goodsService.goodsSave(goodsDto, imgFile);
        log.info("등록된 상품 정보: {}", goodsDto);
        return "redirect:/smart";
    }

    @GetMapping("/goodsDetail")
    public String goodsDetailPage(Model model, @RequestParam("goods_id") int goodsId){
        log.info("상품 상세 페이지");

        GoodsDto goods = goodsService.getGoodsById(goodsId);
        model.addAttribute("goods", goods);
        log.info("상품 상세 내용: {}", goods);

        return "goodsDetail";
    }
}
