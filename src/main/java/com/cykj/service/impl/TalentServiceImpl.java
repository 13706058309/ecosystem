package com.cykj.service.impl;


import com.cykj.entity.BackUserNum;
import com.cykj.entity.Talent;
import com.cykj.mapper.TalentMapper;
import com.cykj.mapper.UserNumMapper;
import com.cykj.service.TalentService;
import com.cykj.service.UserService;

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
    public int addTalent(Talent talent) {

        int n = talentMapper.addTalent(talent);

        return n;
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


}
