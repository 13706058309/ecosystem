package com.cykj.service;

import com.cykj.entity.CerRecord;
import org.apache.ibatis.annotations.Param;

public interface CerRecordService {
    /**
     *
     * @param userid
     * @param fileid
     * @return 查询用户该证件最新申请记录
     */
    public CerRecord findcerRecordid(long userid,long fileid);


    /**
     *
     * @param cerRecord
     * @return 增加用户申请记录
     */
    public int insertCerRecord(CerRecord cerRecord);
}
