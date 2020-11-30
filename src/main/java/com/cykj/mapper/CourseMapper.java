package com.cykj.mapper;

import com.cykj.entity.Course;
import com.cykj.entity.Field;
import com.cykj.entity.Unit;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 * 课程
 */
public interface CourseMapper {
    List<Course> findCourseOnPage(Map<String, Object> map);

    List<Field> fieldList();

    int findNumOnPage(Map<String, Object> map);

    int deleteCourse(Integer courseId);

    int updateCourseName(String courseName,Integer courseId);//更改课程名字

    int updatecourseImgUrl(String courseImgUrl,Integer courseId);//更改路径

    int updatecourseIntroduce(String courseIntroduce,Integer courseId);//更改课程介绍

    int updatespeakerHeadImgUrl(String speakerHeadImgUrl,Integer courseId);//更改头像路径

    int insertCourse(String courseName,Integer fieldId,String courseImgUrl,String speakerName
            ,String courseIntroduce,String collectionNumber,String speakerHeadImgUrl,String totalPlayTimes);//新增课程


    String findOption();

    /**
     * 根据领域ID查询课程信息，ID为0时，查询所有
     * @param conditionMap
     * @return 返回课程列表
     */
    public List<Course> selectCourseByFieldId(Map<String,Object> conditionMap);


    public int selectCount(long fieldId);

    /**
     * 查询5门播放量最多的课程
     * @return
     */
    public List<Course> hotCourses();

    /**
     * 根据课程ID查询课程的相关信息
     * @param courseId
     * @return
     */
    public Course selectCourseById(long courseId);

    /**
     * 根据课程ID查询和该课程相关的5门播放量最多的课程
     * @param courseId
     * @return
     */
    public List selectRelatedCourses(long courseId);

    /**
     * 根据课程ID查询当前播放视频所属的课程名
     * @param courseId
     * @return
     */
    public String selectCourseNameByCourseId(long courseId);

    /**
     * 根据章节ID更新该章节所属课程的播放量
     * @param unitId
     * @return
     */
    public void updateTotalPlayTimesByUnitId (long unitId);

    /**
     * 课程被收藏时，根据课程Id给课程表的被收藏字段加1
     * @param courseId
     */
    public void increaseCollectionNumberByCourseId(long courseId);

    /**
     *课程被取消收藏时，根据课程Id给课程表的被收藏字段减1
     * @param courseId
     */
    public void decreaseCollectionNumberByCourseId(long courseId);
}
