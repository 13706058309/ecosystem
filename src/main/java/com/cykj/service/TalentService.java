package com.cykj.service;



import com.cykj.entity.BackUserNum;
import com.cykj.entity.Talent;

import java.util.List;
import java.util.Map;

public interface TalentService {

    List<Talent> findTalent(Map<String, Object> map, int limit, int page);
    int findRecords(Map<String, Object> map);


    int addTalent(Talent talent);


    List<BackUserNum> backUserNumMonth();

    List<BackUserNum> backUserNumWeek();


    List<BackUserNum> backUserNumHalfYear();
    List<BackUserNum> userNumMonth();

    List<BackUserNum> userNumWeek();


    List<BackUserNum> userNumHalfYear();


    boolean findTalent(String talentName);
}
