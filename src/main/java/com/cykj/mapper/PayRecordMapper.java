package com.cykj.mapper;

import com.cykj.entity.PayRecord;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface PayRecordMapper {
    int addPayRecord(PayRecord payRecord);
}
