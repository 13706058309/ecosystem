package com.cykj.service;

import com.cykj.entity.StudyData;
import com.cykj.entity.Unit;

import java.util.List;

public interface UnitService {
    public List<Unit> selectUnitsByCourseId(String courseId);
    public List<StudyData> selectUnitFileByUnitId(String unitId);
    public List<Unit> selectUnitsByUnitId(String unitId);
    public Unit selectUnitInfoByUnitId(String unitId);
}
