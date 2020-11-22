package com.cykj.service.impl;

import com.cykj.entity.*;
import com.cykj.mapper.*;
import com.cykj.service.BackCompService;
import com.cykj.utils.MyUtil;
import com.cykj.utils.WordUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.Inflater;

@Service
public class BackCompServiceImpl implements BackCompService {
    @Resource
    private TalentMapper talentMapper;

    @Resource
    private CompAndtalentMapper compAndtalentMapper;

    @Resource
    private IndustryMapper industryMapper;

    @Resource
    private DepartMapper departMapper;

    @Resource
    private PositionMapper positionMapper;

    @Resource
    private ProvinceMapper provinceMapper;

    @Resource
    private CityMapper cityMapper;

    @Resource
    private PostPositionMapper postPositionMapper;

    @Resource
    private ResumeMapper resumeMapper;

    @Resource
    private DeliveryMapper deliveryMapper;

    @Resource
    private BackUserMapper backUserMapper;

    @Resource
    private CompIndustryMapper compIndustryMapper;

    @Resource
    private ParameterMapper parameterMapper;

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

    @Override
    public List<Industry> findAll() {
        return industryMapper.findAll();
    }

    @Override
    public List<Depart> findDepartByID(int industryID) {
        return departMapper.findDepartByID(industryID);
    }

    @Override
    public List<Position> findPositionByID(int dapartID) {
        return positionMapper.findPositionByID(dapartID);
    }

    @Override
    public List<Province> findAllProvince() {
        return provinceMapper.findAllProvince();
    }

    @Override
    public List<City> findCityByID(int provinceID) {
        return cityMapper.findCityByID(provinceID);
    }

    @Override
    public String postPosition(PostPosition postPosition) {
        int provinceID = Integer.parseInt(postPosition.getProvince());
        postPosition.setProvince(provinceMapper.findByID(provinceID).getProvinceName());
        int n = postPositionMapper.addPostPosition(postPosition);
        return n>0? "1":"2";
    }

    @Override
    public String rePostPosition(PostPosition postPosition) {
        int n = postPositionMapper.addPostPosition(postPosition);
        return n>0? "1":"2";
    }

    @Override
    public TableInfo findPosition(Map<String, Object> map) {

        List<PostPosition> positionOnPage = postPositionMapper.findPosition(map);
        int num = postPositionMapper.findPositionNum(map);
        TableInfo tableInfo = new TableInfo(0,"高校推荐人才",num,positionOnPage );

        return tableInfo;

    }

    @Override
    public int changePostPositionStand(Map<String, Object> map) {
        return postPositionMapper.changePostPositionStand(map);
    }

    @Override
    public TableInfo findAllResume(Map<String, Object> map) {
        List<Resume> resumes = resumeMapper.findAllResume(map);
        List<Resume> num = resumeMapper.findAllResumeNum(map);
        System.out.println(num.size());
        TableInfo tableInfo = new TableInfo(0,"高校推荐人才",num.size(),resumes );
        return tableInfo;
    }

    @Override
    public int changeDeliStand(List<Resume> list,int standID) {
        int n = 0;
        for (Resume resume : list) {
            Map<String,Object> map = new HashMap<>();
            map.put("standID",standID);
            map.put("deliID",resume.getDelivery().getDeliveryId());
            int i = deliveryMapper.changeDeliStand(map);
            n = n+i;
        }
        return n;
    }

    @Override
    public int changeDeliStand(int deliID,int standID) {
        Map<String,Object> map = new HashMap<>();
        map.put("standID",standID);
        map.put("deliID",deliID);
        int i = deliveryMapper.changeDeliStand(map);
        return i>0?1:2;
    }

    @Override
    public int delResume(int deliID, int standID) {
        Map<String,Object> map = new HashMap<>();
        map.put("standID",standID);
        map.put("deliID",deliID);
        map.put("feedTime",new Date());
        map.put("feedInfo","您被企业拒绝，请再接再厉");
        int i = deliveryMapper.delResume(map);
        return i>0?1:2;
    }

    @Override
    public int delResume(List<Resume> list, int standID) {
        int n = 0;
        for (Resume resume : list) {
            Map<String,Object> map = new HashMap<>();
            map.put("standID",standID);
            map.put("deliID",resume.getDelivery().getDeliveryId());
            map.put("feedTime",new Date());
            map.put("feedInfo","您被企业拒绝，请再接再厉");
            int i = deliveryMapper.delResume(map);
            n = n+i;
        }
        return n;
    }

    @Override
    public int passResume(int deliID, int standID, String msg) {
        Map<String,Object> map = new HashMap<>();
        map.put("standID",standID);
        map.put("deliID",deliID);
        map.put("feedTime",new Date());
        map.put("feedInfo",msg);
        int i = deliveryMapper.delResume(map);
        return i>0?1:2;
    }

    @Override
    public String findPostName(int postID) {
        return positionMapper.findPostName(postID).getPostName();
    }

    @Override
    public String updatePostPosition(PostPosition postPosition) {
        Map<String,Object> map = new HashMap<>();
        if(postPosition.getPPostId()!=0){
            map.put("pPostID",postPosition.getPPostId());
        }
        if(postPosition.getPostName()!=null){
            map.put("postName",postPosition.getPostName());
        }
        if(postPosition.getWorkNature()!=null){
            map.put("workNature",postPosition.getWorkNature());
        }
        if(postPosition.getDepartment()!=null){
            map.put("department",postPosition.getDepartment());
        }
        if(postPosition.getPostId()!=0){
            map.put("postId",postPosition.getPostId());
        }
        if(postPosition.getMaxSalary()!=0){
            map.put("maxSalary",postPosition.getMaxSalary());
        }
        if(postPosition.getMinSalary()!=0){
            map.put("minSalary",postPosition.getMinSalary());
        }

        if(postPosition.getWorkCity()!=null){
            map.put("workCity",postPosition.getWorkNature());
        }
        if(postPosition.getWorkYear()!=null){
            map.put("workYear",postPosition.getWorkYear());
        }
        if(postPosition.getEducation()!=null){
            map.put("education",postPosition.getEducation());
        }
        if(postPosition.getJobBenefits()!=null){
            map.put("jobBenefits",postPosition.getJobBenefits());
        }

        if(postPosition.getJobDescription()!=null){
            map.put("jobDescription",postPosition.getJobDescription());
        }
        if(postPosition.getRecruitsNum()!=null){
            map.put("recruitsNum",postPosition.getRecruitsNum());
        }

        if(postPosition.getProvince()!=null){
            int pID = Integer.parseInt(postPosition.getProvince());
            Province province = provinceMapper.findByID(pID);
            map.put("province",province.getProvinceName());
        }
        if(postPosition.getDetailAddress()!=null){
            map.put("detailAddress",postPosition.getDetailAddress());
        }

        if(postPosition.getContact()!=null){
            map.put("contact",postPosition.getContact());
        }
        if(postPosition.getContactEmail()!=null){
            map.put("contactEmail",postPosition.getContactEmail());
        }
        int n = postPositionMapper.updatePostPosition(map);
        return n>0 ? "1":"2";
    }

    @Override
    public TableInfo findUserResume(Map<String, Object> map) {
        List<Resume> resumes = resumeMapper.compFindResume(map);
        int num = resumeMapper.compFindResumeNum(map);
        TableInfo tableInfo = new TableInfo(0,"企业查找简历",num,resumes );
        return tableInfo;
    }

    @Override
    public Resume findResumeDetail(int resumeID) {
        return resumeMapper.findResumeDetail(resumeID);
    }
    //获取公司的详细信息
    @Override
    public BackUser findCompByID(int compID) {
        BackUser compByID = backUserMapper.findCompByID(compID);
        return compByID;
    }

    @Override
    public String changeCompInfo(Map<String, Object> map) {
        int n = backUserMapper.changeCompInfo(map);
        return n>0? "1":"2";
    }

    @Override
    public String changePwd(String newPwd, String pwd, int compID) {
        String findPwd = backUserMapper.findPwd(compID);
        String msg = "";
        if(!pwd.equals(findPwd)){
            msg = "1";
        }else{
            int n = backUserMapper.changePwd(newPwd,compID);
            if(n>0){
                msg = "2";
            }else {
                msg = "3";
            }
        }
        return msg;
    }

    @Override
    public Talent findTalentByID(int talentID) {
        return talentMapper.findTalentByID(talentID);
    }

    @Override
    public String outResume(int resumeID,String savePath) {
        Resume resume = resumeMapper.findResumeDetail(resumeID);
        Map<String,Object> map = new HashMap<>();
        map.put("realName",resume.getRealName());
        map.put("clan",resume.getClan());
        map.put("politicalStatus",resume.getPoliticalStatus());
        map.put("birthday",resume.getBirthday());
        map.put("sex",resume.getSex());
        map.put("workYear",resume.getWrokYear());
        map.put("education",resume.getEducation().getEducation());
        map.put("profession",resume.getProfession());
        map.put("school",resume.getSchool());
        int standID = (int) resume.getJobStandId();
        if(standID==4){
            map.put("jobStand","已就业");
        }else if(standID==5){
            map.put("jobStand","为就业");
        }else{
            map.put("jobStand","在职月内到岗");
        }

        map.put("expectWork",resume.getExpectWork());
        map.put("industry",resume.getIndustry());
        map.put("address",resume.getAddress());
        map.put("contactInfo",resume.getContactInfo());
        map.put("selfEva",resume.getSelfEva());

        map.put("school1",resume.getEducationalBackgrounds().get(0).getEbSchool());
        map.put("schBegin1",resume.getEducationalBackgrounds().get(0).getSchBeginTime());
        map.put("edu1",resume.getEducationalBackgrounds().get(0).getEbEducation());
        map.put("schEnd1",resume.getEducationalBackgrounds().get(0).getSchEndTime());
        map.put("schoolExp1",resume.getEducationalBackgrounds().get(0).getSchExperience());
        if(resume.getEducationalBackgrounds().size()==2){
            map.put("school2",resume.getEducationalBackgrounds().get(1).getEbSchool());
            map.put("schBegin2",resume.getEducationalBackgrounds().get(1).getSchBeginTime());
            map.put("edu2",resume.getEducationalBackgrounds().get(1).getEbEducation());
            map.put("schEnd2",resume.getEducationalBackgrounds().get(1).getSchEndTime());
            map.put("schoolExp2",resume.getEducationalBackgrounds().get(1).getSchExperience());
        }else{
            map.put("school2","");
            map.put("schBegin2","");
            map.put("edu2","");
            map.put("schEnd2","");
            map.put("schoolExp2","");
        }

        map.put("compName1",resume.getWorkExperiences().get(0).getCompanyName());
        map.put("begin1",resume.getWorkExperiences().get(0).getBeginTime());
        map.put("post1",resume.getWorkExperiences().get(0).getCompanyPost());
        map.put("end1",resume.getWorkExperiences().get(0).getEndTime());
        map.put("trade1",resume.getWorkExperiences().get(0).getDuties());
        map.put("performace1",resume.getWorkExperiences().get(0).getPerformance());
        if(resume.getWorkExperiences().size()==2){
            map.put("compName2",resume.getWorkExperiences().get(1).getCompanyName());
            map.put("begin2",resume.getWorkExperiences().get(1).getBeginTime());
            map.put("post2",resume.getWorkExperiences().get(1).getCompanyPost());
            map.put("end2",resume.getWorkExperiences().get(1).getEndTime());
            map.put("trade2",resume.getWorkExperiences().get(1).getDuties());
            map.put("performace2",resume.getWorkExperiences().get(1).getPerformance());
        }else{
            map.put("compName2","");
            map.put("begin2","");
            map.put("post2","");
            map.put("end2","");
            map.put("trade2","");
            map.put("performace2","");
        }


        map.put("projectName1",resume.getProjectExperiences().get(0).getProName());
        map.put("proBegin1",resume.getProjectExperiences().get(0).getProBeginTime());
        map.put("proPost1",resume.getProjectExperiences().get(0).getProPost());
        map.put("proEnd1",resume.getProjectExperiences().get(0).getProEndTime());
        map.put("proDes1",resume.getProjectExperiences().get(0).getProDescription());
        map.put("proWork1",resume.getProjectExperiences().get(0).getProPerformance());

        if(resume.getProjectExperiences().size()==2){
            map.put("projectName2",resume.getProjectExperiences().get(1).getProName());
            map.put("proBegin2",resume.getProjectExperiences().get(1).getProBeginTime());
            map.put("proPost2",resume.getProjectExperiences().get(1).getProPost());
            map.put("proEnd2",resume.getProjectExperiences().get(1).getProEndTime());
            map.put("proDes2",resume.getProjectExperiences().get(1).getProDescription());
            map.put("proWork2",resume.getProjectExperiences().get(1).getProPerformance());
        }else{
            map.put("projectName2","");
            map.put("proBegin2","");
            map.put("proPost2","");
            map.put("proEnd2","");
            map.put("proDes2","");
            map.put("proWork2","");
        }
        WordUtil wordUtil = new WordUtil();
        String imageBase = wordUtil.getImageBase("static"+resume.getPhoto());
        map.put("image",imageBase);
        String path = wordUtil.createWord(map, MyUtil.RESUME,savePath);
        return path;
    }

    @Override
    public BackUser findByPhone(String phone) {
        return backUserMapper.findByPhone(phone);
    }

    @Override
    public int changePwdByPhone(String pwd, String phone) {
        return backUserMapper.changePwdByPhone(pwd,phone);
    }

    @Override
    public BackUser findCompByAcc(String account) {
        return backUserMapper.findByAccount(account);
    }

    @Override
    public int RegComp(BackUser backUser, int industryID) {

        int provinceID = Integer.parseInt(backUser.getProvince());
        Province province = provinceMapper.findByID(provinceID);
        backUser.setProvince(province.getProvinceName());

        int n = backUserMapper.addComp(backUser);
        if(n<0){
            return 4;
        }

        int compID = backUserMapper.findID();
        int result = compIndustryMapper.addCompAndInd(compID, industryID);
        return 5;
    }
    //判断下载简历是否收费
    @Override
    public String judegCharse() {
        Parameter  parameter = parameterMapper.findDownFee(57);
        int flag = Integer.parseInt(parameter.getParamValues());
        String msg = "";
        if(flag==1){
            msg = "no";
        }else{
           msg = parameterMapper.findDownFee(56).getParamValues();
        }
        return msg;
    }
}
