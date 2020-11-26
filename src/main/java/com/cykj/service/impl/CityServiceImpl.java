package com.cykj.service.impl;

import com.cykj.entity.City;
import com.cykj.mapper.CityMapper;
import com.cykj.service.CityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CityServiceImpl implements CityService {

    @Resource
    private CityMapper cityMapper;

    @Override
    public List<City> cityList() {
        List<City> cityList = cityMapper.cityList();
        return cityList;
    }

}
