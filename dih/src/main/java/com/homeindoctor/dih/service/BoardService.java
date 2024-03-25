package com.homeindoctor.dih.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeindoctor.dih.dao.BoardDao;
import com.homeindoctor.dih.dto.BoardDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardService {

    @Autowired
    private BoardDao boardDao;
    
    public List<BoardDto> getAllBoard(int page, int pageSize){
        log.info("서비스 - 목록");
        int offset = (page-1) * pageSize;
        return boardDao.getAllBoard(offset, pageSize);
    }

    public List<BoardDto> searchBoard(String keyword, int page, int pageSize){
        log.info("서비스 - 검색: {}", keyword);
        int offset = (page -1) * pageSize;
        return boardDao.searchBoard(keyword, offset, pageSize);
    }

    public int getTotalBoardCount(){
        log.info("서비스 - 총 게시글 수 조회");
        return boardDao.getTotalBoardCount();
    }

    public int getSearchResultCount(String keyword){
        log.info("서비스 - 검색 결과 수 조회: {}", keyword);
        return boardDao.getSearchResultCount(keyword);
    }

    public List<BoardDto> getAllBoardWithPaging(int pageSize, int offset){
        log.info("서비스 - 페이지별 목록 가져오기");
        return boardDao.getAllBoardWithPaging(pageSize, offset);
    }

    public void increaseReadCount(int post_id) {
        log.info("조회수 증가 : {}", post_id);
        boardDao.increaseReadCount(post_id);
    }
}
