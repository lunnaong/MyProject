package com.jing.service.Imp;

import com.jing.VO.Sale;
import com.jing.dao.ISelSale;
import com.jing.service.ISelSaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SelSaleService implements ISelSaleService {
    @Autowired
    ISelSale sale;
    public Sale selSaleById(int id){
     return  this.sale.selSale(id);
    }

    public void addSale(Sale sal) {
        this.sale.addSale(sal);
    }
}
