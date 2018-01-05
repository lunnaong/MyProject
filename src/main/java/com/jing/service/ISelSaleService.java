package com.jing.service;

import com.jing.VO.Sale;

public interface ISelSaleService {
    Sale selSaleById(int id);
    void addSale(Sale sale);
}
