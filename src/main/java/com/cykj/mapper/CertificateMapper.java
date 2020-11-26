package com.cykj.mapper;

import com.cykj.entity.Certificate;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
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
    //证书分页
    List<Certificate> findAll(Map<String,Object> page);
    //删除证书
    int deleteZs(int cerId);
}
