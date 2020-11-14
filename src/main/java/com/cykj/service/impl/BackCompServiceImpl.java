package com.cykj.service.impl;

import com.cykj.entity.*;
import com.cykj.mapper.*;
import com.cykj.service.BackCompService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
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

    @Resource
    private PostPositionMapper postPositionMapper;

    @Resource
    private ResumeMapper resumeMapper;

    @Resource
    private DeliveryMapper deliveryMapper;
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

    @Override
    public String postPosition(PostPosition postPosition) {
        int provinceID = Integer.parseInt(postPosition.getProvince());
        postPosition.setProvince(provinceMapper.findByID(provinceID).getProvinceName());
        int n = postPositionMapper.addPostPosition(postPosition);
        return n>0? "1":"2";
    }

    @Override
    public String rePostPosition(PostPosition postPosition) {
        int n = postPositionMapper.addPostPosition(postPosition);
        return n>0? "1":"2";
    }

    @Override
    public TableInfo findPosition(Map<String, Object> map) {

        List<PostPosition> positionOnPage = postPositionMapper.findPosition(map);
        int num = postPositionMapper.findPositionNum(map);
        TableInfo tableInfo = new TableInfo(0,"高校推荐人才",num,positionOnPage );

        return tableInfo;

    }

    @Override
    public int changePostPositionStand(Map<String, Object> map) {
        return postPositionMapper.changePostPositionStand(map);
    }

    @Override
    public TableInfo findAllResume(Map<String, Object> map) {
        List<Resume> resumes = resumeMapper.findAllResume(map);
        List<Resume> num = resumeMapper.findAllResumeNum(map);
        System.out.println(num.size());
        TableInfo tableInfo = new TableInfo(0,"高校推荐人才",num.size(),resumes );
        return tableInfo;
    }

    @Override
    public int changeDeliStand(List<Resume> list) {
        int n = 0;
        for (Resume resume : list) {
            Map<String,Object> map = new HashMap<>();
            map.put("standID",10);
            map.put("deliID",resume.getDelivery().getDeliveryId());
            int i = deliveryMapper.changeDeliStand(map);
            n = n+i;
        }
        return n;
    }

    @Override
    public int changeDeliStand(int deliID,int standID) {
        Map<String,Object> map = new HashMap<>();
        map.put("standID",standID);
        map.put("deliID",deliID);
        int i = deliveryMapper.changeDeliStand(map);
        return i>0?1:2;
    }
}
