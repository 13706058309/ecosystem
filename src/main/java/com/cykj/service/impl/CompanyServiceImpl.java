package com.cykj.service.impl;

import com.cykj.entity.BackUser;
import com.cykj.entity.BackUserNum;
import com.cykj.entity.PostPosition;
import com.cykj.mapper.BackUserMapper;
import com.cykj.mapper.PostPositionMapper;
import com.cykj.service.CompanyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Resource
    private BackUserMapper backUserMapper;

    @Resource
    private PostPositionMapper postPositionMapper;

    @Override
    public List<BackUser> findCompany(Map map) {
        List<BackUser> backUserList = backUserMapper.findCompany(map);
        return backUserList;
    }

    @Override
    public List<BackUser> findCount(Map map) {
        return backUserMapper.findCount(map);
    }

    @Override
    public BackUser findProfile(int bUserId) {
        BackUser backUser = backUserMapper.findProfile(bUserId);
        return backUser;
    }

    @Override
    public List<PostPosition> findPost(int bUserId) {
        List<PostPosition> positionList = postPositionMapper.findPost(bUserId);
        return positionList;
    }


}
