package com.cykj.service;

import java.util.List;
import java.util.Map;

public interface CourseAppraiseService {
    public List selectAppraiseByCourseId(String courseId,String page,String limit);
    public List selectAppraiseByUnitId(String unitId,String page,String limit);
    public int selectCountByCourseId(String courseId);
    public int selectCountByUnitId(String unitId);

    public long selectCourseIdByUnitId(String unitId);
    public String addAppraise(long courseId,String userId,String appraiseText,String appraiseTime);
}
