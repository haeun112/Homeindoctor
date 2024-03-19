package com.homeindoctor.dih.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeindoctor.dih.dao.CustomerDao;
import com.homeindoctor.dih.dto.CustomerDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomerService {

    @Autowired
    private CustomerDao customerDao;

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


}
