package com.cykj.mapper;

import com.cykj.entity.Depart;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
/**
 * 部门
 */
public interface DepartMapper {
    List<Depart> findDepartByID(int industryID);
}
