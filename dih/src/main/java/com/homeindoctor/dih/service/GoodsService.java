package com.homeindoctor.dih.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeindoctor.dih.dao.GoodsDao;
import com.homeindoctor.dih.dto.GoodsDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GoodsService {
    @Autowired
    GoodsDao goodsDao;

    public boolean goodsUploadForm(GoodsDto goodsDto) {
        return goodsDao.goodsUploadForm(goodsDto);
    }

}
