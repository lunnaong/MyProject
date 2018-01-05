package com.jing.service;

import com.jing.VO.Product;

public interface ISelProdService {
    Product selProdById(int id);
    void addProduct(Product product);
}
