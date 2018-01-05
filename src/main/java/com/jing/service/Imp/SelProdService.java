package com.jing.service.Imp;

import com.jing.VO.Product;
import com.jing.dao.ISelProd;
import com.jing.service.ISelProdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SelProdService implements ISelProdService {
    @Autowired
    ISelProd prod;

    public Product selProdById(int id) {
        return this.prod.selProd(id);
    }

    public void addProduct(Product product) {
        this.prod.addProd(product);
    }
}
