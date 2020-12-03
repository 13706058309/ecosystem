package com.cykj.service;

import com.alipay.api.AlipayApiException;
import com.cykj.entity.Resume;
import com.cykj.entity.UserProject;
import com.cykj.util.TaskInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface UserProjectService {
    /**
     * 用户申请项目
     *
     * @param userProject
     * @return
     */
    UserProject addUserProject(UserProject userProject);

    /**
     * 用户订单列表
     * @param condition
     * @param page
     * @param limit
     * @return
     */
    List<UserProject> findUserProjectByPage(Map<String,Object> condition,int page,int limit);

    /**
     * 修改状态
     * @param userProject
     * @return
     */
    int updateState(UserProject userProject);



    /**
     * 查询用户订单列表记录数
     * @param condition
     * @return
     */
    int findUserProjectRecord(Map<String,Object> condition);

    /**
     * 用户查询项目
     *
     * @param userProject
     * @return
     */
    List<UserProject> findUserProject(UserProject userProject);

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
    public String alipayTradePagePay(HttpServletRequest request , HttpServletResponse response,String id) throws Exception;

    /**
     * 退款
     * @param response
     * @param session
     */
    public String refund(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws IOException, AlipayApiException;

    /**
     * 查询项目的申请人
     * @param projectId
     * @return
     */
    List<Resume> findUserByProjectInfo(String projectId, String paramId);

    /**
     * 上传项目进度
     * @param projectMpps
     * @return
     */
    int addProjectMpp(List<TaskInfo> projectMpps,String fileName);
}
