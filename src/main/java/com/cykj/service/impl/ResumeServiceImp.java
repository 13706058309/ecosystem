package com.cykj.service.impl;

import com.cykj.entity.Resume;
import com.cykj.mapper.JianliMapper;
import com.cykj.service.ResumeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service
public class ResumeServiceImp implements ResumeService {
    @Resource
    private JianliMapper jianliMapper;
    @Override
    public Resume resume(long userid) {
        return jianliMapper.resume(userid);
    }
}
