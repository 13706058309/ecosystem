package com.cykj.service.impl;

import com.cykj.entity.CerRecord;
import com.cykj.mapper.CerRecordMapper;
import com.cykj.service.CerRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CerRecordServiceImpl implements CerRecordService {

    @Resource
    CerRecordMapper cerRecordMapper;
    /**
     * @param userid
     * @param fileid
     * @return 查询用户该证件最新申请记录
     */
    @Override
    public CerRecord findcerRecordid(long userid, long fileid) {

        return cerRecordMapper.findcerRecordid(userid,fileid);
    }

    /**
     * @param cerRecord
     * @return 增加用户申请记录
     */
    @Override
    public int insertCerRecord(CerRecord cerRecord) {

        return cerRecordMapper.insertCerRecord(cerRecord);
    }
}
