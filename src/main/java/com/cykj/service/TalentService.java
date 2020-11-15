package com.cykj.service;



import com.cykj.entity.Talent;

import java.util.List;
import java.util.Map;

public interface TalentService {

    List<Talent> findTalent(Map<String, Object> map, int limit, int page);
    int findRecords(Map<String, Object> map);


    int addTalent(Talent talent);
}
