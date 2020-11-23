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
     * @param map
     * @return 后台测试阶段的集合
     */
    @Override
    public List<CerRecord> findcerCSlist(Map<String, Object> map) {
        return cerRecordMapper.findcerCSlist(map);
    }

    /**
     * @param
     * @return 后台测试阶段的集合长度
     */
    @Override
    public int findcerCSlistsize() {
        return cerRecordMapper.findcerCSlistsize();
    }

    /**
     * @param cerTestReport
     * @param cerRecordId
     * @return 后台测试阶段的修改测试报告路径
     */
    @Override
    public int upcertestreport(String cerTestReport, String cerRecordId) {
        return cerRecordMapper.upcertestreport(cerTestReport,cerRecordId);
    }

    /**
     * @param cerTestScore
     * @param cerRecordId
     * @return 后台测试阶段的修改测试分数
     */
    @Override
    public int upcertestrescore(String cerTestScore,String stateId,String cerRecordId) {
        return cerRecordMapper.upcertestrescore(cerTestScore,stateId,cerRecordId);
    }

    /**
     * @param map
     * @return 后台评审证书项目集合带时间和证书类型条件
     */
    @Override
    public List<CerRecord> findcerPSlist(Map<String, Object> map) {
        return cerRecordMapper.findcerPSlist(map);
    }

    /**
     * @param findmap
     * @return 后台评审证书项目集合列表长度
     */
    @Override
    public int findcerPSlistsize(Map<String, Object> findmap) {
        return cerRecordMapper.findcerPSlistsize(findmap);
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

    /**
     * 修改审核状态
     *
     * @param map
     */
    @Override
    public int upSta(Map<String, Object> map) {
        int result = cerRecordMapper.upSta(map);
        return result;
    }

    /**
     * 搜索
     *
     * @param map
     */
    @Override
    public int search(Map<String, Object> map) {
        int n = cerRecordMapper.search(map);
        return n;
    }
}
