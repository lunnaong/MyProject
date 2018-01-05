package com.jing.service.Imp;

import com.jing.VO.User;
import com.jing.dao.ISelUser;
import com.jing.service.ISelUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class SelUserService implements ISelUserService {
    @Autowired
    ISelUser sel;
    public User selUserById (int id){
        return this.sel.selUser(id);
    }

    public List<User> selUser() {
       return this.sel.allUser();
    }

    @Override
    public List<User> conditionSel(User user) {
        return this.sel.conditionalSel(user);
    }

    public Boolean addUser(User user){
        Boolean istrue = this.sel.addUser(user);
        return istrue;
    }

    public Boolean updateUser(User user) {
        Boolean istrue =this.sel.updateUser(user);
        return istrue;
    }
    public Boolean deleteUser(Integer id) {

        Boolean istrue = this.sel.deleteUser(id);
        return istrue;
    }


}
