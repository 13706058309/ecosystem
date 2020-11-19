package com.cykj.service;

import com.cykj.entity.City;
import com.cykj.entity.Depart;
import com.cykj.entity.Industry;
import com.cykj.entity.Position;

import java.util.List;

public interface HomePageService {
    /**
     * 主页行业遍历显示
     * @return
     */
    List<Industry> findIndustry();

    List<Depart> findDepart(long industryId);

    List<Position> findPost(long departId);

    List<City> cityList();
}
