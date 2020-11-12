package com.cykj.service.impl;

import com.cykj.entity.CompAndtalent;
import com.cykj.entity.TableInfo;
import com.cykj.entity.Talent;
import com.cykj.mapper.CompAndtalentMapper;
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

    @Resource
    private CompAndtalentMapper compAndtalentMapper;
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
}
