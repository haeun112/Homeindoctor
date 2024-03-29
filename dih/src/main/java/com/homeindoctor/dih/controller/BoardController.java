package com.homeindoctor.dih.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.homeindoctor.dih.dao.BoardDao;
import com.homeindoctor.dih.dto.BoardDto;
import com.homeindoctor.dih.dto.CommentDto;
import com.homeindoctor.dih.service.BoardService;
import com.homeindoctor.dih.service.CommentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Slf4j
@Controller
public class BoardController {

    // private final BoardService boardService;

    // public BoardController(BoardService boardService){
    //     this.boardService = boardService;
    // }

    @Autowired
    private BoardService boardService;

    @Autowired
    private CommentService commentService;

    @GetMapping("/contents")
    public String contentPage(Model model, HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "pageSize", defaultValue = "7") int pageSize, @RequestParam(value = "keyword", required = false) String keyword){
        // 세션에서 관리자 ID를 가져옵니다.
        String loggedInAdminId = (String) session.getAttribute("loggedInAdminId");
        
        // 로그인한 사용자가 관리자인지 확인합니다.
        boolean isAdmin = loggedInAdminId != null;
        model.addAttribute("isAdmin", isAdmin);

        int offset = (page - 1) * pageSize;

        //게시글 리스트와 총 게시글 수 가져오기
        List<BoardDto> boardDtoList;
        int totalBoardCount;

        if (keyword != null && !keyword.isEmpty()){
            //키워드가 제공된 경우 검색을 수행하도록 수정
            boardDtoList = boardService.searchBoard(keyword, pageSize, offset);
            totalBoardCount = boardService.getSearchResultCount(keyword);
        }else {
            //키워드가 제공되지 않은 경우 모든 글을 가져오도록 유지
            boardDtoList = boardService.getAllBoardWithPaging(pageSize, offset);
            totalBoardCount = boardService.getTotalBoardCount();
        }

        //조회수 증가
        for (BoardDto boardDto : boardDtoList){
            boardService.increaseReadCount(boardDto.getPost_id());
        }

        model.addAttribute("boardDtoList", boardDtoList);
        log.info("boardDtoList: {}", boardDtoList);

        //페이징 계산
        int totalPages = (int) Math.ceil((double) totalBoardCount / pageSize);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("keyword", keyword);
        log.info("totalPages: {}", totalPages);
        log.info("currentPage: {}", page);
        log.info("pageSize: {}", pageSize);
        log.info("keyword: {}", keyword);
        log.info("게시판 리스트");
        
        return "board";
    }

    //게시글 작성
    @GetMapping("/contents/write")
    public String writePage() {
        log.info("글쓰기 창");
        return "boardWrite";
    }

    @PostMapping("/contents/write")
    public String writeForm(HttpServletRequest request, @RequestParam("post_title") String title, @RequestParam("post_content") String content) {
       log.info("write");

       HttpSession session = request.getSession();
       String userId = (String) session.getAttribute("loggedInAdminId");
       log.info("userId: {}", userId);

       BoardDto boardDto = new BoardDto();
       boardDto.setAdmin_id(userId);
       boardDto.setPost_title(title);
       boardDto.setPost_content(content);

       boardService.insertBoard(boardDto);

       return "redirect:/contents";
    }

    @GetMapping("/contents/detail")
    public String detailPage(Model model, @RequestParam("post_id") int postId, HttpSession session){
        BoardDto board = boardService.getBoardById(postId);
        model.addAttribute("board", board);

        log.info("본문 내용: {}", board);
  
        return "boardDetail";
    }

    @PostMapping("/contents/delete")
    public String delete(@RequestParam("post_id") int postId, HttpServletRequest request){
        log.info("게시글 삭제");

        //게시글 정보 가져오기
        BoardDto existingBoard = boardService.getBoardById(postId);
        //현재 로그인한 사용자 정보를 세션에서 가져오기
        HttpSession session = request.getSession();
        String adminId = (String) session.getAttribute("loggedInAdminId");

        //로그인한 사용자와 글 작성자가 동일한지 확인하기
        if(adminId == null || !adminId.equals(existingBoard.getAdmin_id())){
            return "redirect:/contents/delet";
        }

        boardService.deleteBoard(postId);

        return "redirect:/contents";
    }

    @GetMapping("/contents/edit")
    public String editPage(Model model, @RequestParam("post_id") int postId, HttpServletRequest request){
        //수정할 글 정보가져오기
        BoardDto board = boardService.getBoardById(postId);

        //현재 로그인한 사용자 정보 가져오기
        HttpSession session = request.getSession();
        String adminId = (String) session.getAttribute("loggedInAdminId");

        model.addAttribute("board", board);

        return "boardEdit";
    
    }

    @PostMapping("/contents/update")
    public String updateForm(@RequestParam("post_id") int postId, @RequestParam("post_title") String title, @RequestParam("post_content") String content, HttpServletRequest request){
        log.info("게시글 수정");

        BoardDto existingPost = boardService.getBoardById((postId));

        HttpSession session = request.getSession();
        
        existingPost.setPost_title(title);
        existingPost.setPost_content(content);
        
        boardService.updateBoard(existingPost);

        return "redirect:/contents";
    }
    
        
}
