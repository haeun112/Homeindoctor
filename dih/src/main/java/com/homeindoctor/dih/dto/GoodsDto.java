package com.homeindoctor.dih.dto;

import lombok.Data;

@Data
public class GoodsDto {
    private int goods_id;
    private String goods_name;
    private String goods_intro;
    private int goods_price;
    private String goods_imgName;
    private String goods_imgPath;
    private int stock;
}
