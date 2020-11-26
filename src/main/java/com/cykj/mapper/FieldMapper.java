package com.cykj.mapper;

import com.cykj.entity.Field;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
/**
 * 领域
 */
public interface FieldMapper {
    public List<Field> selectAllFieldName();
}
