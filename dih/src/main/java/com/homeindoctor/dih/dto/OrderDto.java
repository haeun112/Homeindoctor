package com.homeindoctor.dih.dto;

import lombok.Data;

@Data
public class OrderDto {
    private int order_id;
    private String zipcode;
    private String address;
    private String address_detail;
    private String reciver_name;
    private String reciver_phone;
}
