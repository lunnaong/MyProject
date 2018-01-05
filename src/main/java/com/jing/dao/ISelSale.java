package com.jing.dao;

import com.jing.VO.Sale;
import org.apache.ibatis.annotations.Param;

import javax.annotation.Resource;

@Resource
public interface ISelSale {
    Sale selSale(@Param("id") Integer id);
    void addSale(Sale sale);
}
