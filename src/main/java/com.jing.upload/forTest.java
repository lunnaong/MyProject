package com.jing.upload;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
/**
 * excel读取
 * @author Snow
 * HSSF用于2003版即以  .xls结尾
 * XSSF用于2007版    以   .xlsx结尾
 */
public class forTest {
    public static void readExcelData(String url)throws Exception {

        // 从XLSX/ xls文件创建的输入流
        FileInputStream fis = new FileInputStream(url);
      //  List<Object> UserList = new ArrayList<Object>();
        List<Object> ProductList = new ArrayList<Object>();
        List<Object> SaleList = new ArrayList<Object>();

        // 创建工作薄Workbook
        Workbook workBook = null;

        // 读取2007版，以    .xlsx 结尾
        if (url.toLowerCase().endsWith("xlsx")) {
            try {
                workBook = new XSSFWorkbook(fis);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        //Get the number of sheets in the xlsx file
        int numberOfSheets = workBook.getNumberOfSheets();

        System.out.println(numberOfSheets);
        // 循环 numberOfSheets
        for (int sheetNum = 0; sheetNum < numberOfSheets; sheetNum++) {

            // 得到 工作薄 的第 N个表
            Sheet sheet = workBook.getSheetAt(sheetNum);
            String name = sheet.getSheetName().trim();
            System.out.println(name);
            if (name.equals("User")){
                Row row ;
                Object cell;
                for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
                    // 循环行数
                    row = sheet.getRow(i);
                    // System.out.println(row);
                    for (int j = row.getFirstCellNum(); j < row.getPhysicalNumberOfCells(); j++) {
                        List<Object> UserList = new ArrayList<Object>();
                        cell = row.getCell(j);
                        UserList.add(cell);

                    }
                }
              //  System.out.println(UserList.toString());
            }
            if (name.equals("Product")) {
                Row row;
                for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
                    // 循环行数
                    row = sheet.getRow(i);
                    // System.out.println(row);
                    for (int j = row.getFirstCellNum(); j < row.getPhysicalNumberOfCells(); j++) {
                        // 循环列数
                        Object Prodcell = row.getCell(j);
                        ProductList.add(Prodcell);
                    }
                }
                System.out.println(ProductList.toString());
            }
            if (name.equals("Sale")){
                Row row;
                for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
                    // 循环行数
                    row = sheet.getRow(i);
                    // System.out.println(row);
                    for (int j = row.getFirstCellNum(); j < row.getPhysicalNumberOfCells(); j++) {
                        // 循环列数
                        Object Salecell = row.getCell(j);
                        SaleList.add(Salecell);
                    }
                }
                System.out.println(SaleList.toString());
            }

        }
    }
    public static void main(String[] args)throws Exception {
        readExcelData("E:/test.xlsx");
        //System.out.println(list.toString());
    }
}