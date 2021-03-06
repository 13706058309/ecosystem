package com.cykj.service.impl;

import com.cykj.entity.*;
import com.cykj.mapper.*;
import com.cykj.service.BackCompService;
import com.cykj.util.MD5Utils;
import com.cykj.utils.MyUtil;
import com.cykj.utils.WordUtil;
import com.google.gson.Gson;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

    @Resource
    private CompRecordMapper compRecordMapper;

    @Resource
    private PayRecordMapper payRecordMapper;

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
        PostPosition repName = postPositionMapper.findRepName(postPosition.getPostName(), postPosition.getCompanyId());
        if(repName!=null){
            return "5";
        }
        int provinceID = Integer.parseInt(postPosition.getProvince());
        postPosition.setProvince(provinceMapper.findByID(provinceID).getProvinceName());
        int n = postPositionMapper.addPostPosition(postPosition);
        return n>0? "1":"2";
    }

    @Override
    public String rePostPosition(PostPosition postPosition,long compID) {
        PostPosition repName = postPositionMapper.findRepName(postPosition.getPostName(), compID);
        if(repName!=null){
            return "3";
        }
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
        List<Delivery> resumes = deliveryMapper.findAllResume(map);//2020-11-28
        int num = deliveryMapper.findAllResumeNum(map);//2020-11-28
        System.out.println(num+"数量");
        TableInfo tableInfo = new TableInfo(0,"企业查找的简历",num,resumes );
        return tableInfo;
    }

    @Override
    public TableInfo findScreeResume(Map<String, Object> map) {
        List<Delivery> resumes = deliveryMapper.findScreeResume(map);//2020-11-28
        int num = deliveryMapper.findScreeResumeNum(map);//2020-11-28
        System.out.println(num+"数量");
        TableInfo tableInfo = new TableInfo(0,"高校推荐人才",num,resumes );
        return tableInfo;
    }

    @Override
    public int changeDeliStand(List<Delivery> list,int standID) {
        int n = 0;
        for (Delivery delivery : list) {
            Map<String,Object> map = new HashMap<>();
            map.put("standID",standID);
            map.put("deliID",delivery.getDeliveryId());
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
    public int delResume(List<Delivery> list, int standID) {
        int n = 0;
        for (Delivery delivery : list) {
            Map<String,Object> map = new HashMap<>();
            map.put("standID",standID);
            map.put("deliID",delivery.getDeliveryId());
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
        pwd = MD5Utils.md5(pwd);
        if(!pwd.equals(findPwd)){
            msg = "1";
        }else{
            newPwd = MD5Utils.md5(newPwd);
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
    public String outResume(int resumeID,String savePath,String photoPath) {
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
        if(resume.getExpectWork()!=null){
            map.put("expectWork",resume.getExpectWork());
        }else{
            map.put("expectWork","暂无");
        }

        if(resume.getIndustry()!=null){
            map.put("industry",resume.getIndustry());
        }else{
            map.put("industry","暂无");
        }

        if(resume.getAddress()!=null){
            map.put("address",resume.getAddress());
        }else{
            map.put("address","暂无");
        }

        if(resume.getContactInfo()!=null){
            map.put("contactInfo",resume.getContactInfo());
        }else{
            map.put("contactInfo","暂无");
        }

        if(resume.getSelfEva()!=null){
            map.put("selfEva",resume.getSelfEva());
        }else{
            map.put("selfEva","暂无");
        }

        if(resume.getEducationalBackgrounds()!=null&&resume.getEducationalBackgrounds().size()!=0){
            map.put("school1",resume.getEducationalBackgrounds().get(0).getEbSchool());
            map.put("schBegin1",resume.getEducationalBackgrounds().get(0).getSchBeginTime());
            map.put("edu1",resume.getEducationalBackgrounds().get(0).getEbEducation());
            map.put("schEnd1",resume.getEducationalBackgrounds().get(0).getSchEndTime());
            map.put("schoolExp1",resume.getEducationalBackgrounds().get(0).getSchExperience());
        }else{
            map.put("school1","未填写");
            map.put("schBegin1","未填写");
            map.put("edu1","未填写");
            map.put("schEnd1","未填写");
            map.put("schoolExp1","未填写");
        }

        if(resume.getEducationalBackgrounds().size()==2){
            map.put("school2",resume.getEducationalBackgrounds().get(1).getEbSchool());
            map.put("schBegin2",resume.getEducationalBackgrounds().get(1).getSchBeginTime());
            map.put("edu2",resume.getEducationalBackgrounds().get(1).getEbEducation());
            map.put("schEnd2",resume.getEducationalBackgrounds().get(1).getSchEndTime());
            map.put("schoolExp2",resume.getEducationalBackgrounds().get(1).getSchExperience());
        }else{
            map.put("school2","未填写");
            map.put("schBegin2","未填写");
            map.put("edu2","未填写");
            map.put("schEnd2","未填写");
            map.put("schoolExp2","未填写");
        }
        if(resume.getWorkExperiences()!=null&&resume.getWorkExperiences().size()!=0){
            map.put("compName1",resume.getWorkExperiences().get(0).getCompanyName());
            map.put("begin1",resume.getWorkExperiences().get(0).getBeginTime());
            map.put("post1",resume.getWorkExperiences().get(0).getCompanyPost());
            map.put("end1",resume.getWorkExperiences().get(0).getEndTime());
            map.put("trade1",resume.getWorkExperiences().get(0).getDuties());
            map.put("performace1",resume.getWorkExperiences().get(0).getPerformance());
        }else{
            map.put("compName1","未填写");
            map.put("begin1","未填写");
            map.put("post1","未填写");
            map.put("end1","未填写");
            map.put("trade1","未填写");
            map.put("performace1","未填写");
        }

        if(resume.getWorkExperiences().size()==2){
            map.put("compName2",resume.getWorkExperiences().get(1).getCompanyName());
            map.put("begin2",resume.getWorkExperiences().get(1).getBeginTime());
            map.put("post2",resume.getWorkExperiences().get(1).getCompanyPost());
            map.put("end2",resume.getWorkExperiences().get(1).getEndTime());
            map.put("trade2",resume.getWorkExperiences().get(1).getDuties());
            map.put("performace2",resume.getWorkExperiences().get(1).getPerformance());
        }else{
            map.put("compName2","未填写");
            map.put("begin2","未填写");
            map.put("post2","未填写");
            map.put("end2","未填写");
            map.put("trade2","未填写");
            map.put("performace2","未填写");
        }

        if(resume.getProjectExperiences()!=null&&resume.getProjectExperiences().size()!=0){
            map.put("projectName1",resume.getProjectExperiences().get(0).getProName());
            map.put("proBegin1",resume.getProjectExperiences().get(0).getProBeginTime());
            map.put("proPost1",resume.getProjectExperiences().get(0).getProPost());
            map.put("proEnd1",resume.getProjectExperiences().get(0).getProEndTime());
            map.put("proDes1",resume.getProjectExperiences().get(0).getProDescription());
            map.put("proWork1",resume.getProjectExperiences().get(0).getProPerformance());
        }else{
            map.put("projectName1","未填写");
            map.put("proBegin1","未填写");
            map.put("proPost1","未填写");
            map.put("proEnd1","未填写");
            map.put("proDes1","未填写");
            map.put("proWork1","未填写");
        }


        if(resume.getProjectExperiences().size()==2){
            map.put("projectName2",resume.getProjectExperiences().get(1).getProName());
            map.put("proBegin2",resume.getProjectExperiences().get(1).getProBeginTime());
            map.put("proPost2",resume.getProjectExperiences().get(1).getProPost());
            map.put("proEnd2",resume.getProjectExperiences().get(1).getProEndTime());
            map.put("proDes2",resume.getProjectExperiences().get(1).getProDescription());
            map.put("proWork2",resume.getProjectExperiences().get(1).getProPerformance());
        }else{
            map.put("projectName2","未填写");
            map.put("proBegin2","未填写");
            map.put("proPost2","未填写");
            map.put("proEnd2","未填写");
            map.put("proDes2","未填写");
            map.put("proWork2","未填写");
        }
        WordUtil wordUtil = new WordUtil();
        System.out.println(photoPath+resume.getPhoto()+"我的");
        String imageBase = wordUtil.getImageBase(photoPath+resume.getPhoto());
        System.out.println(imageBase);
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
        backUser.setPwd(MD5Utils.md5(backUser.getPwd()));
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

    @Override
    public String changeFeeStand(int standID) {
        int n = parameterMapper.changeFeeStand(standID);
        return n>0? "1":"2";
    }

    @Override
    public String openFee(int standID) {
        int n = parameterMapper.changeFeeStand(standID);
        if(n>0){
          String msg = parameterMapper.findDownFee(56).getParamValues();
          return msg;
        }else{
          return "failed";
        }

    }

    @Override
    public String judgeResumeShowOrHidden() {
        Parameter  parameter = parameterMapper.findDownFee(57);
        return parameter.getParamValues();
    }

    @Override
    public String downFeeResume(HttpServletRequest request) {
        BackUser backUser = (BackUser)request.getSession().getAttribute("admin");
        long fee = Long.parseLong(parameterMapper.findDownFee(56).getParamValues());
        PayRecord payRecord = new PayRecord(fee,backUser.getbUserId(),"下载简历","减少");
        if(backUser.getBalance()<fee) return "1";
        long newBanlace = (backUser.getBalance()-fee);
        backUserMapper.updateBalance(newBanlace,backUser.getbUserId());
        payRecordMapper.addPayRecord(payRecord);
        backUser.setBalance(newBanlace);
        request.getSession().setAttribute("admin",backUser);
        return "2";
    }

    @Override
    public String findDownFee() {
        return parameterMapper.findDownFee(56).getParamValues();
    }
    @Override
    public String compfindChat(int compID) {
        List<CompRecord> list = compRecordMapper.findCompChatRec(compID);
        if(list.size()!=0){
            if(list.get(0).getIsRead()==1&&list.get(0).getCompanyId()==0){
                compRecordMapper.readUserMsg(compID, (int) list.get(0).gettUserId());
            }
        }
        return new Gson().toJson(list);
    }

    @Override
    public String findChatRec(int compID, int userID) {
        List<CompRecord> list = compRecordMapper.findChatRec(compID,userID);
        return new Gson().toJson(list);
    }

    @Override
    public String userFindChat(int userID) {
        List<CompRecord> list = compRecordMapper.getChatComp(userID);
        return new Gson().toJson(list);
    }

    @Override
    public String findChatRecs(int compID, int userID) {
        List<CompRecord> list = compRecordMapper.findChatRecs(compID,userID);
        return new Gson().toJson(list);
    }

    @Override
    public int addCompRec(CompRecord compRecord) {
        return compRecordMapper.addCompRec(compRecord);
    }

    @Override
    public int readUserMsg(int compID, int userID) {
        return compRecordMapper.readUserMsg(compID,userID);
    }

    @Override
    public int readCompMsg(int compID, int userID) {
        return compRecordMapper.readCompMsg(compID,userID);
    }

    @Override
    public int changeFee(String money) {
        return parameterMapper.changeFee(money);
    }

    @Override
    public void test() {
//        Map<String, Object> map = new HashMap<>();
//        map.put("compID",3);
//        map.put("standID",20);
//        map.put("offset",0);
//        map.put("limit",5);
//        List<Delivery> allResume = deliveryMapper.findAllResume(map);
//        System.out.println("allress"+allResume.size());
//        for (Delivery delivery : allResume) {
//            System.out.println(delivery);
//            System.out.println(delivery.getResume());
//        }
    }


}
