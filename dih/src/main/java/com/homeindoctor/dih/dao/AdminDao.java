package com.homeindoctor.dih.dao;

import org.apache.ibatis.annotations.Mapper;

import com.homeindoctor.dih.dto.AdminDto;

@Mapper
public interface AdminDao {

    boolean adminLogin(String admin_id, String admin_pwd);

    boolean adminJoinForm(AdminDto adminDto);
    
}
