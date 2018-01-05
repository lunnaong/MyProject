package com.jing.dao;

import com.jing.VO.date;

import javax.annotation.Resource;
import java.util.List;

@Resource
public interface ITopProfit {
    List<Double> newTopProfit();
    List<Double> secondTopProfit();
    date newDate();
    date secondDate();
}
