package com.cykj.controller;

import com.cykj.entity.BackUser;
import com.cykj.utils.Pages;
import com.cykj.entity.RoleInfo;
import com.cykj.entity.TableInfo;
import com.cykj.log.Loger;
import com.cykj.service.UserService;
import com.google.gson.Gson;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.net.ssl.HandshakeCompletedEvent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/test")
public class SystemController {
    @Resource
    UserService userServiceImpI;

    @RequestMapping("/testDemo")
    public String test() {
        return "MainPage";
    }

    @RequestMapping("/userManage")
    @Loger(operationType = "用户管理", operationName = "用户管理")
    public String userManage() {
        return "UserManage";
    }

    @RequestMapping("/adminManage")
    @Loger(operationType = "管理员管理", operationName = "管理员管理")
    public String adminManage() {
        return "AdminManage";
    }

    @RequestMapping("/enterpriseManage")
    @Loger(operationType = "企业管理", operationName = "企业管理")
    public String enterpriseManage() {
        return "EnterpriseManage";
    }

    @RequestMapping("/postManage")
    @Loger(operationType = "岗位管理", operationName = "岗位管理")
    public String postManage() {
        return "PostManage";
    }

    @RequestMapping("/frontLog")
    @Loger(operationType = "前端日志", operationName = "前端日志")
    public String frontLog() {
        return "FrontLog";
    }
    //======================================================================================================
    //后台菜单
//    @RequestMapping("/aMenu")  //后端主界面模板
//    public String aMenu(HttpServletRequest request, HttpServletResponse response) {
//        System.out.println("为啥没有到方法里");
//        Map<String, List<Menu>> tMenus = new LinkedHashMap<>();
//        List<Menu> fMenuList = userServiceImpI.findMenus(0);
//        System.out.println("一级菜单" + fMenuList);
//        for (Menu menu : fMenuList) {
//            List<Menu> sonMenuList = userServiceImpI.findMenus((int) menu.getId());
//            tMenus.put(menu.getName(), sonMenuList);
//            System.out.println(menu.getName() + "得到的值");
//        }
//        request.setAttribute("menuMap", tMenus);
//        return "Main_Page";
//    }
    //======================================================================================================
    //用户信息
    @RequestMapping(value = "/getTableInfo", produces = "text/html;charset=UTF-8")
    @Loger(operationType = "用户信息", operationName = "用户信息")
    public @ResponseBody
    String getTableInfo(int page, int limit, String userName, String accStandId) {
        System.out.println("前端用户姓名" + userName);
        Map<String, Object> map = new HashMap<>();
        if (userName != null && userName.length() != 0) {
            map.put("userName", userName);
        } else {
            map.put("userName", "");
        }
        if (accStandId != null && accStandId.length() != 0) {
            map.put("accStandId", accStandId);
        }

        TableInfo tableInfo = userServiceImpI.findAllOnPage(map, page, limit);
        return new Gson().toJson(tableInfo);
    }
    //======================================================================================================
    //管理员信息
    @RequestMapping(value = "/getTableInfoManage", produces = "text/html;charset=UTF-8")
    @Loger(operationType = "管理员信息", operationName = "管理员信息")
    public @ResponseBody
    String getTableInfoManage(Pages pages, int page, int limit, String bUserName, String stateId) {
        System.out.println(bUserName + "后端用户姓名");
        Map<String, Object> map = new HashMap<>();
        if (bUserName != null && bUserName.length() != 0) {
            map.put("bUserName", bUserName);
        } else {
            map.put("bUserName", "");
        }
        if (stateId != null && stateId.length() != 0) {
            map.put("stateId", stateId);
        }
        if (pages.getType() != null && pages.getType().length() != 0 && !pages.getType().equals("请选择")) {
            map.put("type", pages.getType());
        }

        TableInfo tableInfo = userServiceImpI.backFindsAllOnPage(map, page, limit);
        return new Gson().toJson(tableInfo);
    }

    //======================================================================================================
    //管理员密码重置
    @RequestMapping("/resetPassword")
    @Loger(operationType = "管理员密码重置", operationName = "管理员密码重置")
    public void resetPassword(String bUserId, String pwd, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(bUserId + "后端用户id");
        System.out.println(pwd + "后端用户密码");
        boolean isSuccess = userServiceImpI.resetPassword(bUserId, pwd);
        if (isSuccess) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("failed");
        }
    }
    //======================================================================================================
    //企业信息
    @RequestMapping(value = "/enterprise", produces = "text/html;charset=UTF-8")
    @Loger(operationType = "企业信息", operationName = "企业信息")
    public @ResponseBody
    String enterprise(int page, int limit, String compName, String stateId) {
        System.out.println(compName + "企业名称");
        Map<String, Object> map = new HashMap<>();
        if (compName != null && compName.length() != 0) {
            map.put("compName", compName);
        } else {
            map.put("compName", "");
        }
//        if (stateId != null && stateId.length() != 0) {
//
//        }
        map.put("stateId", 17);
        TableInfo tableInfo = userServiceImpI.compNameFindsAllOnPage(map, page, limit);
        return new Gson().toJson(tableInfo);
    }
    //======================================================================================================
    //修改前端用户状态
    @RequestMapping("/changeUserState")
    @Loger(operationType = "修改前端用户状态", operationName = "修改前端用户状态")
    public void changeUserState(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userId = request.getParameter("userId");
        String accStandId = request.getParameter("accStandId");
        System.out.println("修改的是用户ID:" + userId);
        System.out.println("修改的是状态ID:" + accStandId);
        boolean isSuccess = userServiceImpI.changeUserState(userId, accStandId);
        if (isSuccess) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("failed");
        }
    }
    //======================================================================================================
    //修改企业状态changeEnterpriseState
    @RequestMapping("/changeEnterpriseState")
    @Loger(operationType = "修改企业状态", operationName = "修改企业状态")
    public void changeEnterpriseState(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bUserId = request.getParameter("bUserId");
        String stateId = request.getParameter("stateId");
        System.out.println("修改的是企业ID:" + bUserId);
        System.out.println("修改的是企业状态ID:" + stateId);
        boolean isSuccess = userServiceImpI.changeEnterpriseState(bUserId, "1");
        if (isSuccess) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("failed");
        }
    }
    //======================================================================================================
    //删除前端用户
    @RequestMapping("/deleteUser")
    @Loger(operationType = "删除前端用户", operationName = "删除前端用户")
    public void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {//删除用户
        String userId = req.getParameter("userId");
        String accStandId = req.getParameter("accStandId");
        System.out.println("获取用户的id:" + userId);
        System.out.println("状态的id:" + accStandId);
        int n = userServiceImpI.deleteUser(new Integer(Integer.parseInt(userId)), new Integer(Integer.parseInt(accStandId)));
        System.out.println("获取n的值：" + n);
        if (n > 0) {
            resp.getWriter().write("success");
        } else {
            resp.getWriter().write("failed");
        }
    }
    //======================================================================================================
    //修改后端用户状态
    @RequestMapping("/changeBackUserState")
    @Loger(operationType = "修改后端用户状态", operationName = "修改后端用户状态")
    public void changeBackUserState(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bUserId = request.getParameter("bUserId");
        String stateId = request.getParameter("stateId");
        System.out.println("修改的是用户ID:" + bUserId);
        System.out.println("修改的是状态ID:" + stateId);
//        int state = 0;
//        if (stateId.equals("启用")) {
//            state = 2;
//            System.out.println("后端用户状态：" + stateId);
//        } else if (stateId.equals("禁用")) {
//            state = 1;
//            System.out.println("后端用户状态：" + stateId);
//        }
        boolean isSuccess = userServiceImpI.changeBackUserState(bUserId, stateId);
        System.out.println("打印成功修改了状态"+isSuccess);
        if (isSuccess) {
            response.getWriter().write("success");
        } else {
            System.out.println("为什么失败了？");
            response.getWriter().write("failed");
        }
    }
    //======================================================================================================
    //删除后端用户
    @RequestMapping("/deleteBackUser")
    @Loger(operationType = "删除后端用户", operationName = "删除后端用户")
    public void deleteBackUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {//删除用户
        String bUserId = req.getParameter("bUserId");
        String stateId = req.getParameter("stateId");
        System.out.println("获取用户的id:" + bUserId);
        System.out.println("后台状态id：" + stateId);
        int n = userServiceImpI.deleteBackUser(new Integer(Integer.parseInt(bUserId)), new Integer(Integer.parseInt(stateId)));
        System.out.println("获取n的值：" + n);
        if (n > 0) {
            resp.getWriter().write("success");
        } else {
            resp.getWriter().write("failed");
        }
    }
    //======================================================================================================
    //新增管理员
    @RequestMapping("/add")  //新增界面模板
    @Loger(operationType = "新增管理员", operationName = "新增管理员")
    public void add(String bUserName, String account, String pwd, String contactInfo, int roleIds, String stateId, HttpServletRequest request, HttpServletResponse response) throws IOException {
        BackUser backUser = new BackUser();
        System.out.println(bUserName + "+名字");
        System.out.println(account + "+账号");
        System.out.println(contactInfo + "+联系方式");
        System.out.println("获取的角色id:" + roleIds);
        if (userServiceImpI.query(contactInfo)) {
            if (userServiceImpI.register(account)) {//判断该账号是否已经新增过
                backUser.setbUserName(bUserName);
                backUser.setAccount(account);
                backUser.setPwd(pwd);
                backUser.setContactInfo(contactInfo);
                backUser.setRoleId(roleIds);
                backUser.setStateId("1");//默认为1，为启用状态
                int n = userServiceImpI.reg(backUser);
                if (n > 0) {
                    response.getWriter().write("success");
                    System.out.println("新增成功");
                } else {
                    response.getWriter().write("failed");
                    System.out.println("新增失败");
                }
            } else {
                response.getWriter().write("existing");
                System.out.println("该账号已存在");
            }
        } else {
            response.getWriter().write("exist");
            System.out.println("该手机号已存在");
        }
    }
    //======================================================================================================
    //动态角色
    @RequestMapping(value = "/findAll", produces = "text/html; charset=UTF-8")
    @Loger(operationType = "动态角色", operationName = "动态角色")
    public @ResponseBody
    String findAll() { List<RoleInfo> list = userServiceImpI.getAll();
        return new Gson().toJson(list);
    }
    //======================================================================================================
    //动态角色
    @RequestMapping(value = "/findRole", produces = "text/html; charset=UTF-8")
    @Loger(operationType = "动态角色", operationName = "动态角色")
    public @ResponseBody String findRole() {
        List<RoleInfo> list = userServiceImpI.findRole();
        return new Gson().toJson(list);
    }

    //======================================================================================================
    //新增学校
    @RequestMapping("/addSchool")  //新增界面模板
    @Loger(operationType = "新增学校", operationName = "新增学校")
    public void addSchool(String bUserName, String account, String pwd, String contactInfo, String address, String infoIntr,
                          String email, int roleIds, String stateId, String compName, String coreValue, HttpServletRequest request, HttpServletResponse response) throws IOException {
        BackUser backUser = new BackUser();
        System.out.println(bUserName + "+校长名字");
        System.out.println(account + "+账号");
        System.out.println(contactInfo + "+联系方式");
        System.out.println("获取的角色id:" + roleIds);
        System.out.println("获得的校名：" + compName);
        if (userServiceImpI.query(contactInfo)) {
            if (userServiceImpI.register(account)) {//判断该账号是否已经注册过
                backUser.setbUserName(bUserName);
                backUser.setAccount(account);
                backUser.setPwd(pwd);
                backUser.setContactInfo(contactInfo);
                backUser.setAddress(address);
                backUser.setInfoIntr(infoIntr);
                backUser.setEmail(email);
                backUser.setRoleId(2);//角色是高校
                backUser.setStateId("1");//默认为1，为启用状态
                backUser.setCompName(compName);
                backUser.setCoreValue(coreValue);
                int n = userServiceImpI.addSchool(backUser);
                if (n > 0) {
                    response.getWriter().write("success");
                    System.out.println("新增成功");
                } else {
                    response.getWriter().write("failed");
                    System.out.println("新增失败");
                }
            } else {
                response.getWriter().write("existing");
                System.out.println("该账号已存在");
            }
        } else {
            response.getWriter().write("exist");
            System.out.println("该手机号已存在");
        }
    }
    //======================================================================================================
    //下载
    @RequestMapping(value = "/upload")
    public ResponseEntity<byte[]> upload(int bUserId,HttpServletRequest request,HttpServletResponse response) throws IOException {
        BackUser backUser = userServiceImpI.findByID(bUserId);

        String path2 = backUser.getBusiLice();
        String path1 = request.getSession().getServletContext().getRealPath("/uploadBusiLice");
        System.out.println("打印:path1和path2"+path1+"======"+path2);

        File file = new File(path1+path2);
        String path = path1+path2;
        System.out.println("下载的路径："+path);
        //设置头信息
        HttpHeaders httpHeaders = new HttpHeaders();
        String downloadFileName = new String((path.substring(path.lastIndexOf("\\")+1)).getBytes("UTF-8"), "iso-8859-1");
        //设置响应的文件名
        httpHeaders.setContentDispositionFormData("attachment",downloadFileName);
        //MediaType:互联网媒介类型，contextType 具体请求中的媒体类型信息
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),httpHeaders, HttpStatus.CREATED);
    }
}


