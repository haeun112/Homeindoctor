package com.homeindoctor.dih.dao;

import org.apache.ibatis.annotations.Mapper;

import com.homeindoctor.dih.dto.GoodsDto;

@Mapper
public interface GoodsDao {

    boolean goodsUploadForm(GoodsDto goodsDto);
    
}
