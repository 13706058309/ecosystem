package com.cykj.mapper;

import com.cykj.entity.Delivery;
import com.cykj.entity.Resume;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 * 投递简历
 */
public interface DeliveryMapper {
    int changeDeliStand(Map<String,Object> map);
    int delResume(Map<String,Object> map);

    List<Delivery> findAllResume(Map<String,Object> map);
    int findAllResumeNum(Map<String,Object> map);

    List<Delivery> findScreeResume(Map<String,Object> map);
    int findScreeResumeNum(Map<String,Object> map);
}
