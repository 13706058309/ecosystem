package com.cykj.service.impl;

import com.cykj.entity.City;
import com.cykj.entity.Depart;
import com.cykj.entity.Industry;
import com.cykj.entity.Position;
import com.cykj.mapper.CityMapper;
import com.cykj.mapper.DepartMapper;
import com.cykj.mapper.IndustryMapper;
import com.cykj.mapper.PositionMapper;
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

    /**
     * 主页行业遍历显示
     * @return
     */
    @Override
    public List<Industry> findIndustry() {
        List<Industry> industries = industryMapper.findIndustry();
//        Map<Industry,List<Depart>> oneMap = new HashMap<>();
//        Map<Depart,List<Position>> twoMap = new HashMap<>();
//
//        for (Industry industrys:parent) {
//            List<Depart> sonList =  departMapper.findDepart(industrys.getIndustryId());
//            oneMap.put(industrys,sonList);
//
//            for (Depart depart:sonList) {
//                List<Position> post = positionMapper.findPost(depart.getDepartId());
//                twoMap.put(depart,post);
//            }
//        }
//        Object[] obj = {oneMap, twoMap};
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
}
