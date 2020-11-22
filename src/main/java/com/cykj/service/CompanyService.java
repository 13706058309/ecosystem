package com.cykj.service;

import com.cykj.entity.BackUser;
import com.cykj.entity.BackUserNum;

import java.util.List;
import java.util.Map;

public interface CompanyService {

//    查询所有公司信息
    public List<BackUser> findCompany(Map map);
    public List<BackUser> findCount(Map map);

}
