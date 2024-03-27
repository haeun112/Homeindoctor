package com.homeindoctor.dih.dto;

import lombok.Data;

@Data
public class CartDto {
    private int cart_num;
    private int goods_id;
    private String user_id;
    private int goods_count;
}
