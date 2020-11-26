package com.cykj.service;

import com.cykj.entity.CerRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

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

    /**
     *
     * @return拿到最近加入的id
     */
    public int findzssqlastid();
    /**
     *
     * @param map
     * @return 个人中心返回申请证书列表带时间和证书类型条件
     */
    public List<CerRecord> findcersqlist(Map<String, Object> map);
    /**
     *
     * @param userid
     * @return 证书开发阶段的集合
     */
    public List<CerRecord> findcerKFList(String userid);
    /**
     *
     * @param findmap
     * @return 个人中心返回申请证书列表长度
     */
    public  int findcersqlistsize(Map<String, Object> findmap);

    /**
     *
     * @param stateId
     * @param cerRecordId
     * @return  修改状态为申请失败
     */
    public int upcersqstandid(long stateId,long cerRecordId);


    /**
     *
     * @param cerRecordId
     * @return 通过id拿到申请证书记录对象
     */
    public  CerRecord findcerRecordup(String cerRecordId);

    /**
     *@param cerRecordId
     * @param docUrl
     * @return 增加项目文件上传地址
     */
    public  int upcerdocurl(String docUrl,String stateId,String cerRecordId);


    /**
     *
     * @param map
     * @return 后台测试阶段的集合
     */
    public List<CerRecord> findcerCSlist(Map<String, Object> map);

    /**
     *
     * @param
     * @return 后台测试阶段的集合长度
     */
    public int findcerCSlistsize();


    /**
     *@param cerRecordId
     * @param cerTestReport
     * @return 后台测试阶段的修改测试报告路径
     */
    public int upcertestreport(String cerTestReport,String cerRecordId);
    /**
     *@param cerRecordId
     * @param cerTestScore
     * @return 后台测试阶段的修改测试分数
     */
    public int upcertestrescore(String cerTestScore,String stateId,String cerRecordId);


    /**
     *
     * @param map
     * @return 后台评审证书项目集合带时间和证书类型条件
     */
    public List<CerRecord> findcerPSlist(Map<String, Object> map);

    /**
     *
     * @param findmap
     * @return 后台评审证书项目集合列表长度
     */
    public  int findcerPSlistsize(Map<String, Object> findmap);

    /**
     *
     * @param findmap
     * @return 评审后修改状态报告视频分数
     */
    public  int upcerpingshencaozuo(Map<String, Object> findmap);


    /**
     *
     * @param map
     * @return 后台评审证书项目集合带时间和证书类型条件
     */
    public List<CerRecord> findbackSQlist(Map<String, Object> map);

    /**
     *
     * @param findmap
     * @return 后台评审证书项目集合列表长度
     */
    public  int findbackSQlistsize(Map<String, Object> findmap);

    /**
     * 查询记录分页
     */
    public List<CerRecord> allPage(String page, String limit);

    /**
     * 修改审核状态
     */
    int upSta(Map<String,Object> map);

    /**
     * 搜索
     */
    int search(Map<String,Object> map);
}
