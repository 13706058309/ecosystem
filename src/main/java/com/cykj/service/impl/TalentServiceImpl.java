package com.cykj.service.impl;

import com.cykj.entity.Talent;
import com.cykj.mapper.TalentMapper;
import com.cykj.service.TalentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class TalentServiceImpl implements TalentService {
    @Resource
    private TalentMapper talentMapper;
    @Override
    public List<Talent> findUnviTalentOnPage(Map<String, Object> map) {
        return talentMapper.findUnviTalentOnPage(map);
    }
}
