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

    @RequestMapping("/loadTopics")
    public void loadTopicsByUnitId(HttpServletResponse response, String unitId){
        List<Topic> topics = topicServiceImpl.selectTopicsByUnitId(unitId);
        String jsonTopics = new Gson().toJson(topics);

        try {
            response.getWriter().write(jsonTopics);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
