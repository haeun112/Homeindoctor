package com.homeindoctor.dih.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.homeindoctor.dih.dto.GoodsDto;

@Mapper
public interface GoodsDao {

    void goodsSave(GoodsDto goodsDto);

    List<GoodsDto> searchGoods(@Param("keyword") String keyword, @Param("offset") int offset, @Param("pageSize") int pageSize);

    int getSearchCount(@Param("keyword") String keyword);

    List<GoodsDto> getAllGoodsWithPaging(int pageSize, int offset);

    int getTotalGoodsCount();

    List<GoodsDto> getAllGoods(int offset, int pageSize);

    
}
