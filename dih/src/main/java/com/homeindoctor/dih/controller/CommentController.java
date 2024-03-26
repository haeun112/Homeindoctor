package com.homeindoctor.dih.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.homeindoctor.dih.dto.CommentDto;
import com.homeindoctor.dih.service.CommentService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    
    //댓글 작성
    @PostMapping("/comments/add")
    public ResponseEntity<Integer> addComment(@RequestBody CommentDto commentDto, HttpSession session){
        // 로그인 여부 확인
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");
        String loggedInAdminId = (String) session.getAttribute("loggedInAdminId");

        // 댓글 작성자 설정
        if (loggedInUserId != null) {
            commentDto.setRead_id(loggedInUserId);
        } else if (loggedInAdminId != null) {
            commentDto.setRead_id(loggedInAdminId);
        } else {
            // 사용자도 관리자도 로그인하지 않은 경우, 댓글 작성 권한이 없음을 반환
            log.warn("댓글 작성 권한이 없습니다.");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
        }

        // 댓글 추가
        int addedCommentId = commentService.addComment(commentDto);
        log.info("댓글 추가 성공: 댓글 ID = {}", addedCommentId);
        return ResponseEntity.ok(addedCommentId);
    }
}
