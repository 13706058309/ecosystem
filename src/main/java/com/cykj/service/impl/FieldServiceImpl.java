package com.cykj.service.impl;

import com.cykj.entity.Field;
import com.cykj.mapper.FieldMapper;
import com.cykj.service.FieldService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FieldServiceImpl implements FieldService {
    @Resource
    FieldMapper fieldMapper;

    @Override
    public List<Field> selectAllFieldName() {
        return fieldMapper.selectAllFieldName();
    }
}
