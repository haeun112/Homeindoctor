package com.homeindoctor.dih.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerDao {

    boolean dihLogin(String user_id, String user_pwd);


}
