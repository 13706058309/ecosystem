package com.cykj.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository
/**
 * 投递简历
 */
public interface DeliveryMapper {
    int changeDeliStand(Map<String,Object> map);
}
