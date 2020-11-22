package com.cykj.service;



import com.cykj.entity.*;

import java.util.List;
import java.util.Map;

public interface TalentService {

    List<Talent> findTalent(Map<String, Object> map, int limit, int page);
    int findRecords(Map<String, Object> map);

    List<Positions> findPosition(Map<String, Object> map, int limit, int page);
    int findPositionRecords(Map<String, Object> map);



    int addTalent(Talent talent);


    List<BackUserNum> backUserNumMonth();

    List<BackUserNum> backUserNumWeek();


    List<BackUserNum> backUserNumHalfYear();
    List<BackUserNum> userNumMonth();

    List<BackUserNum> userNumWeek();


    List<BackUserNum> userNumHalfYear();


    boolean findTalent(String talentName);


    boolean findCompAndtalent(int companyID, char c);


    int addCompAndtalent(int companyID, char c);


    String changeSchoolInfo(Map<String, Object> map);


    BackUser findShoolByID(int i);
}
