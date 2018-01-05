package com.jing.service.Imp;

import com.jing.VO.date;
import com.jing.dao.ITopProfit;
import com.jing.service.IgetTopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class GetTopService implements IgetTopService {
    @Autowired
    ITopProfit topProfit;
    public List<Double> getNewTopProfit(){
        return this.topProfit.newTopProfit();
    }
    public List<Double> getSecondProfit(){
        return this.topProfit.secondTopProfit();
    }

    public date getNewDate() {
        return this.topProfit.newDate();
    }

    public date getSecondDate() {
        return this.topProfit.secondDate();
    }
}
