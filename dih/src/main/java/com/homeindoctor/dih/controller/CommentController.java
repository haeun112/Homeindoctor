package com.homeindoctor.dih.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

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
    public ResponseEntity<CommentDto> addComment(@RequestBody CommentDto commentDto, HttpSession session){
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

        // 현재 서버 시간을 추가
        commentDto.setServerTime(new Date()); // CommentDto에 서버 시간 설정

        // 댓글 추가
        int addedCommentId = commentService.addComment(commentDto);
        log.info("댓글 추가 성공: 댓글 ID = {}", addedCommentId);

        // 추가된 댓글 정보를 반환
        commentDto.setComment_id(addedCommentId); // 추가된 댓글의 ID 설정
        return ResponseEntity.ok(commentDto);
    }

    //댓글 로드
    @GetMapping("/comments/{commentId}")
    public ResponseEntity<CommentDto> getComment(@PathVariable int commentId){
        CommentDto comment = commentService.getCommentById(commentId);
        if(comment == null){
            log.debug("댓글을 찾을 수 없음: 댓글 ID = {}", commentId);
            return ResponseEntity.notFound().build();
        }
        log.info("댓글 조회 성공: 댓글 ID = {}", commentId);
        return ResponseEntity.ok(comment);
    }

    //댓글 페이지 로드
    @GetMapping("/comments/getByPostId/{postId}")
    public ResponseEntity<List<CommentDto>> getCommentsByPostId(@PathVariable int postId, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int pageSize ){
        List<CommentDto> comments = commentService.getCommentsByPostId(postId, page, pageSize);
        log.info("댓글 목록 조회 성공: 게시글 ID = {}, 댓글 수 = {}", postId, comments.size());
        log.info("page: {}, pageSize: {}", page, pageSize);
        return ResponseEntity.ok(comments);
    }

    //댓글 수정
    @PutMapping("/comments/{commentId}")
    public ResponseEntity<Integer> uqdateComment(@PathVariable int commentId, @RequestBody CommentDto commentDto, HttpSession session){
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");
        String loggedInAdminId = (String) session.getAttribute("loggedInAdminId");

        if (loggedInUserId != null) {
            commentDto.setComment_id(commentId);
        } else if (loggedInAdminId != null) {
            commentDto.setComment_id(commentId);
        } else {
            // 사용자도 관리자도 로그인하지 않은 경우, 댓글 작성 권한이 없음을 반환
            log.warn("댓글 수정 권한이 없습니다.");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
        }

        int updatedCount = commentService.updateComment(commentDto);

        if(updatedCount == 0){
            log.warn("댓글 수정 실패: 댓글 ID = {}", commentId);
            return ResponseEntity.notFound().build();
        }
        log.info("댓글 수정 성공: 댓글 ID = {}", commentId);
        return ResponseEntity.ok(updatedCount);
    }


    //댓글 삭제
    @DeleteMapping("/comments/{commentId}")
    public ResponseEntity<Void> deleteForm(@PathVariable int commentId, HttpSession session){
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");
        String loggedInAdminId = (String) session.getAttribute("loggedInAdminId");

        if (loggedInUserId != null || loggedInAdminId != null) {
            // 사용자 또는 관리자가 로그인한 경우
            int deletedCount = commentService.deleteComment(commentId);
            if (deletedCount == 0) {
                log.warn("댓글 삭제 실패: 댓글 ID = {}", commentId);
                return ResponseEntity.notFound().build();
            }
            log.info("댓글 삭제 성공: 댓글 ID = {}", commentId);
            return ResponseEntity.noContent().build();
        } else {
            // 사용자도 관리자도 로그인하지 않은 경우, 댓글 삭제 권한이 없음을 반환
            log.warn("댓글 삭제 권한이 없습니다.");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
        }
    }
}
