package com.cykj.service.impl;

import com.cykj.entity.*;
import com.cykj.mapper.*;
import com.cykj.service.HomePageService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service
public class HomePageServiceImpl implements HomePageService {

    @Resource
    private  IndustryMapper industryMapper;

    @Resource
    private DepartMapper departMapper;

    @Resource
    private PositionMapper positionMapper;

    @Resource
    private CityMapper cityMapper;

    @Resource
    private BackUserMapper backUserMapper;

    @Resource
    private PostPositionMapper postPositionMapper;

    /**
     * 主页行业遍历显示
     * @return
     */
    @Override
    public List<Industry> findIndustry() {
        List<Industry> industries = industryMapper.findIndustry();
        return industries;
    }

    @Override
    public List<Depart> findDepart(long industryId) {
        List<Depart> depart = departMapper.findDepart(industryId);
        return depart;
    }

    @Override
    public List<Position> findPost(long departId) {
        List<Position> post = positionMapper.findPost(departId);
        return post;
    }

    @Override
    public List<City> cityList() {
        List<City> cityList = cityMapper.cityList();
        return cityList;
    }

    @Override
    public List<BackUser> CompanyCity(String city) {
        List<BackUser> backUserList = backUserMapper.CompanyCity(city);
        return backUserList;
    }

    @Override
    public List<PostPosition> postList(String workCity) {
        List<PostPosition> postList = postPositionMapper.postList(workCity);
        return postList;
    }
}
