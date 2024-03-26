package com.homeindoctor.dih.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeindoctor.dih.dao.CommentDao;
import com.homeindoctor.dih.dto.CommentDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentService {
    @Autowired
    private CommentDao commentDao;

    public int addComment(CommentDto commentDto){
        return commentDao.addComment(commentDto);
    }

    public CommentDto getCommentById(int commentId) {
        return commentDao.getCommentById(commentId);
    }

    public List<CommentDto> getCommentsByPostId(int postId, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return commentDao.getCommentsByPostId(postId, offset, pageSize);
    }

    public int getTotalCommentCount(int postId){
        return commentDao.getTotalCommentCount(postId);
    }
}
