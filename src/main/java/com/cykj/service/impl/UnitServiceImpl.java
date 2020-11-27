package com.cykj.service.impl;

import com.cykj.entity.Course;
import com.cykj.entity.TableInfo;
import com.cykj.entity.Unit;
import com.cykj.mapper.CourseMapper;
import com.cykj.entity.StudyData;
import com.cykj.entity.Unit;
import com.cykj.mapper.UnitMapper;
import com.cykj.service.UnitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UnitServiceImpl implements UnitService {
        @Resource
        private UnitMapper unitMapper;
    @Override
    public TableInfo findCourse(Integer page,Integer limit,String unitName) {

        Map<String,Object> map = new HashMap<>();
        if (unitName != null && !unitName.equals("null")){
            map.put("unitName",unitName);
            System.out.println("map有值，值为："+map);
        }else {
            map.put("unitName","");
        }

        map.put("limit",limit);
        map.put("offset",(page - 1) * limit);
        System.out.println("UnitServiceImpl里map的值为："+map);
        List<Unit> allOnPage = unitMapper.findUnitOnPage(map);
        int numOnPage = unitMapper.findNumOnPage(map);
        TableInfo tableInfo = new TableInfo(0,"后台章节信息数据",numOnPage,allOnPage);
        return tableInfo;
    }

    @Override
    public int deleteCourse(Integer unitId) {
        int course = unitMapper.deleteUnit(unitId);
        return  course;
    }
//

    @Override//更改课程名字
    public int updateUnitName(String unitName,Integer unitId) {
        System.out.println("UnitServiceImpl里map的值为："+unitName+unitId);
        int updateunitName = unitMapper.updateunitName(unitName,unitId);
        return updateunitName;
    }


    @Override//查看框 寻找上一章节 名字
    public int selectunitName(Integer unitId) {
        System.out.println("UnitServiceImpl里map的值为："+unitId);
        int updateunitName = unitMapper.selectunitName(unitId);
        return updateunitName;
    }

    @Override
    public List<Unit> selectUnitsByCourseId(String courseId) {
        return unitMapper.selectUnitsByCourseId(Long.parseLong(courseId));
    }

    @Override
    public List<StudyData> selectUnitFileByUnitId(String unitId){
        return unitMapper.selectUnitFileByUnitId(Long.parseLong(unitId));
    }

    @Override
    public List<Unit> selectUnitsByUnitId(String unitId){
        return unitMapper.selectUnitsByUnitId(Long.parseLong(unitId));
    }

    @Override
    public Unit selectUnitInfoByUnitId(String unitId) {
        return unitMapper.selectUnitInfoByUnitId(Long.parseLong(unitId));
    }


}
