package com.cykj.service.impl;

import com.cykj.entity.Course;
import com.cykj.entity.Field;
import com.cykj.entity.TableInfo;
import com.cykj.mapper.CourseMapper;
import com.cykj.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
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
    public List<Field> fieldList() {
        List<Field> fieldList = courseMapper.fieldList();
        return fieldList;
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
    public int updatecourseImgUrl(String courseImgUrl, Integer courseId) {
        System.out.println("CourseServiceImpl里map的值为："+courseImgUrl+courseId);
        int updatecourseImgUrl = courseMapper.updatecourseImgUrl(courseImgUrl,courseId);
        return updatecourseImgUrl;
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
    public int insertCourse(String courseName, Integer fieldId, String courseImgUrl, String speakerName, String courseIntroduce, String collectionNumber, String speakerHeadImgUrl, String totalPlayTimes) {
        System.out.println("CourseServiceImpl里的值为："+"courseName:"+courseName+"；fileId:"+fieldId+"；courseImgUrl:"+courseImgUrl
                +"；speakerName:"+speakerName+"；courseIntroduce:"+courseIntroduce +"；collectionNumber:"
                +collectionNumber+"；speakerHeadImgUrl:"+speakerHeadImgUrl+"；totalPlayTimes:"+totalPlayTimes);
        int insertCourse = courseMapper.insertCourse(courseName,fieldId,courseImgUrl,speakerName,
                courseIntroduce,collectionNumber,speakerHeadImgUrl,totalPlayTimes);
        return insertCourse;
    }

    @Override
    public String findOption() {

        String findOption = courseMapper.findOption();
        return findOption;
    }

    /**
     * 根据领域ID查询该领域下的课程信息
     * @param fieldId 领域ID
     * @param curr 当前页
     * @param limit 每页条数
     * @return 返回指定领域下当前页的课程列表
     */
    @Override
    public List<Course> selectCourseByFieldId(long fieldId,int curr,int limit,String latest,String hot) {
        // 查询参数组装
        Map<String,Object> conditionMap = new HashMap<>();
        conditionMap.put("fieldId",fieldId);
        conditionMap.put("curr",(curr-1)*limit);
        conditionMap.put("limit",limit);
//        conditionMap.put("latest",latest);
//        conditionMap.put("hot",hot);

        if (!latest.equals("null")){
            conditionMap.put("latest",latest);
        }

        if (!hot.equals("null")){
            conditionMap.put("hot",hot);
        }
        return courseMapper.selectCourseByFieldId(conditionMap);
    }

    /**
     * 根据领域ID，最新（上传时间最新）和最热（播放量最多）得到课程数，未指定ID时，得到所有课程的数量
     * @param fieldId 领域ID
     * @return 返回与条件匹配的数据量
     */
    @Override
    public int selectCount(long fieldId) {

        return courseMapper.selectCount(fieldId);
    }

    /**
     * 查询5门播放量最多的课程
     * @return
     */
    @Override
    public List<Course> hotCourses() {
        return courseMapper.hotCourses();
    }

    @Override
    public Course selectCourseById(String courseId) {
        return courseMapper.selectCourseById(Long.parseLong(courseId));
    }

    @Override
    public List selectRelatedCourses(String courseId){
        return courseMapper.selectRelatedCourses(Long.parseLong(courseId));
    }

    @Override
    public String selectCourseNameByCourseId(long courseId){
        return courseMapper.selectCourseNameByCourseId(courseId);
    }

    @Override
    public void updateTotalPlayTimesByUnitId(String unitId) {
        courseMapper.updateTotalPlayTimesByUnitId(Long.parseLong(unitId));
    }

    @Override
    public void increaseCollectionNumberByCourseId(String courseId) {
        courseMapper.increaseCollectionNumberByCourseId(Long.parseLong(courseId));
    }

    @Override
    public void decreaseCollectionNumberByCourseId(String courseId) {
        courseMapper.decreaseCollectionNumberByCourseId(Long.parseLong(courseId));
    }
}
