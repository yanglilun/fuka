package com.garen.fuka.service;

import com.garen.fuka.dao.UserMapper;
import com.garen.fuka.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author yang_li
 * @Date 2020/1/14 19:05
 */
@Service
public class UserService {

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private UserMapper userMapper;

//    添加用户
    public boolean insert(User user){
        return userMapper.insert(user);
    }

//    根据信息修改用户福卡数量
    public int updateFukaByUname(String uname, int aiguo, int fuqiang, int hexie, int youshan, int jingye){
        return userMapper.updateFukaByUname(uname, aiguo , fuqiang, hexie, youshan, jingye);
    }

//    根据福卡查找用户名
    public List<User> findUnameByFuka(String fuka){
        return userMapper.findUnameByFuka(fuka);
    }

//    根据用户名获取用户
    public User getUserByUname(String uname){
        return userMapper.getUserByUname(uname);
    }

//    获取所有用户
    public List<User> getAllUser(){
        return userMapper.getAllUser();
    }

//    删除用户
    public boolean delete(String uname,String password){
        return userMapper.delete(uname, password);
    }

}

