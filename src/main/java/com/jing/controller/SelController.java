package com.jing.controller;

import com.jing.VO.Product;
import com.jing.VO.Sale;
import com.jing.VO.User;
import com.jing.service.Imp.SelProdService;
import com.jing.service.Imp.SelSaleService;
import com.jing.service.Imp.SelUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/User")
public class SelController {
    @Autowired
    SelUserService selUser ;
    @Autowired
    SelProdService selProd;
    @Autowired
    SelSaleService selSale;



    @RequestMapping(value = "/insertUser.do")
    public @ResponseBody ModelAndView add(HttpServletRequest request) throws ParseException {
        //获取前台用户的输入
        User user = new User();
        user.setId(Integer.parseInt(request.getParameter("id")));
        user.setName(request.getParameter("name"));
        user.setAddress(request.getParameter("address"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(request.getParameter("birthday").toString());
        user.setBirthday(date);
        user.setSex(request.getParameter("sex"));
       // System.out.println(user.getName());
       boolean issuccess = selUser.addUser(user);
       System.out.println(issuccess);
        Map<String,User> map = new HashMap<String, User>();
        map.put("ur",user);
        //创建一个MV
        ModelAndView  mv= new ModelAndView("insert",map);

        mv.setViewName("insert");
        return  mv;
    }
/* @RequestMapping(value = "/selAll.do")
 public @ResponseBody ModelAndView selAll() throws IOException{
        Map<String,List> map = new HashMap<String, List>();
        List<User> list = selUser.selUser();
        map.put("user",list);
        ModelAndView mav = new ModelAndView("allUser",map);
        return mav;
 }*/
    @RequestMapping(value = "/selAll.do")
    public @ResponseBody List selAll() throws IOException{
        List<User> list = selUser.selUser();
        return list;
    }

    @RequestMapping(value = "/SelUser.do")
    public  @ResponseBody
    ModelAndView SelUser(HttpServletRequest request) throws IOException {
        // System.out.println("11111");
        int id = Integer.parseInt(request.getParameter("id"));
        User user = selUser.selUserById(id);
        List<User> list = new ArrayList<User>();
        list.add(user);
        Map<String,List> map = new HashMap<String, List>();
        map.put("user",list);
        ModelAndView mav = new ModelAndView("allUser",map);
        return mav;

    }

    @RequestMapping(value = "/updateUser.do")
    public  @ResponseBody
    ModelAndView updateUser(HttpServletRequest request) throws IOException, ParseException {
        //获取前台用户的输入
        User user = new User();
        User userP = selUser.selUserById(Integer.parseInt(request.getParameter("id")));
        user = userP;
        Map<String,User> map = new HashMap<String, User>();
        map.put("up",userP);
        if(!(request.getParameter("name") == null || request.getParameter("name") .length() == 0)){
        user.setName(request.getParameter("name"));}
        if(!(request.getParameter("address") == null || request.getParameter("address") .length() == 0)){
            user.setAddress(request.getParameter("address"));
        }
        if(!(request.getParameter("birthday") == null || request.getParameter("birthday") .length() == 0)){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = sdf.parse(request.getParameter("birthday").toString());
            user.setBirthday(date);
        }
        if(!(request.getParameter("sex") == null || request.getParameter("sex") .length() == 0)){
            user.setSex(request.getParameter("sex"));
        }
        selUser.updateUser(user);

        map.put("ur",user);
        ModelAndView mav = new ModelAndView("update",map);
        return mav;
    }
/*
    @RequestMapping(value = "/deleteUser.do")
    public String deleteUser(HttpServletRequest request) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        selUser.deleteUser(id);
        return "success";

    }*/

    @RequestMapping(value = "/SelProd.do")
    public  @ResponseBody
    ModelAndView SelProd(HttpServletRequest request) throws IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        Product prod = selProd.selProdById(id);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("prod",prod);

        ModelAndView mav = new ModelAndView("Prod",map);
        return mav;

    }

    @RequestMapping(value = "/SelSale.do")
    public  @ResponseBody
    ModelAndView SelSale(HttpServletRequest request) throws IOException{
        int id = Integer.parseInt(request.getParameter("UserId"));
        Sale sale = selSale.selSaleById(id);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("sale",sale);

        ModelAndView mav = new ModelAndView("Sale",map);
        return mav;

    }

    @RequestMapping("/test.do")
    public String dd(){
        return "hello";
    }
}
