package com.homeindoctor.dih.dto;

import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;

@Data
public class CommentDto {
    private int comment_id;
    private int post_id;
    private String read_id;
    private String comment_content;
    private LocalDateTime create_date;
    private Date serverTime;
}
