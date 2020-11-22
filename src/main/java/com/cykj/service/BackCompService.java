package com.cykj.service;

import com.cykj.entity.*;

import java.util.List;
import java.util.Map;

public interface BackCompService {
    //查找高校推荐人才的信息
    TableInfo findUnviTalent(Map<String,Object> map);
    //删除高校推荐的人才
    int delUnviTalent(int standID,int compAndTalId);
    //查找所有的行业
    List<Industry> findAll();
    //通过行业ID查找对应的所有部门
    List<Depart> findDepartByID(int industryID);
    //通过部门ID查找岗位
    List<Position> findPositionByID(int dapartID);
    //查找所有的省份
    List<Province> findAllProvince();
    //通过省份ID查找到所有的市
    List<City> findCityByID(int provinceID);
    //发布岗位
    String postPosition(PostPosition postPosition);
    //重新发布岗位
    String rePostPosition(PostPosition postPosition);

    //企业查询发布的岗位
    TableInfo findPosition(Map<String,Object> map);
    //修改状态
    int changePostPositionStand(Map<String,Object> map);
    //查找企业收到的简历
    TableInfo findAllResume(Map<String,Object> map);
    //批量改变投机企业简历的状态
    int changeDeliStand(List<Resume> list,int standID);
    //改变企业简历状态
    int changeDeliStand(int deliID,int standID);
    //企业删除应聘者简历
    int delResume(int deliID,int standID);
    //企业批量删除应聘者简历
    int delResume(List<Resume> list,int standID);
    //企业通知应聘者面试
    int passResume(int deliID,int standID,String msg);
    //通过ID查找岗位名字
    String findPostName(int postID);
    //修改企业发布岗位信息
    String updatePostPosition(PostPosition postPosition);
    //企业查询用户简历
    TableInfo findUserResume(Map<String,Object> map);
    //查找简历具体信息
    Resume findResumeDetail(int resumeID);
    //查找公司完整信息
    BackUser findCompByID(int compID);
    //修改公司信息
    String changeCompInfo(Map<String,Object> map);
    //修改密码
    String changePwd(String newPwd, String pwd,int compID);
    //查找高校人才信息
    Talent findTalentByID(int talentID);
    //简历导出
    String outResume(int resumeID,String savePath);
    //通过手机号找用户
    BackUser findByPhone(String phone);
    //修改密码
    int changePwdByPhone( String pwd,String phone);
    //通过账号找公司
    BackUser findCompByAcc(String account);
    //公司注册
    int RegComp(BackUser backUser,int industryID);
    //判断是否开启收费
    String judegCharse();
}
