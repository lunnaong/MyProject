package com.jing.service;



import com.jing.VO.date;

import java.util.Date;
import java.util.List;

public interface IgetTopService {
   List<Double> getNewTopProfit();
   List<Double> getSecondProfit();
   date  getNewDate();
   date  getSecondDate();

}
