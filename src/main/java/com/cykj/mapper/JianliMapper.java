package com.cykj.mapper;

import com.cykj.entity.Resume;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface JianliMapper {
    public Resume resume(@Param("userid")long userid);
}
