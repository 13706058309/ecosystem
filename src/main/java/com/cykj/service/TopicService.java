package com.cykj.service;

import com.cykj.entity.Topic;

import java.util.List;

public interface TopicService {
    public List<Topic> selectTopicsByUnitId(String unitId);
}
