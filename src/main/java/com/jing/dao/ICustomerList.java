package com.jing.dao;

import com.jing.VO.userPro;

import javax.annotation.Resource;
import java.util.List;
@Resource
public interface ICustomerList {
    public List<userPro> getProduct(int id);
}
