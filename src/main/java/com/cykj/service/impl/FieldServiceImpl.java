package com.cykj.service.impl;

import com.cykj.entity.TableInfo;
import com.cykj.entity.Unit;
import com.cykj.mapper.FieldMapper;
import com.cykj.mapper.UnitMapper;
import com.cykj.service.FieldService;
import com.cykj.service.UnitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FieldServiceImpl implements FieldService {
        @Resource
        private FieldMapper fieldMapper;
    @Override
    public TableInfo findField(Integer page,Integer limit,String fieldName) {

        Map<String,Object> map = new HashMap<>();
        if (fieldName != null && !fieldName.equals("null")){
            map.put("fieldName",fieldName);
            System.out.println("map有值，值为："+map);
        }else {
            map.put("fieldName","");
        }

        map.put("limit",limit);
        map.put("offset",(page - 1) * limit);
        System.out.println("FieldServiceImpl里map的值为："+map);
        List<Unit> allOnPage = fieldMapper.findFieldOnPage(map);
        int numOnPage = fieldMapper.findNumOnPage(map);
        TableInfo tableInfo = new TableInfo(0,"后台领域信息数据",numOnPage,allOnPage);
        return tableInfo;
    }

    @Override
    public int deleteField(Integer fieldId) {
        int field = fieldMapper.deleteField(fieldId);
        return  field;
    }
////
//
//    @Override//更改课程名字
//    public int updateUnitName(String unitName,Integer unitId) {
//        System.out.println("UnitServiceImpl里map的值为："+unitName+unitId);
//        int updateunitName = unitMapper.updateunitName(unitName,unitId);
//        return updateunitName;
//    }
//
//
//    @Override//查看框 寻找上一章节 名字
//    public int selectunitName(Integer unitId) {
//        System.out.println("UnitServiceImpl里map的值为："+unitId);
//        int updateunitName = unitMapper.selectunitName(unitId);
//        return updateunitName;
//    }
//
//    @Override//更改路径
//    public int updatecourseImgURL(String courseImgURL, Integer courseId) {
//        System.out.println("CourseServiceImpl里map的值为："+courseImgURL+courseId);
//        int updatecourseImgURL = courseMapper.updatecourseImgURL(courseImgURL,courseId);
//        return updatecourseImgURL;
//    }
//
//    @Override//更改课程介绍
//    public int updatecourseIntroduce(String courseIntroduce, Integer courseId) {
//        System.out.println("CourseServiceImpl里map的值为："+courseIntroduce+courseId);
//        int updateCourseIntroduce = courseMapper.updatecourseIntroduce(courseIntroduce,courseId);
//        return updateCourseIntroduce;
//    }
//
//    @Override//更改头像路径
//    public int updatespeakerHeadImgUrl(String speakerHeadImgUrl, Integer courseId) {
//        System.out.println("CourseServiceImpl里map的值为："+speakerHeadImgUrl+courseId);
//        int updateSpeakerHeadImgUrl = courseMapper.updatespeakerHeadImgUrl(speakerHeadImgUrl,courseId);
//        return updateSpeakerHeadImgUrl;
//    }
//
    @Override//新增课程
    public int insertField(String fieldName) {
        System.out.println("FieldServiceImpl里的值为："+"fieldName:"+fieldName);
        int insertField = fieldMapper.insertField(fieldName);
        return insertField;
    }

//    @Resource
//    private CourseMapper courseMapper;
//    @Override
//    public List<Course> findCourse() {
//        System.out.println("已经走到了CourseServiceImpl! 显示列表方法");
//        return courseMapper.findCourse();
//    }
//
//    @Override
//    public List<Course> search(String courseName) {
//        System.out.println("已经走到了CourseServiceImpl! 搜索按钮监听");
//        System.out.println("CourseServiceImpl里的courseName值为："+courseName);
//        return courseMapper.search(courseName);
//    }
import com.cykj.entity.Field;
import com.cykj.mapper.FieldMapper;
import com.cykj.service.FieldService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FieldServiceImpl implements FieldService {
    @Resource
    FieldMapper fieldMapper;

    @Override
    public List<Field> selectAllFieldName() {
        return fieldMapper.selectAllFieldName();
    }
}
