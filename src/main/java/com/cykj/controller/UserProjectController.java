package com.cykj.controller;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.aliyuncs.utils.StringUtils;
import com.cykj.entity.*;
import com.cykj.service.ParameterService;
import com.cykj.service.ProjectService;
import com.cykj.service.UserProjectService;
import com.cykj.util.ProjectMpp;
import com.cykj.util.TableInfo;
import com.cykj.util.TaskInfo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.sf.mpxj.*;
import net.sf.mpxj.mpp.MPPReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/userProject")
public class UserProjectController {

    @Resource
    UserProjectService userProjectServiceImpl;

    @Resource
    ProjectService projectServiceImpl;

    @Resource
    ParameterService parameterServiceImpl;

    @RequestMapping("/projectOfUser")
    public String goProjectOfUser(HttpServletRequest request){
        Map<String,Object> parameterCondition=new HashMap<>();
        parameterCondition.put("paramType","项目订单状态");
        List<Parameter> parameters=parameterServiceImpl.findParameter(parameterCondition);
        request.setAttribute("parameters",parameters);
        return "project/ProjectOfUser";
    }


    /**
     * 用户申请项目，添加订单（未付款）状态。
     *  @param request
     * @param userProject
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping("/addUserProject")
    public @ResponseBody String addUserProject(HttpServletRequest request,UserProject userProject) throws JsonProcessingException {
        String  msg=null;
        System.out.println(userProject.getProjectId() +"   "+ userProject.getPayMoney());
        UserInfo userInfo=(UserInfo) request.getSession().getAttribute("qUser");
        if (userInfo!=null){
            userProject.setUserId(userInfo.getUserId());
        }else{
            userProject.setUserId(1);
        }

        Map<String,Object> condition=new HashMap<>();
        condition.put("paramType","费用");
        condition.put("paramName","保证金");
        Parameter moneyRate=parameterServiceImpl.findParameter(condition).get(0);
        long money=(long)(userProject.getPayMoney()*Integer.parseInt(moneyRate.getParamValues().trim())/100.0);
        System.out.println(money);
        userProject.setPayMoney(money);
        UserProject userProject2=userProjectServiceImpl.addUserProject(userProject);
        return new ObjectMapper().writeValueAsString(userProject2);
    }

    /**
     * 查询
     * @param request
     * @param page
     * @param limit
     * @param orderNum
     * @param stateId
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping("/findUserProject")
    public @ResponseBody String findUserProject(HttpServletRequest request,String page,String limit,String orderNum,String stateId) throws JsonProcessingException {
        int pageNum=Integer.parseInt(page);
        int limitNum=Integer.parseInt(limit);
        Map<String,Object> condition=new HashMap<>();
        UserInfo userInfo=(UserInfo) request.getSession().getAttribute("qUser");
        if (userInfo!=null){
            condition.put("userId",userInfo.getUserId());
        }else{
            condition.put("userId","1");
        }
        if (orderNum!=null && !orderNum.trim().equals("")){
            condition.put("orderNum",orderNum);
        }
        if (orderNum!=null && !orderNum.trim().equals("")){
            condition.put("orderNum",orderNum);
        }
        if (stateId!=null && !stateId.trim().equals("")){
            condition.put("stateId",stateId);
        }
        List<UserProject> userProjects=userProjectServiceImpl.findUserProjectByPage(condition,(pageNum-1)*limitNum,limitNum);
        TableInfo tableInfo=new TableInfo();
        tableInfo.setCount(userProjectServiceImpl.findUserProjectRecord(condition));
        tableInfo.setData(userProjects);
        return new ObjectMapper().writeValueAsString(tableInfo);
    }

    /**
     *发布项目、生成订单
     * @param request
     * @param userProject
     * @return
     */
    @RequestMapping("/del")
    public @ResponseBody String delOrder(HttpServletRequest request ,UserProject userProject) throws JsonProcessingException {
        String msg="";
        int n=userProjectServiceImpl.updateState(userProject);
        if (n>0){
            msg="success";
            System.out.println("删除成功！！！！！！");
        }
        return msg;
    }


    @RequestMapping("/updateUrl")
    public @ResponseBody String updateUrl(HttpServletRequest request,ProjectInfo projectInfo){
        String msg="";
        System.out.println("2222222222222222");
        projectInfo.setStateId(37);
        int n=projectServiceImpl.updateState(projectInfo);
        if (n>0){
            msg="success";
        }
        return msg;
    }

    @RequestMapping("/userExit")
    public @ResponseBody String userExit(HttpServletRequest request,ProjectInfo projectInfo){
        UserInfo userInfo=(UserInfo) request.getSession().getAttribute("qUser");
        if (userInfo!=null){
            request.getSession().removeAttribute("qUser");
        }
        return "success";
    }





    //支付成功后的异步回调，用于处理服务端业务
    @RequestMapping("/notifyUrl")
    public void notifyUrl(HttpServletRequest request)throws Exception{
        System.out.println("异步回调");
        userProjectServiceImpl.notifyUrl(request);
    }

    //支付成功后同步回调，用于展示给用户查看
    @RequestMapping("/returnUrl")
    public String returnUrl(HttpServletRequest request)throws Exception{
        System.out.println("同步回调");
        return userProjectServiceImpl.returnUrl(request);
    }

    //用户点击付款后请求此方法
    @RequestMapping("/alipayTradePagePay")
    public String alipayTradePagePay(HttpServletRequest request, HttpServletResponse response,String id) throws Exception{
        return userProjectServiceImpl.alipayTradePagePay(request,response,id);
    }
    //用户点击付款后请求此方法
    @RequestMapping("/refund")
    public @ResponseBody String refund(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws IOException, AlipayApiException {
         return userProjectServiceImpl.refund(request,response,session);
    }

    /**
     *
     * @return
     */
    @RequestMapping("/uploadMppFile")
    public @ResponseBody String readFile(@RequestParam("file") MultipartFile mppFile , HttpServletRequest request, String projectId){
//        1获取上传的目录路径
        String path = request.getSession().getServletContext().getRealPath("/uploadDemand");
        //2以天为单位创建文件夹
        String date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
//        3创建目录
        File file=new File(path,date);
        if (!file.exists()){
            file.mkdirs();
        }
//        4文件上传
        TableInfo tableInfo=new TableInfo();
        JSONObject json=new JSONObject();
//        4.1获取原始文件名
        String fileName=mppFile.getOriginalFilename();
        if (fileName!=null){
            fileName= UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
            System.out.println(UUID.randomUUID().toString());
            try {
//               4.2文件上传
                mppFile.transferTo(new File(file,fileName));
                json.put("code",0);
                json.put("msg","success");
                JSONObject data=new JSONObject();
                data.put("docUrl","/uploadDemand/"+date+"/"+fileName);
                json.put("data",data);
                System.out.println("/uploadDemand/"+date+"/"+fileName);
                tableInfo.setCode(0);
                tableInfo.setMsg("success");
            } catch (IOException e) {
                e.printStackTrace();
//                tableInfo.setCode(1);
//                tableInfo.setMsg("failed");
                json.put("code",1);
                json.put("msg","failed");
                json.put("data","");
            }
        }
        List<TaskInfo> taskList = new ArrayList<TaskInfo>();
        try{
            File newMppFile = new File(file,fileName);
            MPPReader mppRead = new MPPReader();
            ProjectFile pf = mppRead.read(newMppFile);
            System.out.println("MPXJUtils.method [readFile]: fileName-" + newMppFile.getName());

            List<Task> tasks = pf.getAllTasks();
            System.out.println("MPXJUtils.method [readFile]: taskSize-" + tasks.size());

            for (int i = 0; i < tasks.size(); i++) {
                Task task = tasks.get(i);
                Integer task_id = task.getID();
                Integer task_unique_id = task.getUniqueID();
                Integer task_outline_level = task.getOutlineLevel();
                double task_duration = task.getDuration().getDuration();
                Date task_start_date = task.getStart();
                Date task_finish_date = task.getFinish();
                String task_name=task.getName();
                List<Relation> task_predecessors = task.getPredecessors();
                System.out.println("MPXJUtils.method [readFile] taskInfo:" + task_id + "|" + task_unique_id + "|" + task_outline_level + "|" + task_duration + "|" + task_start_date + "|" + task_finish_date + "|" + task_predecessors);

                // 封装TaskInfo
                java.sql.Date sqlStartDate=new java.sql.Date(task_start_date.getTime());
                java.sql.Date sqlFinishDate = new java.sql.Date(task_finish_date.getTime());
                // FinishDate转换
                StringBuffer sb = new StringBuffer();
                if(task_predecessors != null){
                    if(task_predecessors.size() > 0){
                        for(Relation relation : task_predecessors){
                            Integer targetTaskId = relation.getTargetTask().getID();
                            if(sb.length() == 0){
                                sb.append(targetTaskId);
                            }else{
                                sb.append(","+targetTaskId);
                            }
                        }
                    }
                }
                String task_predecessors_str = sb.toString();                                           // 任务流文本
                TaskInfo taskInfo = new TaskInfo();
                taskInfo.setProject_id(55);
                taskInfo.setTask_id(task_id);
                taskInfo.setTask_unique_id(task_unique_id);
                taskInfo.setTask_outline_level(task_outline_level);
                taskInfo.setTask_duration(task_duration);
                taskInfo.setTask_start_date(sqlStartDate);
                taskInfo.setTask_finish_date(sqlFinishDate);
                taskInfo.setTask_name(task_name);
                taskInfo.setTask_predecessors(task_predecessors_str);
                taskList.add(taskInfo);
            }
        }catch (MPXJException e) {
            System.out.println("MPXJUtils.method [readFile]: MPXJException-" + e);
            return null;
        } catch (Exception e) {
            System.out.println("MPXJUtils.method [readFile]: MPXJException-" + e);
            return null;
        }
        List<TaskInfo> taskLists=refreshTaskInfo(taskList);
        userProjectServiceImpl.addProjectMpp(taskLists);
        return json.toString();
    }


    public  List<TaskInfo> refreshTaskInfo(List<TaskInfo> taskList){

        List<Map<String,Integer>> tempTaskOutLine = new ArrayList<Map<String,Integer>>();
        for(TaskInfo taskInfo : taskList){

            int taskId = taskInfo.getTask_id();
            int taskOutLineLevel = taskInfo.getTask_outline_level();
            int listSize = tempTaskOutLine.size();
            System.out.println("MPXJUtils.method [refreshTaskInfo1]: taskId-" + taskId + ",taskOutLineLevel-" + taskOutLineLevel + ",listSize-" + listSize);
            // 初始化taskOutLineLevel
            if(listSize > 2){
                if(taskOutLineLevel == 1){
                    for(int i=listSize;i>2;i--){
                        tempTaskOutLine.remove(i-1);
                    }
                    listSize = 2;
                    System.out.println("MPXJUtils.method [refreshTaskInfo2]: taskId-" + taskId + ",taskOutLineLevel-" + taskOutLineLevel + ",listSize-" + listSize);
                }
            }
            Map<String,Integer> map = new HashMap<String,Integer>();
            map.put("taskId", taskId);
            map.put("taskOutLineLevel", taskOutLineLevel);

            if(listSize == 0){

                if(taskOutLineLevel == 0){
                    tempTaskOutLine.add(map);
                }else{
                    return null;
                }

            }else{

                Map<String,Integer> lastMap = tempTaskOutLine.get(listSize-1);
                int lastTaskId = lastMap.get("taskId");
                int lastTaskOutLineLevel = lastMap.get("taskOutLineLevel");

                if(taskOutLineLevel > lastTaskOutLineLevel){

                    tempTaskOutLine.add(map);
                    taskInfo.setParent_id(lastTaskId);
                }else if(taskOutLineLevel == lastTaskOutLineLevel){

                    tempTaskOutLine.set(taskOutLineLevel, map);

                    Map<String,Integer> lastMap1 = tempTaskOutLine.get(taskOutLineLevel-1);
                    int lastTaskId1 = lastMap1.get("taskId");
                    taskInfo.setParent_id(lastTaskId1);
                }else if(taskOutLineLevel < lastTaskOutLineLevel){
                    tempTaskOutLine.set(taskOutLineLevel, map);
                    Map<String,Integer> lastMap2 = tempTaskOutLine.get(taskOutLineLevel-1);
                    int lastTaskId2 = lastMap2.get("taskId");
                    taskInfo.setParent_id(lastTaskId2);
                }
            }
        }
        return taskList;
    }
}
