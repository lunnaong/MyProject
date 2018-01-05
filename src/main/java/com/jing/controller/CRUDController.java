package com.jing.controller;


import com.jing.VO.User;
import com.jing.service.Imp.SelProdService;
import com.jing.service.Imp.SelSaleService;
import com.jing.service.Imp.SelUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/User2")
public class CRUDController {
    @Autowired
    SelUserService selUser ;
    @Autowired
    SelProdService selProd;
    @Autowired
    SelSaleService selSale;


    /* 新增一条用户数据*/
    @RequestMapping(value = "/insertUser.do")
    public @ResponseBody
    Boolean add(HttpServletRequest request) throws ParseException {
        //获取前台用户的输入
        User user = new User();
        Boolean issuccess = false;

        try {
            int inputId = Integer.parseInt(request.getParameter("id").trim());
            user.setId(inputId);
            user.setName(request.getParameter("name"));
            user.setAddress(request.getParameter("address"));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = sdf.parse(request.getParameter("birthday"));
            if (!(date == null)) {
                user.setBirthday(date);
            }
            String sex = request.getParameter("sex");
            if (!sex.isEmpty()) {
                user.setSex(request.getParameter("sex"));
            }
            issuccess = selUser.addUser(user);
        }catch (Exception e ){
            System.out.println("插入出错"+e);
        }

        return  issuccess;
    }
    /*查询所有用户信息*/
    @RequestMapping(value = "/selAll.do")
    public @ResponseBody
    Map<String,Object> selAll() throws IOException {
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            List<User> list = selUser.selUser();
            int size = list.size();
            map.put("list",list);
            map.put("size",size);
        }catch(Exception e){
            System.out.println("查询出错" +e);
        }
        return map;
    }
    /*查询某个用户信息*/
    @RequestMapping(value = "/SelUser.do")
    public  @ResponseBody
    Map<String,Object> SelUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id1 = 0;
        Map<String,Object> map = new HashMap<String,Object>();
        try {
                id1 = Integer.parseInt(request.getParameter("id"));
                List<User> list = new ArrayList<User>();
                User user = selUser.selUserById(id1);
                if (!(user == null)) {
                    list.add(user);
                }
                int size = list.size();
                map.put("size", size);
                map.put("list", list);

        }catch(Exception excpetion){
          System.out.println("sql语句出错"+ excpetion);
        }
       // map.put("isSuccess",isSuccess);
        return map;

    }
    /*根据筛选框条件查询用户信息*/
    @RequestMapping(value = "/conditionalSel")
    public @ResponseBody Map<String,Object> conditionalSel(HttpServletRequest request) throws IOException, ParseException {
        User user= new User();
        List<User> list = new ArrayList<User>() ;
        Map<String,Object> map = new HashMap<String,Object>();
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(!id.isEmpty()) {
            user.setId(Integer.parseInt(id.trim()));
        }

        if(!name.isEmpty()) {
            user.setName(name);
        }
        if(!birthday.isEmpty()) {
            Date date = sdf.parse(birthday);
            user.setBirthday(date);
        }
        try {
            list = selUser.conditionSel(user);
            map.put("user", list);

        }catch(Exception e){
            System.out.println("test : " + e);
        }

        return map;

    }
    /*更新用户信息*/
    @RequestMapping(value = "/updateUser.do")
    public  @ResponseBody
    Boolean updateUser(HttpServletRequest request) throws IOException, ParseException {
       User user1 = new User();
       Boolean isSuccess = false;
       try {
           user1.setId(Integer.parseInt(request.getParameter("id")));
           user1.setName(request.getParameter("name"));
           user1.setAddress(request.getParameter("address"));
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
           Date date = sdf.parse(request.getParameter("birthday"));
           if (!(date == null)) {
               user1.setBirthday(date);
           }
           String sex = request.getParameter("sex");
           if (!sex.isEmpty()) {
               user1.setSex(request.getParameter("sex"));
           }
           isSuccess = selUser.updateUser(user1);
       }catch (Exception e){
           System.out.println("更新出错" + e);
       }

        return isSuccess;
    }

    /*删除用户信息*/
    @RequestMapping(value = "/deleteUser.do")
    public @ResponseBody Map<String,Object> deleteUser(@RequestParam(value = "id[]") String[] ids) throws IOException {
        int len = ids.length;
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("len",len);
        Boolean isSuccess = false;
        try{
        for(int i=0;i<len ;i++) {
            int id = Integer.parseInt(ids[i]);
            isSuccess = selUser.deleteUser(id);
         }
        }catch(Exception e){
            System.out.println("删除出错" + e);
        }
        map.put("isSuccess",isSuccess);
        return map ;

    }

}

