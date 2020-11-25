package com.cykj.service.impl;

import com.cykj.entity.Course;
import com.cykj.entity.TableInfo;
import com.cykj.entity.Unit;
import com.cykj.mapper.CourseMapper;
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
//    @Override//新增课程
//    public int insertCourse(String courseName, Integer fieldId, String courseImgURL, String speakerName, String courseIntroduce, String collectionNumber, String speakerHeadImgUrl, String totalPlayTimes) {
//        System.out.println("CourseServiceImpl里的值为："+"courseName:"+courseName+"；fileId:"+fieldId+"；courseImgURL:"+courseImgURL
//                +"；speakerName:"+speakerName+"；courseIntroduce:"+courseIntroduce +"；collectionNumber:"
//                +collectionNumber+"；speakerHeadImgUrl:"+speakerHeadImgUrl+"；totalPlayTimes:"+totalPlayTimes);
//        int insertCourse = courseMapper.insertCourse(courseName,fieldId,courseImgURL,speakerName,
//                courseIntroduce,collectionNumber,speakerHeadImgUrl,totalPlayTimes);
//        return insertCourse;
//    }

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
}
