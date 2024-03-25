package com.homeindoctor.dih.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeindoctor.dih.dao.AdminDao;
import com.homeindoctor.dih.dao.CustomerDao;
import com.homeindoctor.dih.dto.AdminDto;
import com.homeindoctor.dih.dto.CustomerDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomerService {

    @Autowired
    private CustomerDao customerDao;
    
    @Autowired
    private AdminDao adminDao;

    public boolean dihLogin(String user_id, String user_pwd) {
        return customerDao.dihLogin(user_id, user_pwd);
    }

    public boolean idcheck(String user_id) {
       return customerDao.idcheck(user_id);
    }

    public boolean dihJoinForm(CustomerDto customerDto) {
        return customerDao.dihJoinForm(customerDto);
    }

    public List<String> findIdForm(String user_email) {
        return customerDao.findIdForm(user_email);
    }

    public String findPwdForm(String user_id, String user_email) {
        return customerDao.findPwdForm(user_id, user_email);
    }

    public boolean updatePassword(String user_id, String user_pwd) {
        return customerDao.updatePassword(user_id, user_pwd);
    }

    public boolean adminLogin(String admin_id, String admin_pwd) {
        return adminDao.adminLogin(admin_id, admin_pwd);
    }

    public boolean adminJoinForm(AdminDto adminDto) {
        return adminDao.adminJoinForm(adminDto);
    }


}
