package com.homeindoctor.dih.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.homeindoctor.dih.dao.GoodsDao;
import com.homeindoctor.dih.dto.GoodsDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GoodsService {
    @Autowired
    GoodsDao goodsDao;

    public void goodsSave(GoodsDto goodsDto, MultipartFile imgFile) throws Exception {
        
        String oriImgName = imgFile.getOriginalFilename();
        String goods_imgName = "";

        //user.dir = Homeindoctor\homeindoctor 여기까지만 나오기 때문에 뒤 파일명을 정확히 적어주어야 한다.
        //해당 경로에 파일이 저장됨
        String projectPath = System.getProperty("user.dir") + "/dih/src/main/resources/static/upload";

        //해당 디렉터리가 존재하지 않을 경우 디렉터리를 새로 만든다
        File dir = new File(projectPath);
        if(!dir.exists()){
            dir.mkdirs();
        }

        //서버에 저장할 파일명을 랜덤으로 만든다
        UUID uuid = UUID.randomUUID();
        String savedFileName = uuid + "_" +oriImgName; // 파일명 = goods_imgName
        goods_imgName = savedFileName;

        Path filePath = Paths.get(projectPath, goods_imgName);

        //파일 업로드
        try {
            Files.write(filePath, imgFile.getBytes());
        }catch(IOException e){
            throw new Exception("파일 업로드 중 오류가 발생했습니다.", e);
        }

        // imgFile.transferTo(saveFile);

        goodsDto.setGoods_imgName(goods_imgName);
        goodsDto.setGoods_imgPath("/upload/" + goods_imgName);
        log.info("등록된 상품 경로: {}", goodsDto.getGoods_imgPath());

        goodsDao.goodsSave(goodsDto);


    }

    public List<GoodsDto> searchGoods(String keyword, int pageSize, int page) {
        int offset = (page - 1) * pageSize;
        return goodsDao.searchGoods(keyword, offset, pageSize);
    }

    public int getSearchCount(String keyword) {
        return goodsDao.getSearchCount(keyword);
    }

    public List<GoodsDto> getAllGoodsWithPaging(int pageSize, int offset) {
        return goodsDao.getAllGoodsWithPaging(pageSize, offset);
    }

    public int getTotalGoodsCount() {
        return goodsDao.getTotalGoodsCount();
    }

    public List<GoodsDto> getAllGoods(int page, int pageSize){
        int offset = (page - 1) * pageSize;
        return goodsDao.getAllGoods(offset, pageSize);
    }

    public GoodsDto getGoodsById(int goodsId) {
        log.info("getGoodsById: {}", goodsId);
        return goodsDao.getGoodsById(goodsId);
    }

}
