package com.cykj.service;

import com.cykj.entity.*;

import java.util.List;

public interface HomePageService {
    /**
     * 主页行业遍历显示
     * @return
     */
    List<Industry> findIndustry ();

    List<Depart> findDepart(long industryId);

    List<Position> findPost(long departId);

    List<City> cityList();
//热门企业
    List<BackUser> CompanyCity(String city);
//最新岗位
    List<PostPosition> postList(String workCity);
}
