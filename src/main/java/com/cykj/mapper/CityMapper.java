package com.cykj.mapper;

import com.cykj.entity.City;
import com.cykj.entity.Province;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
/**
 * 城市
 */
public interface CityMapper {

    public List<City> cityList();

    List<City> findCityByID(int provinceID);
}
