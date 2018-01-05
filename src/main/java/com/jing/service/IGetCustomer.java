package com.jing.service;

import com.jing.VO.userPro;

import java.util.List;

public interface IGetCustomer {
    List<userPro> getCustomerList(int id);
}
