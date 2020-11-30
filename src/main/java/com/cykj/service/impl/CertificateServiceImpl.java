package com.cykj.service.impl;

import com.cykj.entity.Certificate;
import com.cykj.entity.Field;
import com.cykj.entity.TableInfo;
import com.cykj.mapper.CerRecordMapper;
import com.cykj.mapper.CertificateMapper;
import com.cykj.service.CertificateService;
import javafx.scene.control.Tab;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CertificateServiceImpl implements CertificateService {
    @Resource
    CertificateMapper certificateMapper;
    @Resource
    CerRecordMapper cerRecordMapper;
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
     * @param field
     * @return 增加证书类型
     */
    @Override
    public int insertfield(Field field) {
        int n=0;
       int c = certificateMapper.insertfield(field);
       if (c>0){
           n=cerRecordMapper.findzssqlastid();
       }
        return n;
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

    /**
     * @param page
     * @param limit
     * @查到总数
     */
    @Override
    public List<Certificate> findAll(String page, String limit) {
        Map map = new HashMap<String,String>();
        map.put("page",page);
        map.put("limit",limit);
        return certificateMapper.findAll(map);
    }

    /**
     * 删除证书
     *
     * @param cerId
     */
    @Override
    public int deleteZs(int cerId) {
        int result = certificateMapper.deleteZs(cerId);
        return result;
    }


}
