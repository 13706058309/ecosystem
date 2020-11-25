package com.cykj.service;

import com.cykj.entity.ProjectInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface ProjectService {
    /**
     * 查询所有企业发布的项目
     * @param condition
     * @param page
     * @param limit
     * @return
     */
    List<ProjectInfo> findProjectAll(Map<String,Object> condition,int page , int limit);

    /**
     * 查询记录数
     * @param condition
     * @return
     */
    int findRecords(Map<String,Object> condition);

    /**
     * 查询项目
     * @param projectInfo
     * @return
     */
    ProjectInfo findProject(ProjectInfo projectInfo);

    /**
     * 添加项目
     * @param projectInfo
     * @return
     */
    ProjectInfo addProject(ProjectInfo projectInfo);
    /**
     * 处理用户付款成功后的异步回调业务代码
     * @param request
     */
    void notifyUrl(HttpServletRequest request) throws Exception;

    /**
     * 处理用户支付成功后的同步回调业务代码，用于给用户展示支付后的信息
     */

    String  returnUrl(HttpServletRequest request) throws Exception;

    /**
     * 处理支付宝支付请求，返回给客户端浏览器一个二维码扫描付款
     */
    public String alipayTradePagePay(HttpServletRequest request , HttpServletResponse response) throws Exception;
}
