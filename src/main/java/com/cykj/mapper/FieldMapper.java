package com.cykj.mapper;

import com.cykj.entity.Unit;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 * 领域
 */
public interface FieldMapper {
    List<Unit> findFieldOnPage(Map<String, Object> map);

    int findNumOnPage(Map<String, Object> map);

    int deleteField(Integer fieldId);//根据id删除领域

    int updateunitName(String unitName,Integer unitId);//更改章节名字

    int selectunitName(Integer unitId);//更改章节名字

//
//    int updatecourseImgURL(String courseImgURL,Integer courseId);//更改路径
//
//    int updatecourseIntroduce(String courseIntroduce,Integer courseId);//更改课程介绍
//
//    int updatespeakerHeadImgUrl(String speakerHeadImgUrl,Integer courseId);//更改头像路径
//
    int insertField(String fieldName);//新增领域

}
