package com.cykj.service;

import com.cykj.entity.StudyData;
import com.cykj.entity.TableInfo;
import com.cykj.entity.Unit;

import java.util.List;
import java.util.Map;

public interface UnitService {
    public TableInfo findCourse(Integer page,Integer limit,String unitName);
    public int deleteCourse(Integer unitId);
    public int updateUnitName(String unitName,Integer unitId);//更改章节名字
    public int selectunitName(Integer unitId);//查找框 根据ID查 上一章 课程名称

    public List<Unit> selectUnitsByCourseId(String courseId);
    public List<StudyData> selectUnitFileByUnitId(String unitId);
    public List<Unit> selectUnitsByUnitId(String unitId);
    public Unit selectUnitInfoByUnitId(String unitId);






}
