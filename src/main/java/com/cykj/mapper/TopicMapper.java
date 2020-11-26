package com.cykj.mapper;

import com.cykj.entity.Topic;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Mapper
@Repository
/**
 * 测试题
 */
public interface TopicMapper {
    public List<Topic> selectTopicsByUnitId(long unitId);
}
