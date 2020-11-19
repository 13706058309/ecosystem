package com.cykj.service.impl;

import com.cykj.entity.Certificate;
import com.cykj.mapper.CertificateMapper;
import com.cykj.service.CertificateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CertificateServiceImpl implements CertificateService {
    @Resource
    CertificateMapper certificateMapper;
    /**
     * @return
     * @param获取证书首页列表
     */
    @Override
    public List<Certificate> findcertificatelist() {

        return certificateMapper.findcertificatelist();
    }

    /**
     * @param fieldid
     * @return 返回证书对象获取证书费用
     */
    @Override
    public Certificate findCerFee(String fieldid) {

        return certificateMapper.findCerFee(Integer.parseInt(fieldid));
    }
}
