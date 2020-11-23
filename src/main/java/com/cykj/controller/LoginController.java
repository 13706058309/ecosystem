package com.cykj.controller;

import com.cykj.entity.BackUser;
import com.cykj.entity.Menu;
import com.cykj.entity.UserInfo;
//import com.cykj.log.Loger;
import com.cykj.service.LoginService;
import com.cykj.service.PowerService;
import com.cykj.util.MD5Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/golog")
public class LoginController {
    @Resource
    private LoginService loginServiceImpl;
    @Resource
    private PowerService powerServiceImpl;

    //跳转登录界面
    @RequestMapping(value = {"/login"})
    public String login() {
        return "Login";
    }


//    @RequestMapping(value = "/sendNote",method = RequestMethod.GET)
//    public void sendNote(String phone, HttpServletResponse response){
//        String template = "SMS_205439841";
//        try {
//            response.getWriter().write(sendNoteUtil.sendNoteMessgae(phone,template));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

//    @RequestMapping(value = "/phonelog",method = RequestMethod.POST)
//    public String login(String phoneNumber,String acthCode){
//        //验证验证码
//        if(!verifyAuthCode(acthCode,phoneNumber)){
//            return"验证码错误";
//        }
//        return "登陆成功";
//    }

//    //对输入的验证码进行校验
//    private boolean verifyAuthCode(String authCode, String telephone){
//        if(StringUtils.isEmpty(authCode)){
//            return false;
//        }
//        String realAuthCode = redisService.get(REDIS_KEY_PREFIX_AUTH_CODE + telephone);
//        return authCode.equals(realAuthCode);
//    }


    //前端登录的动作
    @RequestMapping(value = {"/log"})
//    @Loger(operationName = "执行前端用户登录")
    public @ResponseBody
    String log(String account, String pwd, String sVCode, HttpServletRequest request) {
        System.out.println("执行前端用户登录!");
        System.out.println("账号:" + account + ",密码:" + pwd + ",验证码:" + sVCode);
        String vCode = (String) request.getSession().getAttribute("vCode");
        request.getSession().removeAttribute("vCode");
        if (sVCode.equalsIgnoreCase(vCode)) {
//            启用MD5解开即可
//            UserInfo userInfo = loginServiceImpl.log(account,MD5Utils.md5(pwd));
            UserInfo userInfo = loginServiceImpl.log(account,pwd);

            if (userInfo == null) {
                System.out.println("查无此账号!");
                return "no account";
            } else {
                System.out.println(userInfo.toString());
                String stateName = userInfo.getStates().getParamName();
                if (stateName.equals("启用")) {
                    request.getSession().setAttribute("qUser", userInfo);
                    System.out.println("登录成功!");
                    return "success";
                } else if (stateName.equals("禁用")) {
//                    request.getSession().removeAttribute("qUser");
                    System.out.println("此账号已被禁用!");
                    return "disable";
                } else if (stateName.equals("已删除")) {
//                    request.getSession().removeAttribute("qUser");
                    System.out.println("此账号已被删除!");
                    return "delete";
                } else {
//                    request.getSession().removeAttribute("qUser");
                    System.out.println("账号审核未通过，无法登录");
                    return "Audit failed";
                }
            }
        } else {
            System.out.println("验证码错误!");
            return "Vcode error";
        }
    }

    @RequestMapping(value = "/getCode")
//    @Loger(operationName = "获取验证码")
    public String getCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //声明验证码
        System.out.println("123");
        int width = 60;
        int height = 30;
        String data = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789abcdefghijklmnpqrstuvwxyz";    //随机字符字典，其中0，o，1，I 等难辨别的字符最好不要
        Random random = new Random();//随机类
        //1 创建图片数据缓存区域（核心类）
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);//创建一个彩色的图片
        //2 获得画板(图片，ps图层)，绘画对象。
        Graphics g = image.getGraphics();
        //3 选择颜色，画矩形3，4步是画一个有内外边框的效果
        g.setColor(Color.BLACK);
        g.fillRect(0, 0, width, height);
        //4白色矩形
        g.setColor(Color.WHITE);
        g.fillRect(1, 1, width - 2, height - 2);

        /**1 提供缓存区域，为了存放4个随机字符，以便存入session */
        StringBuilder builder = new StringBuilder();

        //5 随机生成4个字符
        //设置字体颜色
        g.setFont(new Font("宋体", Font.BOLD & Font.ITALIC, 20));
        for (int i = 0; i < 4; i++) {
            //随机颜色
            g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));

            //随机字符
            int index = random.nextInt(data.length());
            String str = data.substring(index, index + 1);

            /**2 缓存*/
            builder.append(str);

            //写入
            g.drawString(str, (width / 6) * (i + 1), 20);
        }
        //给图中绘制噪音点，让图片不那么好辨别
        for (int j = 0, n = random.nextInt(100); j < n; j++) {
            g.setColor(Color.RED);
            g.fillRect(random.nextInt(width), random.nextInt(height), 1, 1);//随机噪音点
        }

        /**3 获得随机数据，并保存session*/
        String tempStr = builder.toString();
        request.getSession().setAttribute("vCode", tempStr);

        //.. 生成图片发送到浏览器 --相当于下载
        ImageIO.write(image, "jpg", response.getOutputStream());

        return null;
    }

    //跳转注册界面
    @RequestMapping(value = {"/reg"})
    public String reg() {
        return "Register";
    }

    //注册的动作
//    @Loger(operationName = "执行前端注册")
    @RequestMapping(value = {"/regiest"})
    public @ResponseBody
    String regiest(UserInfo userInfo) {
        System.out.println("执行注册!");

        String account = userInfo.getAccount();
//        启用MD5解开即可
//        userInfo.setPwd(MD5Utils.md5(userInfo.getPwd()));
        if (loginServiceImpl.isRepeat(account)) {
            int i = loginServiceImpl.register(userInfo);
            if (i > 0) {
                return "regsuccess";
            } else {
                return "regfaid";
            }
        } else {

            return "repeat";
        }
    }

        //跳转忘记密码界面
        @RequestMapping("/forget")
        public String forget () {
            return "ForgetPass";
        }

    @RequestMapping("/admin")
//    @Loger(operationType = "跳转登录页面")
    public String admin(){
        return "adminLog";
    }

        @RequestMapping("/adLog")
//        @Loger(operationName = "执行后端登录动作",operationType="执行后端登录动作")
        public @ResponseBody String adlog (String account, String password, String vCode, HttpServletRequest
        request, HttpServletResponse response) throws IOException {
            System.out.println("执行后端登录动作");
            System.out.println("密码是:"+password);
            System.out.println("账号:" + account + ",密码:" + password + ",验证码:" + vCode);
            String code = (String)request.getSession().getAttribute("code");
            request.getSession().removeAttribute("code");
        if(!vCode.equalsIgnoreCase(code)){
//            启用MD5解开即可
//            BackUser backUser = loginServiceImpl.adminLog(account,MD5Utils.md5(password) );
            BackUser backUser = loginServiceImpl.adminLog(account,password);
            if (backUser == null) {
                System.out.println("查无此账号!");
                return "no account";
            } else {
                System.out.println(backUser.toString());
                String stateName = backUser.getStates().getParamName();
                if (stateName.equals("启用")) {
                    request.getSession().setAttribute("admin", backUser);
                    System.out.println("登录成功!");
                    return "success";
                } else if (stateName.equals("禁用")) {
                    System.out.println("此账号已被禁用!");
                    return "disable";
                } else if (stateName.equals("已删除")) {
                    System.out.println("此账号已被删除!");
                    return "delete";
                } else {
                    System.out.println("账号审核未通过，无法登录");
                    return "Audit failed";
                }
            }
        } else {
            System.out.println("验证码错误!");
            return "Vcode error";
        }
        }

        @RequestMapping("/adminMain")
//        @Loger(operationName = "登录后跳转菜单",operationType = "登录后跳转菜单")
        public String adminMain (HttpServletRequest request, HttpServletResponse response){
            BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
            if (backUser != null) {
                List<Menu> menuList = powerServiceImpl.findExistMenu(backUser.getRoleId());
                request.getSession().setAttribute("menuList", menuList);
                return "BackMain";
            } else {
                return "";
            }
        }

        @RequestMapping("/toMain")
        public String toMain (HttpServletRequest request, HttpServletResponse response){
            BackUser backUser = new BackUser();
            backUser.setRoleId(1);
            backUser.setBUserName("测试1");
            request.getSession().setAttribute("adminInfo", backUser);
            List<Menu> menuList = powerServiceImpl.findExistMenu(backUser.getRoleId());
            request.getSession().setAttribute("menuList", menuList);
            return "BackMain";
        }

    }
