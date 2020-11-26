package com.cykj.mapper;

import com.cykj.entity.Certificate;
import com.cykj.entity.Field;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 * 证书
 */
public interface CertificateMapper {

    //获取首页证书列表
    public List<Certificate> findcertificatelist();
    //获取该证书费用
    public Certificate findCerFee(@Param("fieldid") int fieldid);

    //后台证书列表
    public List<Certificate> findbackcertificatelist(Map<String, Object> map);

    //后台证书列表长度
    public int findbackcertificatelistsize(Map<String, Object> map);
    //双向验证测试
    public int finduname(@Param("fieldName")String fieldName);

    //上架下架
    public int upcershowState(@Param("cerShowState")int cerShowState,@Param("cerId")long cerId);

    //增加证书类型
    public int insertfield(@Param("fieldName")String fieldName);

    //证书类型
    public Field findfieldid(@Param("fieldName")String fieldName);
    //增加证书
    public int insertcertificate(Certificate certificate);
    //修改证书参数
    public int upbackzhengshu(Map<String, Object> map);
    //修改证书需求
    public int upbackzhengshuxuqiu(@Param("cerRequirement")String cerRequirement,@Param("cerId")String cerId);
}
