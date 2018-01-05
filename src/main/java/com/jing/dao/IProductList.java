package com.jing.dao;

import com.jing.VO.BuyList;
import com.jing.VO.profit;

import javax.annotation.Resource;
import java.util.List;

@Resource
public interface IProductList {
 public profit getProfit(int id);
 public List<BuyList> getBuyList(int id);
 public String getUnit(int id);
}
