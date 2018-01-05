package com.jing.service;

import com.jing.VO.User;

import java.util.Arrays;
import java.util.List;


public interface ISelUserService {
    User selUserById(int id);
    List<User> selUser();
    List<User> conditionSel(User user);
    Boolean addUser(User user);
    Boolean updateUser(User user);
    Boolean deleteUser(Integer id);
}
