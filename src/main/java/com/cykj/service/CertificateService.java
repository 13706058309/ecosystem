package com.cykj.service;


import com.cykj.entity.Certificate;
import com.cykj.entity.Field;
import com.cykj.entity.TableInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

public interface CertificateService {

    /**
     * @return
     * @param获取证书首页列表
     */
    public List<Certificate> findcertificatelist();

    /**
     *
     * @param fieldid
     * @return 返回证书对象获取证书费用
     */
    public Certificate findCerFee(String fieldid);


    /**
     *
     * @param map
     * @return 后台证书列表
     */
    public List<Certificate> findbackcertificatelist(Map<String, Object> map);

    /**
     *
     * @param map
     * @return 后台证书列表长度
     */
    public int findbackcertificatelistsize(Map<String, Object> map);

    /**
     *
     * @param fieldName
     * @return 双向验证测试
     */
    public int finduname(String fieldName);


    /**
     *
     * @param cerShowState
     * @param cerId
     * @return 上架下架
     */
    public int upcershowState(int cerShowState,long cerId);


    /**
     *
     * @param fieldName
     * @return 增加证书类型
     */
    public int insertfield(@Param("fieldName")String fieldName);


    /**
     *
     * @param fieldName
     * @return 证书类型
     */
    public Field findfieldid(String fieldName);

    /**
     *
     * @param certificate
     * @return 增加证书
     */
    public int insertcertificate(Certificate certificate);


    /**
     *
     * @param map
     * @return 修改证书参数
     */
    public int upbackzhengshu(Map<String, Object> map);

    /**
     *
     * @param cerRequirement
     * @param cerId
     * @return 修改证书需求
     */
    public int upbackzhengshuxuqiu(@Param("cerRequirement")String cerRequirement,@Param("cerId")String cerId);



    /**
     *
     * @证书分页
     */
   public List<Certificate> findAll(String page,String limit);

    /**
     * 删除证书
     */
    int deleteZs(int cerId);
}