package com.cykj.service.impl;

import com.cykj.entity.BackUser;
import com.cykj.entity.BackUserNum;
import com.cykj.mapper.BackUserMapper;
import com.cykj.service.CompanyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Resource
    private BackUserMapper backUserMapper;

    @Override
    public List<BackUser> findCompany() {
        List<BackUser> backUserList = backUserMapper.findCompany();
        return backUserList;
    }
}
