package com.cykj.service.impl;

import com.cykj.entity.CerRecord;
import com.cykj.mapper.CerRecordMapper;
import com.cykj.service.CerRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /**
     * @return拿到最近加入的id
     */
    @Override
    public int findzssqlastid() {
        return cerRecordMapper.findzssqlastid();
    }

    /**
     * @param map
     * @return 个人中心返回申请证书列表带时间和证书类型条件
     */
    @Override
    public List<CerRecord> findcersqlist(Map<String, Object> map) {
        return cerRecordMapper.findcersqlist(map);
    }

    /**
     * @param userid
     * @return 证书开发阶段的集合
     */
    @Override
    public List<CerRecord> findcerKFList(String userid) {

        return cerRecordMapper.findcerKFList(userid);
    }

    /**
     * @param findmap
     * @return 个人中心返回申请证书列表长度
     */
    @Override
    public int findcersqlistsize(Map<String, Object> findmap) {
        return cerRecordMapper.findcersqlistsize(findmap);
    }

    /**
     * @param stateId
     * @param cerRecordId
     * @return 修改状态为申请失败
     */
    @Override
    public int upcersqstandid(long stateId, long cerRecordId) {
        return cerRecordMapper.upcersqstandid(stateId,cerRecordId);
    }

    /**
     * @param cerRecordId
     * @return 通过id拿到申请证书记录对象
     */
    @Override
    public CerRecord findcerRecordup(String cerRecordId) {
        return cerRecordMapper.findcerRecordup(cerRecordId);
    }

    /**
     * @param docUrl
     * @param stateId
     * @param cerRecordId @return 增加项目文件上传地址
     */
    @Override
    public int upcerdocurl(String docUrl, String stateId, String cerRecordId) {
        return cerRecordMapper.upcerdocurl(docUrl,stateId,cerRecordId);
    }

    /**
     * 查询记录分页
     *
     * @param page
     * @param limit
     */
    @Override
    public List<CerRecord> allPage(String page, String limit) {
        Map map = new HashMap<String,String>();
        map.put("page",page);
        map.put("limit",limit);
        return cerRecordMapper.allPage(map);
    }
}
