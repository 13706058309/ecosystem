package com.cykj.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.cykj.entity.ProjectInfo;
import com.cykj.entity.UserProject;
import com.cykj.mapper.ProjectInfoMapper;
import com.cykj.mapper.UserProjectMapper;
import com.cykj.service.ProjectService;
import com.cykj.util.MProjectPayConfig;
import com.cykj.util.ProjectPayConfig;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Resource
    ProjectInfoMapper projectInfoMapper;
    @Resource
    UserProjectMapper userProjectMapper;

    @Override
    public int updateState(ProjectInfo projectInfo) {
        return projectInfoMapper.updateProject(projectInfo);
    }

    /**
     * 查询所有企业发布的项目
     *
     * @param condition
     * @param page
     * @param limit
     * @return
     */
    @Override
    public List<ProjectInfo> findProjectAll(Map<String, Object> condition, int page, int limit) {
        return projectInfoMapper.findProjectAll(condition, page, limit);
    }

    /**
     * 查询记录数
     *
     * @param condition
     * @return
     */
    @Override
    public int findRecords(Map<String, Object> condition) {
        return projectInfoMapper.findRecords(condition);
    }

    /**
     * 查询项目
     *
     * @param projectInfo
     * @return
     */
    @Override
    public ProjectInfo findProject(ProjectInfo projectInfo) {
        return projectInfoMapper.findProject(projectInfo);
    }

    /**
     * 添加项目
     *
     * @param projectInfo
     * @return
     */
    @Override
    public ProjectInfo addProject(ProjectInfo projectInfo) {
        ProjectInfo res=null;
        int n=projectInfoMapper.addProject(projectInfo);
        if (n>0){
            res=projectInfoMapper.findProject(projectInfo);
        }
        return res;
    }

    //处理支付宝支付请求，返回给客户端浏览器一个二维码扫描付款
    public String alipayTradePagePay(HttpServletRequest request , HttpServletResponse response) throws Exception{
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(MProjectPayConfig.gatewayUrl, MProjectPayConfig.app_id, MProjectPayConfig.merchant_private_key, "json", MProjectPayConfig.charset, MProjectPayConfig.alipay_public_key, MProjectPayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(MProjectPayConfig.return_url);
        alipayRequest.setNotifyUrl(MProjectPayConfig.notify_url);

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
        return "project/MUserPayPage";
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

        ProjectInfo condition=new ProjectInfo();
        condition.setpOrderNum(out_trade_no);
        ProjectInfo projectInfo=projectInfoMapper.findProject(condition);
        if (projectInfo.getStates().getParamId()==35){
            AlipayClient alipayClient = new DefaultAlipayClient(MProjectPayConfig.gatewayUrl, MProjectPayConfig.app_id, MProjectPayConfig.merchant_private_key,
                    "json", MProjectPayConfig.charset, MProjectPayConfig.alipay_public_key, MProjectPayConfig.sign_type);
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
            msg=(String) JSONObject.parseObject(JSONObject.parseObject(result).get("alipay_trade_refund_response").toString()).get("msg");
            if (msg.equalsIgnoreCase("success")){
                ProjectInfo condition_two=new ProjectInfo();
                condition_two.setProjectId(projectInfo.getProjectId());
                condition_two.setStateId(41);
                int n=projectInfoMapper.updateProject(condition_two);
                if (n>0){
                    System.out.println("===============================================退款成功！========================================");
//                    企业退款成功！
//                    申请人退款

                  UserProject condition_find=new UserProject();
                  condition_find.setProjectId(projectInfo.getProjectId());

                  List<UserProject> userProjects=userProjectMapper.findUserProjectAll(condition_find);
                  if (userProjects !=null){
                      for (int i=0;i<userProjects.size();i++){
                          if (userProjects.get(i).getParamId()==48){
                              //对“待付款”的订单进行申请失败处理
                              UserProject condition_change=new UserProject();
                              condition_change.setParamId(53);
                              condition_change.setOrderNum(userProjects.get(i).getOrderNum());
                              int res=userProjectMapper.changeState(condition_change);
                              if (res>0){
                                  System.out.println("====================================待付款→申请失败。修改成功！===========================");
                              }else{
                                  System.out.println("====================================待付款→申请失败。修改失败！============================");
                              }
                          }else if (userProjects.get(i).getParamId()==49){
                              //对已申请的订单进行终止处理并退款
                              String out_trade_no_user =new String((userProjects.get(i).getOrderNum()).getBytes("UTF-8"),"UTF-8");
                              //需要退款的金额，该金额不能大于订单金额，必填
                              String refund_amount_user = new String((userProjects.get(i).getPayMoney()+"").getBytes("UTF-8"),"UTF-8");
                                  AlipayClient alipayClient_user = new DefaultAlipayClient(ProjectPayConfig.gatewayUrl, ProjectPayConfig.app_id, ProjectPayConfig.merchant_private_key,
                                          "json", ProjectPayConfig.charset, ProjectPayConfig.alipay_public_key, ProjectPayConfig.sign_type);
                                  //设置请求参数
                                  AlipayTradeRefundRequest alipayRequest_user = new AlipayTradeRefundRequest();
                                  //商户订单号，必填
                                  alipayRequest_user.setBizContent("{\"out_trade_no\":\""+ out_trade_no_user +"\","
                                          + "\"refund_amount\":\""+ refund_amount_user +"\"}");
                                  //请求
                                  String result_user = alipayClient_user.execute(alipayRequest_user).getBody();
                                  //输出
//                                out.println(result);//以下写自己的订单退款代码
                                  request.getSession().setAttribute("session_user",result_user);
                                  msg=(String)JSONObject.parseObject(JSONObject.parseObject(result_user).get("alipay_trade_refund_response").toString()).get("msg");
                                  if (msg.equalsIgnoreCase("success")){
                                      UserProject newUserProject=new UserProject();
                                      newUserProject.setParamId(51);
                                      newUserProject.setOrderNum(out_trade_no_user);
                                      int n_user=userProjectMapper.changeState(newUserProject);
                                      if (n_user>0){
                                          System.out.println("==========================================用户退款成功！============================");
                                      }else{
                                          System.out.println("===========================================用户退款失败！==========================================");
                                      }
                                  }

                          }
                      }
                  }
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

        boolean signVerified = AlipaySignature.rsaCheckV1(params, MProjectPayConfig.alipay_public_key, MProjectPayConfig.charset, MProjectPayConfig.sign_type); //调用SDK验证签名

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
            ProjectInfo projectInfo=new ProjectInfo();
            projectInfo.setpOrderNum(out_trade_no);
            projectInfo.setStateId(35);
            int n=projectInfoMapper.updateProject(projectInfo);
            if (n>0){
                System.out.println("发布成功！");
            }else{
                System.out.println("发布失败！");
            }
            System.out.println("success");

        }else {//验证失败
            System.out.println("fail");

            //调试用，写文本函数记录程序运行情况是否正常
            //String sWord = AlipaySignature.getSignCheckContentV1(params);
            //MProjectPayConfig.logResult(sWord);
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
        boolean signVerified = AlipaySignature.rsaCheckV1(params, MProjectPayConfig.alipay_public_key, MProjectPayConfig.charset, MProjectPayConfig.sign_type); //调用SDK验证签名

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
            ProjectInfo projectInfo=new ProjectInfo();
            projectInfo.setpOrderNum(out_trade_no);
            projectInfo.setStateId(35);
            int n=projectInfoMapper.updateProject(projectInfo);
            if (n>0){
                System.out.println("发布成功！");
            }else{
                System.out.println("发布失败！");
            }
            System.out.println("success");


            return "BackMain";
        }else {
            String result = "验签失败";
            request.getSession().setAttribute("session",result);
            return "BackMain";
        }
        //——请在这里编写您的程序（以上代码仅作参考）——
    }
}
