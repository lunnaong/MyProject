package com.jing.service.Imp;

import com.jing.VO.Product;
import com.jing.VO.Sale;
import com.jing.VO.User;
import com.jing.dao.ISelProd;
import com.jing.dao.ISelSale;
import com.jing.dao.ISelUser;
import com.jing.service.IUploadService;
import com.jing.util.ReadExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.util.Map;

@Service
public class UploadService implements IUploadService{
    @Autowired
    ISelUser sel;
    @Autowired
    ISelProd prod;
    @Autowired
    ISelSale sale;
    public boolean batchImport(String name,MultipartFile file){
        boolean b = false;
        //创建处理EXCEL
        ReadExcel readExcel=new ReadExcel();

        //解析excel，获取客户信息集合。
        Map<String,List> map = readExcel.getExcelInfo(name ,file);
        List<User> userList = map.get("user");
        List<Sale> saleList = map.get("sale");
        List<Product> productList = map.get("product");


        if(userList != null && saleList != null && productList != null){
            b = true;
        }

        //迭代添加客户信息（注：实际上这里也可以直接将customerList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
        for(User user:userList){
            this.sel.addUser(user);
        }


        for(Sale sale : saleList){
            this.sale.addSale(sale);
        }

        for(Product product :productList){
            this.prod.addProd(product);
        }

        return b;
    }
}
