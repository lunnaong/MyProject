package com.jing.controller;


import com.jing.VO.BuyList;
import com.jing.VO.date;
import com.jing.VO.profit;
import com.jing.VO.userPro;
import com.jing.service.Imp.GetCustomerService;
import com.jing.service.Imp.GetProductService;
import com.jing.service.Imp.GetTopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.DateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/get")
public class GetController {
    @Autowired
    GetCustomerService customerService;
    @Autowired
    GetProductService productService;
    @Autowired
    GetTopService getTopService;

    @RequestMapping(value = "/getCustomerList")
    public @ResponseBody ModelAndView getCustomerList(HttpServletRequest request) throws IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        List<userPro> list = new ArrayList<userPro>();
        list = customerService.getCustomerList(id);

        HashMap<String, List<userPro>> map = new HashMap<String, List<userPro>>();
        map.put("userP",list);
        ModelAndView mav = new ModelAndView("customerList",map);
        if(list.isEmpty()){
           mav = new ModelAndView("fail",map);
        }
        return mav;
    }
    @RequestMapping(value = "/getProductList")
    public  @ResponseBody ModelAndView getProductList(HttpServletRequest request) throws IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        profit pro = productService.getProfile(id);
        List<BuyList> list = productService.getBuyList(id);
        String unit = productService.getUnit(id);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("profit",pro);
        map.put("list",list);
        map.put("unit",unit);
//        System.out.println(pro.getCustomerNum());
        ModelAndView mav = new ModelAndView("productList", map);
        if(pro.equals(null) || list.isEmpty()){
            mav = new ModelAndView("fail",map);
        }
        return mav;


    }

    @RequestMapping(value = "/getTopProfit")
    public @ResponseBody ModelAndView getTopProfit() throws IOException{
       List<Double> newList = getTopService.getNewTopProfit();
       List<Double> secondList = getTopService.getSecondProfit();
        date newDate = getTopService.getNewDate();
        date secondDate = getTopService.getSecondDate();
       Map<String,Object> map = new HashMap<String, Object>();
       map.put("first",newList);
       map.put("second",secondList);
       map.put("date1",newDate);
       map.put("date2",secondDate);
      // System.out.println(newDate.getMonth());

       ModelAndView mav = new ModelAndView("highchat",map);
       return mav;
    }
}
