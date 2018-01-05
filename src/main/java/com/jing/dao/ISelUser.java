package com.jing.dao;

import com.jing.VO.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import javax.annotation.Resource;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Resource
public interface ISelUser {
    User selUser(@Param("id") Integer id);
    List<User> allUser();
    List<User> conditionalSel(User user);
    java.lang.Boolean addUser(User user);
    Boolean updateUser(User user);
    Boolean deleteUser(Integer id);

}
