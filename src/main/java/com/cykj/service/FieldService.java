package com.cykj.service;

import com.cykj.entity.TableInfo;

public interface FieldService {
    public TableInfo findField(Integer page, Integer limit, String fieldName);
    public int deleteField(Integer fieldId);//根据id删除领域
//    public int updateUnitName(String unitName, Integer unitId);//更改章节名字
//    public int selectunitName(Integer unitId);//查找框 根据ID查 上一章 课程名称
//    public int updatecourseImgURL(String courseImgURL, Integer courseId);//更改路径
//    public int updatecourseIntroduce(String courseIntroduce, Integer courseId);//更改课程介绍
//    public int updatespeakerHeadImgUrl(String speakerHeadImgUrl, Integer courseId);//更改头像路径
    public int insertField(String fieldName);//增加领域





//    public List<Course> findCourse();
//    public List<Course> search(String courseName);
import com.cykj.entity.Field;

import java.util.List;

public interface FieldService {
    public List<Field> selectAllFieldName();
}
