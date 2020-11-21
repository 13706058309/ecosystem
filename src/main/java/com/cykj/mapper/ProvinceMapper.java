package com.cykj.mapper;

import com.cykj.entity.City;
import com.cykj.entity.Province;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
@Repository
/**
 * 省份
 */
public interface ProvinceMapper {
    List<Province> findAllProvince();

    Province findByID(@Param("provinceID") int provinceID);
}
