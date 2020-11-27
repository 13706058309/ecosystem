package com.cykj.mapper;


import com.cykj.entity.CourseCollect;
import com.cykj.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository
/**
 * 课程收藏
 */
public interface CourseCollectMapper {
    public CourseCollect isCollectedByCourseIdAndUserId(Map parameterMap);
    public int addCollectionByCourseIdAndUserId(Map parameterMap);
    public int deleteCollectionByCourseIdAndUserId(Map parameterMap);
}
