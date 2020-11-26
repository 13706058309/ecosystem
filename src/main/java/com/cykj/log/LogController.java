package com.cykj.log;

import com.cykj.entity.BackLog;
import com.cykj.entity.PageBean;
import com.cykj.entity.TableInfo;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/log")
public class LogController {

    @Resource
    private LogService logServiceImpI;
//
    @RequestMapping("/logPage")
    @Loger(operationType="后端日志",operationName="后端日志")
    public String logPage() {
        return "BackLog";
    }
    //后端日志管理
    @RequestMapping(value = "/bLog", produces = "text/html;charset=UTF-8")
//    @Loger(operationType="后端日志管理",operationName="后端日志管理")
    public @ResponseBody
    String bLog(PageBean pages,String bUserName) {
        Map<String, Object> map = new HashMap<>();
        if (bUserName != null) {
            map.put("bUserName", bUserName);
        } else {
            map.put("bUserName", "");
        }
        if (pages.getEndTime() != null && pages.getEndTime().length() != 0) {
            map.put("endTime", pages.getEndTime());
        }
        if (pages.getBeginTime() != null && pages.getBeginTime().length() != 0) {
            map.put("startTime", pages.getBeginTime());
        }

        List<BackLog> list = logServiceImpI.findLogOnPage(map, pages.getPage(), pages.getLimit());
        int all = logServiceImpI.findLogNum(map);
        TableInfo tableInfo = new TableInfo(0, "用户信息数据", all, list);
        return new Gson().toJson(tableInfo);
    }


}
