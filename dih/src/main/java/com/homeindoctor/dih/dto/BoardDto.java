package com.homeindoctor.dih.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class BoardDto {
    private int post_id;
    private String admin_id;
    private String post_title;
    private String post_content;
    private int read_cnt;
    private LocalDateTime create_date;
}
