package com.jing.service.Imp;

import com.jing.VO.userPro;
import com.jing.dao.ICustomerList;
import com.jing.service.IGetCustomer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GetCustomerService implements IGetCustomer {
    @Autowired
    ICustomerList customerList;
    public List<userPro> getCustomerList(int id){
        return this.customerList.getProduct(id);
    }
}
