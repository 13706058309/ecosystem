package com.cykj.mapper;

import com.cykj.entity.StudyData;
import com.cykj.entity.Unit;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
/**
 * 章节
 */
public interface UnitMapper {
    public List<Unit> selectUnitsByCourseId(long courseId);
    public List<StudyData> selectUnitFileByUnitId(long unitId);
    public List<Unit> selectUnitsByUnitId(long unitId);
    public Unit selectUnitInfoByUnitId(long unitId);
}
