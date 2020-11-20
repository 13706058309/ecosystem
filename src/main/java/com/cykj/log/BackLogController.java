package com.cykj.log;

import com.cykj.entity.BackLog;
import com.cykj.entity.Pages;
import com.cykj.entity.TableInfo;
import com.cykj.service.BackUserService;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.print.attribute.standard.PagesPerMinute;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/backLog")
public class BackLogController {

    @Resource
    private BackLogService backLogService;


    @RequestMapping("/logPage")
    @Loger(operationName = "跳转后端页面")
    public String backLogPage(){
        return "log/BackLog";
    }


     @RequestMapping("/findLog")
     @Loger(operationName = "获取信息")
    public @ResponseBody String findLog(Pages pages){

         Map<String,Object> map = new HashMap<>();

         if (pages.getbUserName() != null){
             map.put("bUserName",pages.getbUserName());
         } else {
             map.put("bUserName","");
         }
         if (pages.getEndTime() != null&&pages.getEndTime().length() !=0){
             map.put("endTime",pages.getEndTime());
         }
         if (pages.getBeginTime() != null&&pages.getBeginTime().length() !=0){
             map.put("begin",pages.getBeginTime());
         }
         List<BackLog> list = backLogService.findLogOnPage(map,pages.getPage(),pages.getLimit());
         int all = backLogService.findLogNum(map);
         TableInfo tableInfo = new TableInfo(0,"用户数据信息",all,list);

        return new Gson().toJson(tableInfo);
     }


}
