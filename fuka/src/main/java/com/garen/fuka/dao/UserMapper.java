package com.garen.fuka.dao;

import com.garen.fuka.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author yang_li
 * @Date 2020/1/14 18:11
 */

public interface UserMapper {

    public boolean insert(User user);

    public int updateFukaByUname(@Param("uname") String uname,@Param("aiguo")  int aiguo,@Param("fuqiang")  int fuqiang,@Param("hexie")  int hexie,@Param("youshan")  int youshan,@Param("jingye")  int jingye);

    public List<User> findUnameByFuka(String fuka);

    public User getUserByUname(String uname);

    public List<User> getAllUser();

    public boolean delete(@Param("uname") String uname,@Param("password") String password);
}
