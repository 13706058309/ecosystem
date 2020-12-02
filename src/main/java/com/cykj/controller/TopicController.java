package com.cykj.controller;

import com.cykj.entity.Topic;
import com.cykj.service.TopicService;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/topic")
public class TopicController {
    @Resource
    private TopicService topicServiceImpl;

    /**
     * 查询当前播放章节下的测试题
     * @param response 响应对象
     * @param unitId 当前播放章节Id
     */
    @RequestMapping("/loadTopics")
    public void loadTopicsByUnitId(HttpServletResponse response, String unitId){
        //根据章节ID查询题目列表
        List<Topic> topics = topicServiceImpl.selectTopicsByUnitId(unitId);
        String jsonTopics = new Gson().toJson(topics);
        //将测试题列表响应给前端
        try {
            response.getWriter().write(jsonTopics);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
