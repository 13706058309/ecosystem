package com.cykj.service;

import com.cykj.entity.BackUser;
import com.cykj.entity.BackUserNum;
import com.cykj.entity.PostPosition;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CompanyService {

//    查询所有公司信息
    public List<BackUser> findCompany(Map map);
    public List<BackUser> findCount(Map map);

//    根据ID查公司简介
    public BackUser findProfile(int bUserId);

//    根据企业id查找岗位信息
    public List<PostPosition> findPost(int bUserId);

}
