package com.cykj.controller;

import com.cykj.entity.BackUser;
import com.cykj.entity.Menu;
import com.cykj.entity.UserInfo;
import com.cykj.service.LoginService;
import com.cykj.service.PowerService;
import com.cykj.util.AliyunSmsUtils;
import com.cykj.util.MD5Utils;
import com.cykj.utils.PhoneCodeUtil;
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
//    @Loger(operationName = "跳转登录界面")
    public String login() {
        return "Login";
    }




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
            UserInfo userInfo = loginServiceImpl.log(account, pwd);

            if (userInfo != null) {
                System.out.println(userInfo.toString());
                String stateName = userInfo.getStates().getParamName();
                if (stateName.equals("启用")) {
                    request.getSession().setAttribute("qUser", userInfo);
                    System.out.println("登录成功!");
                    return "success";
                } else if (stateName.equals("禁用")) {
                    request.getSession().removeAttribute("qUser");
                    System.out.println("此账号已被禁用!");
                    return "disable";
                } else if (stateName.equals("已删除")) {
                    request.getSession().removeAttribute("qUser");
                    System.out.println("此账号已被删除!");
                    return "delete";
                } else {
                    request.getSession().removeAttribute("qUser");
                    System.out.println("账号审核未通过，无法登录");
                    return "auditFailed";
                }

            } else {
                System.out.println("用户名或密码错误!");
                return "passMiss";
            }
        } else {
            System.out.println("验证码错误!");
            return "vCodeError";
        }
    }

    @RequestMapping("/admin")
//    @Loger(operationType = "跳转后台登录页面")
    public String admin() {
        return "adminLog";
    }

    @RequestMapping("/adLog")
//    @Loger(operationName = "执行后端登录动作")
    public @ResponseBody
    String adlog(String account, String password, String sVCode, HttpServletRequest
            request) throws IOException {
        System.out.println("执行后端登录动作");
        System.out.println("账号:" + account + ",密码:" + password + ",验证码:" + sVCode);

        String vCode = (String) request.getSession().getAttribute("vCode");
        request.getSession().removeAttribute("vCode");
        if (sVCode.equalsIgnoreCase(vCode)) {
//            启用MD5解开即可
            BackUser backUser = loginServiceImpl.adminLog(account,MD5Utils.md5(password));
//            BackUser backUser = loginServiceImpl.adminLog(account, password);
            if (backUser == null) {
                System.out.println("用户名或密码错误!");
                return "noAcc";
            } else {
                System.out.println(backUser.toString());
                String stateName = backUser.getStates().getParamName();
                if (stateName.equals("启用")) {
                    request.getSession().setAttribute("admin", backUser);
                    System.out.println("登录成功!");
                    return "success";
                } else if (stateName.equals("待审核")) {
                    request.getSession().removeAttribute("admin");
                    System.out.println("此账号待审核!");
                    return "noReviewed";
                } else if (stateName.equals("审核不通过")) {
                    request.getSession().removeAttribute("admin");
                    System.out.println("此账号已被删除!");
                    return "failedPass";
                } else {
                    request.getSession().removeAttribute("admin");
                    System.out.println("登录失败!");
                    return "failed";
                }
            }
        } else {
            System.out.println("验证码错误!");
            return "vCodeError";
        }
    }

    //短信登录
    @RequestMapping("/mesLog")
    public @ResponseBody
    String mesLog(String phone, String code, HttpServletRequest request) {
        System.out.println("执行短信验证登录!");
        System.out.println("传过来的手机值为:" + phone + "验证码为:" + code);

        String savePhone = (String) request.getSession().getAttribute("logPhone");
        String saveCode = (String) request.getSession().getAttribute("logCode");

        System.out.println("savePhone"+savePhone);
        System.out.println("saveCode"+saveCode);


        if (!phone.equalsIgnoreCase(savePhone)) {
            System.out.println("手机号错误!");
            return "9";
        }
        if (!code.equalsIgnoreCase(saveCode)){
            System.out.println("验证码错误!");
            return "8";
        }
        if (code.equalsIgnoreCase(saveCode)){
            System.out.println("执行短信验证登录!");
//            如果启用MD5解开即可
//            UserInfo userInfo = loginServiceImpl.mesLog(MD5Utils.md5(phone));
            UserInfo userInfo= loginServiceImpl.mesLog(phone);
            System.out.println("userInfo:"+userInfo.toString());
            if (userInfo == null){
                System.out.println("登录失败！");
                return "s";
            } else {
                System.out.println(userInfo.toString());
                String stateName = userInfo.getStates().getParamName();
                if (stateName.equals("启用")){
                    request.getSession().setAttribute("qUser", userInfo);
                    System.out.println("登录成功!");
                    return "success";
                } else if (stateName.equals("禁用")) {
                    request.getSession().removeAttribute("qUser");
                    System.out.println("此账号已被禁用!");
                    return "j";
                } else if (stateName.equals("已删除")){
                    request.getSession().removeAttribute("qUser");
                    System.out.println("此账号已被删除!");
                    return "d";
                } else {
                    request.getSession().removeAttribute("qUser");
                   System.out.println("账号审核未通过，无法登录");
                    return "f";
                }
            }
        }
        return "";
    }



    //发送短信验证码
    @RequestMapping("/aliSend")
    public @ResponseBody
    String aliSend(String phone, HttpServletRequest request) {
        UserInfo userInfo = loginServiceImpl.findPhone(phone);
        if(userInfo==null) return "2";
            String code = "";
            for (int i = 0; i < 4; i++) {
                int num = (int) (1 + Math.random() * 9);
                code += num;
            }
            request.getSession().setAttribute("logPhone", phone);
            request.getSession().setAttribute("logCode", code);
            System.out.println("发送的验证码为:" + code);
            String s = AliyunSmsUtils.sendCode(phone, code);
            System.out.println(s);

            return "1";
        }

        //修改密码发送验证码
    @RequestMapping("/sendCode")
    public @ResponseBody String sendCode(String phone,HttpServletRequest request){
        UserInfo userInfo = loginServiceImpl.findPhone(phone);
        if(userInfo==null) return "2";

        String code = "";
        for(int i=0;i<4;i++){
            int num = (int)(1+Math.random()*9);
            code += num;
        }
        System.out.println("code="+code);
        request.getSession().setAttribute("phone",phone);
        request.getSession().setAttribute("code",code);
        String s = PhoneCodeUtil.sendCode(phone, code);
        System.out.println(s);
        return "1";
    }

        @RequestMapping("/findPass")
        public @ResponseBody String findPass(String phone,String pwd,String vCode,HttpServletRequest request ){

            String savePhone = (String) request.getSession().getAttribute("phone");
            String saveCode = (String)request.getSession().getAttribute("code");
            if(!phone.equals(savePhone)){
                System.out.println("登录手机号未找到!");
                return "2";
            }
            if(!vCode.equals(saveCode)){
                System.out.println("验证码错误");
                return "3";
            }
            int n = loginServiceImpl.changPasswordByPhone(pwd,phone);

        return n>0?"1":"4";
        }



    @RequestMapping(value = "/getCode")
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


    //跳转注册页面
    @RequestMapping("/reg")
    public String reg(){
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
    public String forget() {
        return "ForgetPass";
    }


    @RequestMapping("/adminMain")
//    @Loger(operationName = "登录后跳转菜单")
    public String adminMain(HttpServletRequest request, HttpServletResponse response) {
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
    public String toMain(HttpServletRequest request, HttpServletResponse response) {
        BackUser backUser = new BackUser();
        backUser.setRoleId(1);
        backUser.setBUserName("测试1");
        request.getSession().setAttribute("adminInfo", backUser);
        List<Menu> menuList = powerServiceImpl.findExistMenu(backUser.getRoleId());
        request.getSession().setAttribute("menuList", menuList);
        return "BackMain";
    }

}
