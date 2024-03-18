package com.homeindoctor.dih.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeindoctor.dih.dao.CustomerDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomerService {

    @Autowired
    private CustomerDao customerDao;

    public boolean dihLogin(String user_id, String user_pwd) {
        return customerDao.dihLogin(user_id, user_pwd);
    }


}
