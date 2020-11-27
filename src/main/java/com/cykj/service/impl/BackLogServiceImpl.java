package com.cykj.service.impl;

import com.cykj.mapper.BackLogMapper;
import com.cykj.service.BackLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class BackLogServiceImpl implements BackLogService {
    @Resource
    BackLogMapper backLogMapper;
    @Override
    public void insertLog(int buserid, String matter) {
        backLogMapper.insertLog(buserid,matter);
    }
}
