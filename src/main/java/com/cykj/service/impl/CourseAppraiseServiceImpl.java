package com.cykj.service.impl;

import com.cykj.mapper.CourseAppraiseMapper;
import com.cykj.service.CourseAppraiseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CourseAppraiseServiceImpl implements CourseAppraiseService {
    @Resource
    private CourseAppraiseMapper courseAppraiseMapper;

    @Override
    public List selectAppraiseByCourseId(String courseId,String page,String limit) {
        long cId = Long.parseLong(courseId);
        long pg = Long.parseLong(page);
        long lm = Long.parseLong(limit);
        // 对参数进行封装
        Map<String,Long> conditionMap = new HashMap();
        conditionMap.put("courseId",cId);
        conditionMap.put("page",(pg-1)*lm);
        conditionMap.put("limit",lm);
        return courseAppraiseMapper.selectAppraiseByCourseId(conditionMap);
    }

    @Override
    public List selectAppraiseByUnitId(String unitId,String page,String limit) {
        long uId = Long.parseLong(unitId);
        long pg = Long.parseLong(page);
        long lm = Long.parseLong(limit);
        // 对参数进行封装
        Map<String,Long> conditionMap = new HashMap();
        conditionMap.put("unitId",uId);
        conditionMap.put("page",(pg-1)*lm);
        conditionMap.put("limit",lm);
        return courseAppraiseMapper.selectAppraiseByUnitId(conditionMap);
    }

    @Override
    public int selectCountByCourseId(String courseId) {
        return courseAppraiseMapper.selectCountByCourseId(Long.parseLong(courseId));
    }

    @Override
    public int selectCountByUnitId(String unitId) {
        return courseAppraiseMapper.selectCountByUnitId(Long.parseLong(unitId));
    }

    @Override
    public long selectCourseIdByUnitId(String unitId) {
        return courseAppraiseMapper.selectCourseIdByUnitId(Long.parseLong(unitId));
    }

    @Override
    public String addAppraise(long courseId, String userId, String appraiseText, String appraiseTime) {
        Map<String,Object> map = new HashMap<>();
        map.put("courseId",courseId);
        map.put("userId",Long.parseLong(userId));
        map.put("appraiseText",appraiseText);
        map.put("appraiseTime",appraiseTime);
        return courseAppraiseMapper.addAppraise(map);
    }
}
