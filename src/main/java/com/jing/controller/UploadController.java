package com.jing.controller;

import com.jing.VO.Product;
import com.jing.service.Imp.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/uploadExcel")
public class UploadController {
@Autowired
UploadService upload;

@RequestMapping(value = "/excel.do", method = RequestMethod.POST)
public String batchimport(@RequestParam(value="filename") MultipartFile file,
                          HttpServletRequest request,HttpServletResponse response) throws IOException{

    //判断文件是否为空
    if(file==null) return null;
    //获取文件名
    String name=file.getOriginalFilename();
    //进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
    long size=file.getSize();
    if(name==null || ("").equals(name) && size==0) return null;

    //批量导入。参数：文件名，文件。
    boolean b = upload.batchImport(name,file);
    if(b){
        String Msg ="批量导入EXCEL成功！";
        request.getSession().setAttribute("msg",Msg);
    }else{
        String Msg ="批量导入EXCEL失败！";
        request.getSession().setAttribute("msg",Msg);
    }
    return "success";
}




}