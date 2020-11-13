package com.cykj.service;

import com.cykj.entity.*;

import java.util.List;
import java.util.Map;

public interface BackCompService {
    //查找高校推荐人才的信息
    TableInfo findUnviTalent(Map<String,Object> map);
    //删除高校推荐的人才
    int delUnviTalent(int standID,int compAndTalId);
    //查找所有的行业
    List<Industry> findAll();
    //通过行业ID查找对应的所有部门
    List<Depart> findDepartByID(int industryID);
    //通过部门ID查找岗位
    List<Position> findPositionByID(int dapartID);
    //查找所有的省份
    List<Province> findAllProvince();
    //通过省份ID查找到所有的市
    List<City> findCityByID(int provinceID);
    //发布岗位
    String postPosition(PostPosition postPosition);

    //企业查询发布的岗位
    TableInfo findOnlinePosition(Map<String,Object> map);
    //修改状态
    int changePostPositionStand(Map<String,Object> map);

}
