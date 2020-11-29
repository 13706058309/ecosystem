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


    List<BackUserNum> backUserNumMonth(); //后台月统计

    List<BackUserNum> backUserNumWeek(); //后台周统计


    List<BackUserNum> backUserNumHalfYear(); //后台年统计
    List<BackUserNum> userNumMonth();

    List<BackUserNum> userNumWeek();


    List<BackUserNum> userNumHalfYear();





    boolean findCompAndtalent(int companyID, String c);


    int addCompAndtalent(int companyID, String c);


    String changeSchoolInfo(Map<String, Object> map);


    BackUser findShoolByID(int i);


    boolean findTalent( String contactInfo);


    List<Positions> selectPosition(Map<String, Object> map, int limit, int page);


    int selectPositionRecords(Map<String, Object> map);


    String changePosition(Map<String, Object> map);

    boolean lookPosition(String postName);


    int addPosition(String postName, Long departId);


    boolean lookDepart(String departName);


    int addDepart(String departName, Long industryId);

    boolean lookIndustry(String industryName);


    int addIndustry(String industryName);


    List<BackUserNum> all();
}
