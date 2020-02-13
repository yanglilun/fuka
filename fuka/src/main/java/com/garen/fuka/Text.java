package com.garen.fuka;

import com.garen.fuka.entity.User;
import com.garen.fuka.service.UserService;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @Author yang_li
 * @Date 2020/1/14 19:45
 */

public class Text {
    public static void main(String[] args) {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userService = context.getBean("userService", UserService.class);
        User garen = userService.getUserByUname("garen");
        System.out.println(garen);
    }
}