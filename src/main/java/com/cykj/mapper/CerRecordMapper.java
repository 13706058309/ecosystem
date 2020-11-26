package com.cykj.mapper;


import com.cykj.entity.CerRecord;
import com.cykj.entity.Field;
import com.cykj.entity.Parameter;
import com.cykj.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    //拿到最近加入的id
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
    public List<CerRecord> findcerKFList(@Param("userid") String userid);
    /**
     *
     * @param findmap
     * @return 个人中心返回申请证书列表长度
     */
    public  int findcersqlistsize(Map<String, Object> findmap);

    //修改状态为申请失败
    public int upcersqstandid(@Param("stateId") long stateId,@Param("cerRecordId") long cerRecordId);

    /**
     *
     * @param cerRecordId
     * @return 通过id拿到申请证书记录对象
     */
    public  CerRecord findcerRecordup(@Param("cerRecordId") String cerRecordId);

    /**
     *@param cerRecordId
     * @param docUrl
     * @return 增加项目文件上传地址
     */
    public  int upcerdocurl(@Param("docUrl") String docUrl,@Param("stateId") String stateId,@Param("cerRecordId") String cerRecordId);

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
    public int upcertestreport(@Param("cerTestReport") String cerTestReport,@Param("cerRecordId") String cerRecordId);
    /**
     *@param cerRecordId
     * @param cerTestScore
     * @return 后台测试阶段的修改测试分数
     */
    public int upcertestrescore(@Param("cerTestScore") String cerTestScore,@Param("stateId") String stateId,@Param("cerRecordId") String cerRecordId);
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
     * 查询记录分页
     */
    List<CerRecord> allPage(Map<String,Object> page);


    /**
     * 修改审核状态
     */
    int upSta(Map<String,Object> map);

    /**
     * 搜索
     */
    int search(Map<String,Object> map);
}


