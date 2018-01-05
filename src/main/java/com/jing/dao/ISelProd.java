package com.jing.dao;

import com.jing.VO.Product;
import org.apache.ibatis.annotations.Param;

import javax.annotation.Resource;

@Resource
public interface ISelProd {
    Product selProd(@Param("id") Integer id);
    void addProd(Product product);
}
