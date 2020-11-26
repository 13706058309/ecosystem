package com.cykj.mapper;

import com.cykj.entity.Indent;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface IndentMapper {
    int addOrder(Indent indent);
}
