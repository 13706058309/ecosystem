package com.cykj.mapper;


import com.cykj.entity.CerRecord;
import com.cykj.entity.Field;
import com.cykj.entity.Parameter;
import com.cykj.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
/**
 * 证书申请记录
 */
public interface CerRecordMapper {
    //查询用户该证件最新申请记录
    public CerRecord findcerRecordid(@Param("userid") long userid,@Param("fileid") long fileid);
    //增加用户申请记录
    public int insertCerRecord(CerRecord cerRecord);
}


