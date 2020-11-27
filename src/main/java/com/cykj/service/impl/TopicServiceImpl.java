package com.cykj.service.impl;

import com.cykj.entity.Topic;
import com.cykj.mapper.TopicMapper;
import com.cykj.service.TopicService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TopicServiceImpl implements TopicService {
    @Resource
    private TopicMapper topicMapper;

    @Override
    public List<Topic> selectTopicsByUnitId(String unitId) {
        return topicMapper.selectTopicsByUnitId(Long.parseLong(unitId));
    }
}
