package com.homeindoctor.dih.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.homeindoctor.dih.dao.GoodsDao;
import com.homeindoctor.dih.dto.GoodsDto;
import com.homeindoctor.dih.service.GoodsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SmartController {

    @Autowired
    private GoodsService goodsService;
    
    @GetMapping("/smart")
    public String smartPay(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "pageSize", defaultValue = "5") int pageSize, @RequestParam(value = "keyword", required = false) String keyword, Model model){
        log.info("controller.smartPay()");

        int offset = (page - 1) * pageSize;

        List<GoodsDto> goodsDtoList;
        int totalGoodsCount;

        if(keyword != null && !keyword.isEmpty()){
            goodsDtoList = goodsService.searchGoods(keyword, pageSize, offset);
            totalGoodsCount = goodsService.getSearchCount(keyword);
        }else{
            goodsDtoList = goodsService.getAllGoodsWithPaging(pageSize, offset);
            totalGoodsCount = goodsService.getTotalGoodsCount();
        }

        model.addAttribute(("goodsDtoList"), goodsDtoList);
        log.info("goodsList: {}", goodsDtoList);

        int totalPages = (int) Math.ceil((double) totalGoodsCount / pageSize);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("keyword", keyword);
        log.info("totalPages: {}", totalPages);
        log.info("currentPage: {}", page);
        log.info("pageSize: {}", pageSize);
        log.info("keyword: {}", keyword);
        log.info("상품 리스트");

        return "smart";
    }

    
}
