package com.cykj.service.impl;

import com.cykj.entity.Course;
import com.cykj.entity.TableInfo;
import com.cykj.mapper.CourseMapper;
import com.cykj.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class CourseServiceImpl implements CourseService {
        @Resource
    private CourseMapper courseMapper;
    @Override
    public TableInfo findCourse(Map<String, Object> map, Integer page, Integer limit) {
        map.put("limit",limit);
        map.put("offset",(page - 1) * limit);
        System.out.println("CourseServiceImpl里map的值为："+map);
        List<Course> allOnPage = courseMapper.findCourseOnPage(map);
        int numOnPage = courseMapper.findNumOnPage(map);
        TableInfo tableInfo = new TableInfo(0,"后台用户信息数据",numOnPage,allOnPage);
        return tableInfo;
    }

    @Override
    public int deleteCourse(Integer courseId) {
        int course = courseMapper.deleteCourse(courseId);
        return  course;
    }

    @Override//更改课程名字
    public int updateCourseName(String courseName,Integer courseId) {
        System.out.println("CourseServiceImpl里map的值为："+courseName+courseId);
        int updateCourseName = courseMapper.updateCourseName(courseName,courseId);
        return updateCourseName;
    }

    @Override//更改路径
    public int updatecourseImgURL(String courseImgURL, Integer courseId) {
        System.out.println("CourseServiceImpl里map的值为："+courseImgURL+courseId);
        int updatecourseImgURL = courseMapper.updatecourseImgURL(courseImgURL,courseId);
        return updatecourseImgURL;
    }

    @Override//更改课程介绍
    public int updatecourseIntroduce(String courseIntroduce, Integer courseId) {
        System.out.println("CourseServiceImpl里map的值为："+courseIntroduce+courseId);
        int updateCourseIntroduce = courseMapper.updatecourseIntroduce(courseIntroduce,courseId);
        return updateCourseIntroduce;
    }

    @Override//更改头像路径
    public int updatespeakerHeadImgUrl(String speakerHeadImgUrl, Integer courseId) {
        System.out.println("CourseServiceImpl里map的值为："+speakerHeadImgUrl+courseId);
        int updateSpeakerHeadImgUrl = courseMapper.updatespeakerHeadImgUrl(speakerHeadImgUrl,courseId);
        return updateSpeakerHeadImgUrl;
    }

    @Override//新增课程
    public int insertCourse(String courseName, Integer fieldId, String courseImgURL, String speakerName, String courseIntroduce, String collectionNumber, String speakerHeadImgUrl, String totalPlayTimes) {
        System.out.println("CourseServiceImpl里的值为："+"courseName:"+courseName+"；fileId:"+fieldId+"；courseImgURL:"+courseImgURL
                +"；speakerName:"+speakerName+"；courseIntroduce:"+courseIntroduce +"；collectionNumber:"
                +collectionNumber+"；speakerHeadImgUrl:"+speakerHeadImgUrl+"；totalPlayTimes:"+totalPlayTimes);
        int insertCourse = courseMapper.insertCourse(courseName,fieldId,courseImgURL,speakerName,
                courseIntroduce,collectionNumber,speakerHeadImgUrl,totalPlayTimes);
        return insertCourse;
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
}
