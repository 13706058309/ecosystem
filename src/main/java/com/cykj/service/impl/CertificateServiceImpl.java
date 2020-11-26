package com.cykj.service.impl;

import com.cykj.entity.Certificate;
import com.cykj.entity.TableInfo;
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
