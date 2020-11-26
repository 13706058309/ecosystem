package com.cykj.service.impl;

import com.cykj.entity.Certificate;
import com.cykj.entity.Field;
import com.cykj.mapper.CertificateMapper;
import com.cykj.service.CertificateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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

        int fid = Integer.parseInt(fieldid);
        return certificateMapper.findCerFee(fid);
    }

    /**
     * @param map
     * @return 后台证书列表
     */
    @Override
    public List<Certificate> findbackcertificatelist(Map<String, Object> map) {
        return certificateMapper.findbackcertificatelist(map);
    }

    /**
     * @param map
     * @return 后台证书列表长度
     */
    @Override
    public int findbackcertificatelistsize(Map<String, Object> map) {
        return certificateMapper.findbackcertificatelistsize(map);
    }

    /**
     * @param fieldName
     * @return 双向验证测试
     */
    @Override
    public int finduname(String fieldName) {
        return certificateMapper.finduname(fieldName);
    }

    /**
     * @param cerShowState
     * @param cerId
     * @return 上架下架
     */
    @Override
    public int upcershowState(int cerShowState, long cerId) {
        return certificateMapper.upcershowState(cerShowState,cerId);
    }

    /**
     * @param fieldName
     * @return 增加证书类型
     */
    @Override
    public int insertfield(String fieldName) {
        return certificateMapper.insertfield(fieldName);
    }

    /**
     * @param fieldName
     * @return 证书类型
     */
    @Override
    public Field findfieldid(String fieldName) {
        return certificateMapper.findfieldid(fieldName);
    }

    /**
     * @param certificate
     * @return 增加证书
     */
    @Override
    public int insertcertificate(Certificate certificate) {
        return certificateMapper.insertcertificate(certificate);
    }

    /**
     * @param map
     * @return 修改证书参数
     */
    @Override
    public int upbackzhengshu(Map<String, Object> map) {
        return certificateMapper.upbackzhengshu(map);
    }

    /**
     * @param cerRequirement
     * @param cerId
     * @return 修改证书需求
     */
    @Override
    public int upbackzhengshuxuqiu(String cerRequirement, String cerId) {
        return certificateMapper.upbackzhengshuxuqiu(cerRequirement,cerId);
    }
}
