package com.jing.service;

import com.jing.VO.BuyList;
import com.jing.VO.profit;

import java.util.List;

public interface IGetProduct {
    profit getProfile(int id);
    List<BuyList> getBuyList(int id);
    String getUnit(int id);
}
