package com.cykj.service;


import com.cykj.entity.Certificate;
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
     * @param fieldid
     * @return 返回证书对象获取证书费用
     */
    public Certificate findCerFee(String fieldid);


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