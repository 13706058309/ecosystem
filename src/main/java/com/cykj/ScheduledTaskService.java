package com.cykj;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class ScheduledTaskService {
    private static final SimpleDateFormat dataFormat = new SimpleDateFormat("HH:mm:ss");

    @Scheduled(fixedRate = 5000)        //通过@Scheduled声明该方法是一个计划任务，fixedRate属性则指示了每隔固定事件执行(单位：ms)
    public void reportCurrentTime(){
        System.out.println("每隔五秒执行一次 "+dataFormat.format(new Date()));
    }

    @Scheduled(cron = "00 03 20 ? * *") //使用corn属性可按照指定时间执行，此处是指于每天的21：53分执行
    public void fixTimeExecution(){
        System.out.println("在指定时间 " + dataFormat.format(new Date()) + "执行");
    }
}

