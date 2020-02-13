package com.garen.fuka.controller;

import com.garen.fuka.entity.User;
import com.garen.fuka.service.UserService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;

/**
 * @Author yang_li
 * @Date 2020/1/14 21:31
 */

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

//    登陆操作
    @RequestMapping("/login")
    public void login(String uname, String password, HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter pw = response.getWriter();
//        根据uname获取用户
        User user = userService.getUserByUname(uname);
//        判断是否存在
        if(Objects.isNull(user)){
//            如果不存在
            pw.write("-1");
            pw.flush();
            pw.close();
            return;
        }

//        判断密码
        if (user.getPassword().equals(password)){
            System.out.println("密码正确");
            pw.write("1");
//            存入session
            request.getSession().setAttribute("nowuser",user);
        }else {
            System.out.println("密码错误");
            pw.write("0");
        }
        pw.flush();
        pw.close();
    }

//    注册操作
    @RequestMapping("/register")
    public void register(String uname, String password,String qq,HttpServletResponse response) throws IOException {
        PrintWriter pw = response.getWriter();
        User user = new User();
        user.setUname(uname);
        user.setPassword(password);
        user.setQq(qq);
        boolean f = userService.insert(user);
        if(f){
            pw.write("1");
        }else{
            pw.write("0");
        }
        pw.flush();
        pw.close();
    }

//    获取所有用户
    @ResponseBody
    @RequestMapping("/getAllUser")
    public List<User>  getAllUser(){
        return userService.getAllUser();
    }

//    根据福卡获取用户
    @ResponseBody
    @RequestMapping("/getUserByFuka")
    public List<User> getUserByFuka(String fuka){
        return userService.findUnameByFuka(fuka);
    }

//    判断当前是否登录
    @RequestMapping("/ifLogin")
    public void ifLogin(HttpServletRequest request,HttpServletResponse response) throws IOException {
        PrintWriter pw = response.getWriter();

        User nowuser = (User) request.getSession().getAttribute("nowuser");
        System.out.println("当前用户:"+nowuser);
//        判断是否存在
        if(Objects.isNull(nowuser)){
            pw.write("0");
        }else{
            pw.write("1");
        }
        pw.flush();
        pw.close();
    }

//    更新用户福卡数量
    @RequestMapping("/update")
    public void update(int aiguo,int fuqiang,int hexie,int youshan,int jingye,HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User nowuser = (User) session.getAttribute("nowuser");
        int i = userService.updateFukaByUname(nowuser.getUname(), aiguo, fuqiang, hexie, youshan, jingye);

        PrintWriter pw = response.getWriter();
        if(i>=0){
            pw.write("1");
        }else{
           pw.write("0");
        }
        pw.flush();
        pw.close();
        session.setAttribute("nowuser",userService.getUserByUname(nowuser.getUname()));
    }

//    退出登录
    @RequestMapping("/exit")
    public ModelAndView exit(HttpServletRequest request,ModelAndView mv) throws IOException {
        request.getSession().invalidate();
        mv.setViewName("index");
        return mv;
    }

//    删除用户
    @RequestMapping("/del")
    public void del(HttpServletRequest request,HttpServletResponse response) throws IOException {
        User nowuser = (User) request.getSession().getAttribute("nowuser");
//            删除成功
        PrintWriter pw = response.getWriter();
        boolean f = userService.delete(nowuser.getUname(), nowuser.getPassword());
        if(f){
            pw.write("1");
        }else{
            pw.write("0");
        }
        pw.flush();
        pw.close();
    }

//    查看详情
    @RequestMapping("/xiangqing")
    public void xiangqing(String uname,HttpServletRequest request,HttpServletResponse response) throws IOException {
        PrintWriter pw = response.getWriter();
        User user = userService.getUserByUname(uname);
        request.getSession().setAttribute("mainuser", user);
        pw.write("1");
        pw.flush();
        pw.close();
    }

}
