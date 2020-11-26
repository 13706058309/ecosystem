package com.cykj.mapper;

import com.cykj.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 * 章节评论
 */
public interface CourseAppraiseMapper {
    public List selectAppraiseByCourseId(Map conditionMap);
    public List selectAppraiseByUnitId(Map conditionMap);
    public int selectCountByCourseId(long courseId);
    public int selectCountByUnitId(long unitId);
    public long selectCourseIdByUnitId(long unitId);
    public String addAppraise(Map map);
}
