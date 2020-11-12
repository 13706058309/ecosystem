package com.cykj.service.impl;

import com.cykj.entity.*;
import com.cykj.mapper.*;
import com.cykj.service.BackCompService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class BackCompServiceImpl implements BackCompService {
    @Resource
    private TalentMapper talentMapper;

    @Resource
    private CompAndtalentMapper compAndtalentMapper;

    @Resource
    private IndustryMapper industryMapper;

    @Resource
    private DepartMapper departMapper;

    @Resource
    private PositionMapper positionMapper;

    @Resource
    private ProvinceMapper provinceMapper;

    @Resource
    private CityMapper cityMapper;
    @Override
    public TableInfo findUnviTalent(Map<String, Object> map) {
        List<Talent> unviTalentOnPage = talentMapper.findUnviTalentOnPage(map);
        for (Talent talent : unviTalentOnPage) {
            System.out.println("大学："+talent.getCompAndtalent().getCompAndTalId());

        }
        int num = talentMapper.findUnviTalentOnPageNum(map);
        TableInfo tableInfo = new TableInfo(0,"高校推荐人才",num,unviTalentOnPage );
        return tableInfo;
    }

    @Override
    public int delUnviTalent(int standID, int compAndTalId) {
        return compAndtalentMapper.delUnviTalent(standID,compAndTalId);
    }

    @Override
    public List<Industry> findAll() {
        return industryMapper.findAll();
    }

    @Override
    public List<Depart> findDepartByID(int industryID) {
        return departMapper.findDepartByID(industryID);
    }

    @Override
    public List<Position> findPositionByID(int dapartID) {
        return positionMapper.findPositionByID(dapartID);
    }

    @Override
    public List<Province> findAllProvince() {
        return provinceMapper.findAllProvince();
    }

    @Override
    public List<City> findCityByID(int provinceID) {
        return cityMapper.findCityByID(provinceID);
    }
}
