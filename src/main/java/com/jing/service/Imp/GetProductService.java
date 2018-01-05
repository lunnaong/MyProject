package com.jing.service.Imp;

import com.jing.VO.BuyList;
import com.jing.VO.profit;
import com.jing.dao.IProductList;
import com.jing.service.IGetProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GetProductService implements IGetProduct {
    @Autowired
    IProductList productList;
    public List<BuyList> getBuyList(int id) {
        return this.productList.getBuyList(id);
    }

    public profit getProfile(int id) {
        return this.productList.getProfit(id);
    }

    public String getUnit(int id) {
        return this.productList.getUnit(id);
    }
}
