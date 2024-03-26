package com.homeindoctor.dih.service;

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
}
