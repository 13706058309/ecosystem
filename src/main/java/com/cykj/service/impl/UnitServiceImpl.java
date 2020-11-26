package com.cykj.service.impl;

import com.cykj.entity.StudyData;
import com.cykj.entity.Unit;
import com.cykj.mapper.UnitMapper;
import com.cykj.service.UnitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UnitServiceImpl implements UnitService {
    @Resource
    UnitMapper unitMapper;

    @Override
    public List<Unit> selectUnitsByCourseId(String courseId) {
        return unitMapper.selectUnitsByCourseId(Long.parseLong(courseId));
    }

    @Override
    public List<StudyData> selectUnitFileByUnitId(String unitId){
        return unitMapper.selectUnitFileByUnitId(Long.parseLong(unitId));
    }

    @Override
    public List<Unit> selectUnitsByUnitId(String unitId){
        return unitMapper.selectUnitsByUnitId(Long.parseLong(unitId));
    }

    @Override
    public Unit selectUnitInfoByUnitId(String unitId) {
        return unitMapper.selectUnitInfoByUnitId(Long.parseLong(unitId));
    }
}
