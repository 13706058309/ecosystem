package com.cykj.service;

import com.cykj.entity.TableInfo;
import com.cykj.entity.Talent;

import java.util.List;
import java.util.Map;

public interface BackCompService {
    TableInfo findUnviTalent(Map<String,Object> map);
    int delUnviTalent(int standID,int compAndTalId);
}
