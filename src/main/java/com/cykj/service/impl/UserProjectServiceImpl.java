package com.cykj.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.cykj.entity.AlipayConfig;
import com.cykj.entity.Parameter;
import com.cykj.entity.ProjectInfo;
import com.cykj.entity.UserProject;
import com.cykj.mapper.ParameterMapper;
import com.cykj.mapper.ProjectInfoMapper;
import com.cykj.mapper.UserProjectMapper;
import com.cykj.service.UserProjectService;
import com.cykj.util.ProjectPayConfig;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service
public class UserProjectServiceImpl implements UserProjectService {

    @Resource
    UserProjectMapper userProjectMapper;

    @Resource
    ProjectInfoMapper projectInfoMapper;

    @Resource
    ParameterMapper parameterMapper;

    /**
     * 用户申请项目
     *
     * @param userProject
     * @return
     */
    @Override
    public UserProject addUserProject(UserProject userProject) {
        UserProject newProject=null;
        UserProject condition=new UserProject();
        condition.setUserId(userProject.getUserId());
        condition.setProjectId(userProject.getProjectId());
        List<UserProject> userProjectList=userProjectMapper.findUserProjectAll(condition);
        if (userProjectList.size()>0){
            boolean flag=true;
            for (int i=0;i<userProjectList.size();i++){
                if (userProjectList.get(i).getStates().getParamName()!=null
                        &&userProjectList.get(i).getStates().getParamName().trim().equals("已申请")){
                    flag=false;
                    break;
                }
            }
            if (flag){
                int n=userProjectMapper.addUserProject(userProject);
                if (n>0){
                    condition.setUserId(userProject.getUserId());
                    condition.setProjectId(userProject.getProjectId());
                    condition.setOrderNum(userProject.getOrderNum());
                    List<UserProject> userProjectList2=userProjectMapper.findUserProjectAll(condition);
                    if (userProjectList2!=null){
                        newProject=userProjectList2.get(0);
                    }
                }
            }
            System.out.println("您已申请了该项目，请到我的项目中查看！");
        }else{
            ProjectInfo conditionId=new ProjectInfo();
            conditionId.setProjectId(userProject.getProjectId());
            ProjectInfo projectInfo=projectInfoMapper.findProject(conditionId);
            if (projectInfo.getStates().getParamName().trim().equals("已发布")){
                int n=userProjectMapper.addUserProject(userProject);
                if (n>0){
                    condition.setUserId(userProject.getUserId());
                    condition.setProjectId(userProject.getProjectId());
                    condition.setOrderNum(userProject.getOrderNum());
                    List<UserProject> userProjectList2=userProjectMapper.findUserProjectAll(condition);
                    if (userProjectList2.size()>0){
                        newProject=userProjectList2.get(0);
                    }
                }
            }
        }
        return newProject;
    }

    /**
     * 用户订单列表
     *
     * @param condition
     * @param page
     * @param limit
     * @return
     */
    @Override
    public List<UserProject> findUserProjectByPage(Map<String, Object> condition, int page, int limit) {
        return userProjectMapper.findUserProjectByPage(condition, page,limit);
    }

    /**
     * 修改状态
     *
     * @param userProject
     * @return
     */
    @Override
    public int updateState(UserProject userProject) {
        return userProjectMapper.changeState(userProject);
    }

    /**
     * 查询用户订单列表记录数
     *
     * @param condition
     * @return
     */
    @Override
    public int findUserProjectRecord(Map<String, Object> condition) {
        return userProjectMapper.findUserProjectRecord(condition);
    }

    /**
     * 用户申请证书
     *
     * @param userProject
     * @return
     */
    @Override
    public List<UserProject> findUserProject(UserProject userProject) {
        return userProjectMapper.findUserProjectAll(userProject);

    }

    //处理支付宝支付请求，返回给客户端浏览器一个二维码扫描付款
    public String alipayTradePagePay(HttpServletRequest request , HttpServletResponse response, String id) throws Exception{
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(ProjectPayConfig.gatewayUrl, ProjectPayConfig.app_id, ProjectPayConfig.merchant_private_key, "json", ProjectPayConfig.charset, ProjectPayConfig.alipay_public_key, ProjectPayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(ProjectPayConfig.return_url);
        alipayRequest.setNotifyUrl(ProjectPayConfig.notify_url);

//        UserProject condition=new UserProject();
//        condition.setId(Long.parseLong(id));
//        UserProject userProject=userProjectMapper.findUserProjectAll(condition).get(0);
//        if (userProject.getStates().getParamName().equals("待付款") && userProject.getProjectInfo().getStates().getParamName().equals("已发布")){
//            //如果订单订单处于待付款，且项目处于发布状态
//        }
//        //商户订单号，商户网站订单系统中唯一订单号，必填
//        String out_trade_no = new String(userProject.getOrderNum().getBytes("ISO-8859-1"),"UTF-8");
//        request.setAttribute("WIDout_trade_no",out_trade_no);
//        //付款金额，必填
//        String total_amount = String.valueOf(userProject.getPayMoney());
//        request.setAttribute("WIDtotal_amount",String.valueOf(userProject.getPayMoney()));
//        //订单名称，必填
//        String subject = new String("承接项目保证金".getBytes("UTF-8"));
//        request.setAttribute("WIDsubject","承接项目保证金");


        String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("UTF-8"),"UTF-8");
        //付款金额，必填
        String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("UTF-8"),"UTF-8");
        //订单名称，必填
        String subject = new String(request.getParameter("WIDsubject").getBytes("UTF-8"),"UTF-8");
        //商品描述，可空
        System.out.println("拿到的商品信息"+subject);
        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        System.out.println(alipayRequest.getBizContent());
        //若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
        //alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
        //		+ "\"total_amount\":\""+ total_amount +"\","
        //		+ "\"subject\":\""+ subject +"\","
        //		+ "\"body\":\""+ body +"\","
        //		+ "\"timeout_express\":\"10m\","
        //		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        //输出
        request.getSession().setAttribute("session",result);
        return "project/UserPayPage";
    }

    /**
     * 退款
     * @param response
     * @param session
     * @throws IOException
     * @throws AlipayApiException
     */
    @Override
    public String refund(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws IOException, IOException, AlipayApiException {
        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
//        PrintWriter out = response.getWriter();
        //获得初始化的AlipayClient
        String msg="notExist";

        String out_trade_no =new String(request.getParameter("WIDout_trade_no").getBytes("UTF-8"),"UTF-8");
        //需要退款的金额，该金额不能大于订单金额，必填
        String refund_amount = new String(request.getParameter("WIDrefund_amount").getBytes("UTF-8"),"UTF-8");;

        UserProject condition=new UserProject();
        condition.setOrderNum(out_trade_no);
        UserProject userProject=userProjectMapper.findUserProjectAll(condition).get(0);
        if (userProject.getParamId()==49){
            AlipayClient alipayClient = new DefaultAlipayClient(ProjectPayConfig.gatewayUrl, ProjectPayConfig.app_id, ProjectPayConfig.merchant_private_key,
                    "json", ProjectPayConfig.charset, ProjectPayConfig.alipay_public_key, ProjectPayConfig.sign_type);
            //设置请求参数
            AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();
            //商户订单号，必填
            alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                    + "\"refund_amount\":\""+ refund_amount +"\"}");
            //部分退款
//                ,"+ "\"out_request_no\":\""+ out_request_no +"\"
            //请求
            String result = alipayClient.execute(alipayRequest).getBody();
            //输出
//        out.println(result);//以下写自己的订单退款代码
            request.getSession().setAttribute("session",result);
            msg=(String)JSONObject.parseObject(JSONObject.parseObject(result).get("alipay_trade_refund_response").toString()).get("msg");
            if (msg.equalsIgnoreCase("success")){
                UserProject newUserProject=new UserProject();
                newUserProject.setParamId(53);
                newUserProject.setOrderNum(out_trade_no);
                int n=userProjectMapper.changeState(newUserProject);
                if (n>0){
                    System.out.println("退款成功！");
                }else{
                    System.out.println("退款失败！");
                }

            }
        }
        //标识一次退款请求，同一笔交易多次退款需要保证唯一。如需部分退款，则此参数必传；不传该参数则代表全额退款
//        String out_request_no = new String(UUID.randomUUID().toString());
        // 字符转义很重要



        return msg.toUpperCase();
    }

    //处理用户付款成功后的异步回调业务代码
    public void notifyUrl(HttpServletRequest request)throws Exception{
        //获取支付宝POST过来反馈信息

        System.out.println("11111111111111111111111111111111异步回调");
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, ProjectPayConfig.alipay_public_key, ProjectPayConfig.charset, ProjectPayConfig.sign_type); //调用SDK验证签名

        //——请在这里编写您的程序（以下代码仅作参考）——

        /* 实际验证过程建议商户务必添加以下校验：
        1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
        2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
        3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
        4、验证app_id是否为该商户本身。
        */
        if(signVerified) {//验证成功
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");


            if(trade_status.equals("TRADE_FINISHED")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
            }else if (trade_status.equals("TRADE_SUCCESS")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //付款完成后，支付宝系统发送该交易状态通知
            }
            UserProject userProject=new UserProject();
            userProject.setOrderNum(out_trade_no);
            userProject.setParamId(49);
            int n=userProjectMapper.changeState(userProject);
            if (n>0){
                System.out.println("申请成功！");
            }else{
                System.out.println("申请失败！");
            }
            System.out.println("success");

        }else {//验证失败
            System.out.println("fail");

            //调试用，写文本函数记录程序运行情况是否正常
            //String sWord = AlipaySignature.getSignCheckContentV1(params);
            //ProjectPayConfig.logResult(sWord);
        }

        //——请在这里编写您的程序（以上代码仅作参考）——
    }

    //处理用户支付成功后的同步回调业务代码，用于给用户展示支付后的信息
    public String  returnUrl(HttpServletRequest request)throws Exception{
        //获取支付宝GET过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        System.out.println("我跳到这里了啊啊啊啊啊啊啊");
        boolean signVerified = AlipaySignature.rsaCheckV1(params, ProjectPayConfig.alipay_public_key, ProjectPayConfig.charset, ProjectPayConfig.sign_type); //调用SDK验证签名

        //——请在这里编写您的程序（以下代码仅作参考）——
        if(signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("UTF-8"),"UTF-8");


            String result = "trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount;
            request.getSession().setAttribute("session",result);
            UserProject userProject=new UserProject();
            userProject.setOrderNum(out_trade_no);
            userProject.setParamId(49);
            int n=userProjectMapper.changeState(userProject);
            if (n>0){


                System.out.println("申请成功！");
                Map<String,Object> parameterCondition=new HashMap<>();
                parameterCondition.put("paramType","项目订单状态");
                List<Parameter> parameters=parameterMapper.findParameter(parameterCondition);
                request.setAttribute("parameters",parameters);

            }else{
                System.out.println("申请失败！");
            }
            System.out.println("success");


            return "project/ProjectOfUser";
        }else {
            String result = "验签失败";
            request.getSession().setAttribute("session",result);
            return "project/FindProject";
        }
        //——请在这里编写您的程序（以上代码仅作参考）——
    }
}
