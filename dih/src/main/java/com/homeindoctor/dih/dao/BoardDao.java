package com.homeindoctor.dih.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.homeindoctor.dih.dto.BoardDto;

@Mapper
public interface BoardDao {

    List<BoardDto> getAllBoard(@Param("offset") int offset, @Param("pageSize") int pageSize);

    List<BoardDto> searchBoard(@Param("keyword") String keyword, @Param("offset") int offset, @Param("pageSize") int pageSize);

    int getSearchResultCount(@Param("keyword") String keyword);

    List<BoardDto> getAllBoardWithPaging(int pageSize, int offset);

    int getTotalBoardCount();

    void increaseReadCount(@Param("postId") int post_id);

    void insertBoard(BoardDto boardDto);

    BoardDto getBoardById(int postId);

    void deleteBoard(int postId);

    void updateBoard(BoardDto existingPost);


    
}
