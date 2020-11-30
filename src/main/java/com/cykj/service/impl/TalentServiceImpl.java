package com.cykj.service.impl;


import com.cykj.entity.*;
import com.cykj.mapper.TalentMapper;
import com.cykj.mapper.UserNumMapper;
import com.cykj.service.TalentService;


import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
@Component
public class TalentServiceImpl implements TalentService {

    @Resource
        private TalentMapper talentMapper;
    @Resource
    private UserNumMapper userNumMapper;

    @Override
    public List<Talent> findTalent(Map<String, Object> map, int limit, int page) {
        map.put("limit",limit);
        map.put("offset",(page-1)*limit);
        return talentMapper.findTalent(map);
    }
    @Override
    public int findRecords(Map<String, Object> map) {
        int records = talentMapper.findRecords(map);
        return records;
    }
    @Override
    public List<Positions> findPosition(Map<String, Object> map, int limit, int page) {
        map.put("limit",limit);
        map.put("offset",(page-1)*limit);
        return talentMapper.findPosition(map);
    }
    @Override
    public int findPositionRecords(Map<String, Object> map) {
        int records = talentMapper.findPositionRecords(map);
        return records;
    }
    @Override
    public int addTalent(Talent talent) {

        int n = talentMapper.addTalent(talent);

        return n;
    }
    @Override
    public List<BackUserNum> all() {
        return userNumMapper.all();
    }
    @Override
    public List<BackUserNum> backUserNumMonth() {

        return userNumMapper.backUserNumMonth();
    }

    @Override
    public List<BackUserNum> backUserNumWeek() {
        return userNumMapper.backUserNumWeek();

    }

    @Override
    public List<BackUserNum> backUserNumHalfYear() {
        return userNumMapper.backUserNumHalfYear();
    }
    @Override
    public List<BackUserNum> userNumMonth() {

        return userNumMapper.userNumMonth();
    }

    @Override
    public List<BackUserNum> userNumWeek() {
        return userNumMapper.userNumWeek();

    }

    @Override
    public List<BackUserNum> userNumHalfYear() {
        return userNumMapper.userNumHalfYear();
    }

    @Override
    public boolean findTalent(String contactInfo) {
        return talentMapper.selectTalent(contactInfo)==null;
    }

    @Override
    public List<Positions> selectPosition(Map<String, Object> map, int limit, int page) {
        map.put("limit",limit);
        map.put("offset",(page-1)*limit);
        return talentMapper.selectPosition(map);
    }

    @Override
    public int selectPositionRecords(Map<String, Object> map) {
        int records = talentMapper.selectPositionRecords(map);
        return records;
    }

    @Override
    public String changePosition(Map<String, Object> map) {
        int n = talentMapper.changePosition(map);
        return n>0? "1":"2";
    }

    @Override
    public boolean lookPosition(String postName) {
        return talentMapper.lookPosition(postName)==null;
    }

    @Override
    public int addPosition(String postName, Long departId) {

        int n = talentMapper.addPosition(postName,departId);

        return n;
    }

    @Override
    public boolean lookDepart(String departName) {
        return talentMapper.lookDepart(departName)==null;
    }

    @Override
    public int addDepart(String departName, Long industryId) {
        int n = talentMapper.addDepart(departName,industryId);

        return n;
    }

    @Override
    public boolean lookIndustry(String industryName) {
        return talentMapper.lookIndustry(industryName)==null;
    }

    @Override
    public int addIndustry(String industryName) {
        int n = talentMapper.addIndustry(industryName);

        return n;
    }




    @Override
    public boolean findCompAndtalent(int companyID, String c) {
        return talentMapper.selectCompAndtalent(companyID,c)==null;
    }

    @Override
    public int addCompAndtalent(int companyID, String c) {

        int n = talentMapper.addCompAndtalent(companyID,c);

        return n;
    }

    @Override
    public String changeSchoolInfo(Map<String, Object> map) {
        int n = talentMapper.changeSchoolInfo(map);
        return n>0? "1":"2";
    }

    @Override
    public BackUser findShoolByID(int i) {
      return talentMapper.findShoolByID(i);
    }


}
