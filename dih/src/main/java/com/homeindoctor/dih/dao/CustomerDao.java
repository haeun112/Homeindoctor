package com.homeindoctor.dih.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.homeindoctor.dih.dto.CustomerDto;

@Mapper
public interface CustomerDao {

    boolean dihLogin(String user_id, String user_pwd);

    boolean idcheck(String user_id);

    boolean dihJoinForm(CustomerDto customerDto);

    List<String> findIdForm(String user_email);

    String findPwdForm(String user_id, String user_email);

    boolean updatePassword(String user_id, String user_pwd);


}
