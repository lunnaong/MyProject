package com.jing.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import com.jing.VO.Product;
import com.jing.VO.Sale;
import com.jing.VO.User;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ReadExcel {
    //总行数
    private int totalRows = 0;
    //总条数
    private int totalCells = 0;
    //
    private int TotalRows() {return totalRows;}

    private int TotalCells() {return totalCells;}
    //错误信息接收器
    private String errorMsg;

    //构造方法
    public ReadExcel(){}


    /**
     * 验证EXCEL文件
     * @param filePath
     * @return
     */
    public boolean validateExcel(String filePath){
        if (filePath == null || !(WDWUtil.isExcel2003(filePath) || WDWUtil.isExcel2007(filePath))){
            errorMsg = "文件名不是excel格式";
            return false;
        }
        return true;
    }

    /**
     * 读EXCEL文件，获取用户信息集合
     * @return
     */
    public Map<String,List> getExcelInfo(String fileName, MultipartFile Mfile){

        //把spring文件上传的MultipartFile转换成CommonsMultipartFile类型
        CommonsMultipartFile cf= (CommonsMultipartFile)Mfile; //获取本地存储路径
        File file = new  File("D:\\fileupload");
        //创建一个目录 （它的路径名由当前 File 对象指定，包括任一必须的父路径。）
        if (!file.exists()) file.mkdirs();
        //新建一个文件
        File file1 = new File("D:\\fileupload" + new Date().getTime() + ".xlsx");
        //将上传的文件写入新建的文件中
        try {
            cf.getFileItem().write(file1);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //初始化用户信息的集合
        List<User> userList=new ArrayList<User>();
        //初始化销售信息集合
        List<Sale> saleList = new ArrayList<Sale>();
        //初始化产品信息集合
        List<Product> productList = new ArrayList<Product>();

        Map<String,List> map = new HashMap<String, List>();
        //初始化输入流
        InputStream is = null;
        try{
            //验证文件名是否合格
            if(!validateExcel(fileName)){
                return null;
            }
            //根据文件名判断文件是2003版本还是2007版本
            boolean isExcel2007 = true;
            if(WDWUtil.isExcel2003(fileName)){
                isExcel2007 = false;
            }
            //根据新建的文件实例化输入流
            is = new FileInputStream(file1);
            //根据excel里面的内容读取客户信息
            map = getExcelInfo(is, isExcel2007);
            is.close();
        }catch(Exception e){
            e.printStackTrace();
        } finally{
            if(is !=null)
            {
                try{
                    is.close();
                }catch(IOException e){
                    is = null;
                    e.printStackTrace();
                }
            }
        }
        return map;
    }

    /**
     * 根据excel里面的内容读取用户信息
     * @param is 输入流
     * @param isExcel2007 excel是2003还是2007版本
     * @return
     * @throws IOException
     */

    public Map<String,List> getExcelInfo(InputStream is, boolean isExcel2007){

        List<User> userList = null;
        List<Sale> saleList = null;
        List<Product> productList = null;
        Map<String,List> map = new HashMap<String, List>();
        try{
            /** 根据版本选择创建Workbook的方式 */
            Workbook wb = null;
            //当excel是2007时
            if(isExcel2007){
                wb = new XSSFWorkbook(is);

            }
            else{//当excel是2003时
                wb = new HSSFWorkbook(is);
            }
            //读取Excel里面用户的信息
            userList=readUserValue(wb);
            saleList = readSaleValue(wb);
            productList = readProductValue(wb);
            map.put("user",userList);
            map.put("sale",saleList);
            map.put("product",productList);
        }
        catch (IOException e)  {
            e.printStackTrace();
        }
        return map;
    }




    /**
     * 读取Excel里面用户的信息
     * @param wb
     * @return
     */
    public List<User> readUserValue(Workbook wb){

        //得到第一个shell
        Sheet sheet=wb.getSheetAt(0);
        String sheetName = sheet.getSheetName();

        //得到Excel的行数
        this.totalRows=sheet.getPhysicalNumberOfRows();

        //得到Excel的列数(前提是有行数)
        if(totalRows>=1 && sheet.getRow(0) != null){
            this.totalCells=sheet.getRow(0).getPhysicalNumberOfCells();
        }

        List<User> userList=new ArrayList<User>();
        User user;
        //循环Excel行数,从第二行开始。标题不入库
        for(int r=1;r<this.totalRows;r++){
            Row row = sheet.getRow(r);
            if (row == null) continue;
            user = new User();

            //循环Excel的列
            for(int c = 0; c < this.totalCells; c++){
                Cell cell = row.getCell(c);
                if (null != cell){
                    if(c==0){
                        user.setId((int)cell.getNumericCellValue());//用户id
                    }else if(c==1){
                        user.setName(cell.getStringCellValue());//用户名称
                    }else if(c==2){
                        user.setAddress(cell.getStringCellValue());//用户地址

                    }else if(c==3){

                     /*  DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                       Date date = new Date((long)cell.getNumericCellValue());
                       format.format(date);
                       user.setBirthday(date);//用户生日*/

                     /*  DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
                       try {
                           user.setBirthday(format1.parse(cell.getStringCellValue()));
                       } catch (ParseException e) {
                           e.printStackTrace();
                       }*/

                        if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){
                            short format = cell.getCellStyle().getDataFormat();
                            SimpleDateFormat sdf = null;
                            if(format == 14 || format == 31 || format == 57 || format == 58){
                                //日期
                                sdf = new SimpleDateFormat("yyyy-MM-dd");
                            }else if (format == 20 || format == 32) {
                                //时间
                                sdf = new SimpleDateFormat("HH:mm");
                            }
                            double value = cell.getNumericCellValue();
                            Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
                            user.setBirthday(date);
                        }

                    }else if(c==4){
                        user.setSex(cell.getStringCellValue());//用户性别

                    }
                }
            }
            //添加客户
            userList.add(user);
        }
        return userList;
    }
    public List<Sale> readSaleValue(Workbook wb) {

        //得到第二个shell
        Sheet sheet = wb.getSheetAt(1);
        String sheetName = sheet.getSheetName();

        //得到Excel的行数
        this.totalRows = sheet.getPhysicalNumberOfRows();

        //得到Excel的列数(前提是有行数)
        if (totalRows >= 1 && sheet.getRow(0) != null) {
            this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
        }

        List<Sale> saleList = new ArrayList<Sale>();
        //循环Excel行数,从第二行开始。标题不入库
        for (int r = 1; r < this.totalRows; r++) {
            Row row = sheet.getRow(r);
            if (row == null) continue;
            Sale sale = new Sale();

            //循环Excel的列
            for (int c = 0; c < this.totalCells; c++) {
                Cell cell = row.getCell(c);
                if (null != cell) {
                    if (c == 0) {
                        if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                            short format = cell.getCellStyle().getDataFormat();
                            SimpleDateFormat sdf = null;
                            if (format == 14 || format == 31 || format == 57 || format == 58) {
                                //日期
                                sdf = new SimpleDateFormat("yyyy-MM-dd");
                            } else if (format == 20 || format == 32) {
                                //时间
                                sdf = new SimpleDateFormat("HH:mm");
                            }
                            double value = cell.getNumericCellValue();
                            Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
                            sale.setSaleDate(date); //日期
                        }
                    } else if (c == 1) {
                        sale.setUserId((int) cell.getNumericCellValue()); //用户Id
                    } else if (c == 2) {
                        sale.setGoodsId((int) cell.getNumericCellValue()); //商品Id

                    } else if (c == 3) {

                        sale.setPrices((float) cell.getNumericCellValue());//商品价格

                    } else if (c == 4) {
                        sale.setNumber((float) cell.getNumericCellValue());//数量

                    }
                }

            }
            //添加客户
            saleList.add(sale);
        }
        return saleList;
    }
    public List<Product> readProductValue(Workbook wb) {

        //得到第三个shell
        Sheet sheet = wb.getSheetAt(2);
        String sheetName = sheet.getSheetName();

        //得到Excel的行数
        this.totalRows = sheet.getPhysicalNumberOfRows();

        //得到Excel的列数(前提是有行数)
        if (totalRows >= 1 && sheet.getRow(0) != null) {
            this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
        }

        List<Product> productList = new ArrayList<Product>();
        //循环Excel行数,从第二行开始。标题不入库
        for (int r = 1; r < this.totalRows; r++) {
            Row row = sheet.getRow(r);
            if (row == null) continue;
            Product product = new Product();

            //循环Excel的列
            for (int c = 0; c < this.totalCells; c++) {
                Cell cell = row.getCell(c);
                if (null != cell) {
                    if (c == 0) {
                        product.setId((int)cell.getNumericCellValue());
                    } else if (c == 1) {
                        product.setBookName(cell.getStringCellValue());
                    } else if (c == 2) {
                        product.setSpecies(cell.getStringCellValue());

                    } else if (c == 3) {
                        product.setPrice(cell.getNumericCellValue());

                    } else if (c == 4) {
                       product.setUnit(cell.getStringCellValue());

                    }
                }

            }
            //添加客户
            productList.add(product);
        }
        return productList;
    }

}