package com.homeindoctor.dih.dao;

import org.apache.ibatis.annotations.Mapper;

import com.homeindoctor.dih.dto.CommentDto;

@Mapper
public interface CommentDao {

    int addComment(CommentDto commentDto);
    
}
