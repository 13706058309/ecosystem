package com.cykj.service;


import com.cykj.entity.Certificate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CertificateService {

    /**
     * @param获取证书首页列表
     * @return
     */
    public List<Certificate> findcertificatelist();

    /**
     *
     * @param fieldid
     * @return 返回证书对象获取证书费用
     */
    public Certificate findCerFee(String fieldid);
}
