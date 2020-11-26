package com.cykj.service;

import com.cykj.entity.CerUser;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface CerUserService {
    /**
     *
     * @param userid
     * @return查询用户已获得的证书集合
     */
    public List<CerUser> findceruserlist(@RequestParam("userid") long userid);


    /**
     *
     * @return 后台人员查询已获得证书
     */
    public List<CerUser> backfindceruserlist(Map<String, Object> map);


    /**
     *
     * @param map
     * @return 后台人员查询已获得证书总长度
     */
    public int findceruserlistsize(Map<String, Object> map);
}
