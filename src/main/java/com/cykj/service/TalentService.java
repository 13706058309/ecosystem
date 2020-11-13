package com.cykj.service;

import com.cykj.entity.Talent;

import java.util.List;
import java.util.Map;

public interface TalentService {
    List<Talent> findUnviTalentOnPage(Map<String,Object> map);
}
