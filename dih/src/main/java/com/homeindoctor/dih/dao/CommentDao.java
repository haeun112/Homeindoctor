package com.homeindoctor.dih.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.homeindoctor.dih.dto.CommentDto;

@Mapper
public interface CommentDao {

    int addComment(CommentDto commentDto);

    CommentDto getCommentById(int commentId);

    List<CommentDto> getCommentsByPostId(int postId, int offset, int pageSize);

    int getTotalCommentCount(int postId);
    
}
