package com.cykj.mapper;

import com.cykj.entity.Certificate;
import com.cykj.entity.Field;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

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
}
