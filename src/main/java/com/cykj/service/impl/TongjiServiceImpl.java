package com.cykj.service.impl;


import com.cykj.entity.BackUserNum;
import com.cykj.mapper.TongjiMapper;
import com.cykj.service.TongjiService;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@Component
public class TongjiServiceImpl implements TongjiService {

    @Resource
    private TongjiMapper tongjiMapper;

    @Override
    public List<BackUserNum> userNumWeek() {
        return tongjiMapper.userNumWeek();
    }

    @Override
    public List<BackUserNum> userNumMonth() {
        return tongjiMapper.userNumMonth();
    }

    @Override
    public List<BackUserNum> userNumHalfYear() {
        return tongjiMapper.userNumHalfYear();
    }

    @Override
    public List<BackUserNum> adminNumWeek() {
        return tongjiMapper.adminNumWeek();
    }

    @Override
    public List<BackUserNum> adminNumMon() {
        return tongjiMapper.adminNumMon();
    }

    @Override
    public List<BackUserNum> adminNumHalfYear() {
        return tongjiMapper.adminNumHalfYear();
    }
}
